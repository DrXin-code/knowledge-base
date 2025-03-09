#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include "timer.h"
#include "check.h"
#include <cuda_runtime.h>
#include "assert.h"

#include <device_launch_parameters.h>

#define MAX_THREAD_PER_BLOCK 1024//GTX1080 每个block最多的线程数
#define THREAD_PER_BLOCK (1024)//每个block中的线程数
#define SCALE 32//为一个body计算信息的thread数量
#define SLICE_PER_BLOCK (THREAD_PER_BLOCK/SCALE)//一个block中同时会计算多少个body
//#define OPTION
int N;
#ifdef OPTION
#define X(arr,i) (arr[(i)*3])
#define Y(arr,i) (arr[(i)*3+1])
#define Z(arr,i) (arr[(i)*3+2])
#else

#define X(arr,i) (arr[i])
#define Y(arr,i) (arr[N+i])
#define Z(arr,i) (arr[N*2+i])
#endif
int SHARED_MEM_PER_BLOCK = 12 * 4096;//共享内存的最大大小

#define SOFTENING 1e-9f


#define CHECK(call)                                                       \
{                                                                         \
   const cudaError_t error = call;                                        \
   if (error != cudaSuccess)                                              \
   {                                                                      \
      printf("Error: %s:%d, ", __FILE__, __LINE__);                       \
      printf("code:%d, reason: %s\n", error, cudaGetErrorString(error));  \
      exit(1);                                                            \
   }                                                                      \
}
/*
 * Each body contains x, y, and z coordinate positions,
 * as well as velocities in the x, y, and z directions.
 */

typedef struct { float x, y, z, vx, vy, vz; } Body;

/*
 * Do not modify this function. A constraint of this exercise is
 * that it remain a host function.
 */

void randomizeBodies(float *data, int n) {
    for (int i = 0; i < n; i++) {
        data[i] = 2.0f * (rand() / (float)RAND_MAX) - 1.0f;
    }
}

/*
 * This function calculates the gravitational impact of all bodies in the system
 * on all others, but does not update their positions.
 */

__global__ void bodyForce(float *p, float *v, float *p_o, float *v_o, Body *bodies, float dt, int n,bool isfinal) {
   int N = n;
    __shared__ float ps[4096 * 3];//声明共享内存
    int i = (blockIdx.x *THREAD_PER_BLOCK)/SCALE+threadIdx.x%SLICE_PER_BLOCK;//SCALE个thread共同计算一个body的受力, 此处计算body的id
    int offset = (threadIdx.x)/SLICE_PER_BLOCK;//第offset个thread去计算第i个body


    for (int k = 0;k<n; k+=THREAD_PER_BLOCK) {//将数据加载到共享内存, 每个block加载一份整体数据
        int tp = k + threadIdx.x;
        X(ps, tp) = X(p, tp);
        Y(ps, tp) = Y(p, tp);
        Z(ps, tp) = Z(p, tp);
    }

    __syncthreads();//block内线程同步

    float x = X(p,i), y = Y(p,i), z = Z(p,i);
    float Fx = 0.0f;
    float Fy = 0.0f;
    float Fz = 0.0f;

#pragma unroll 16
    for (int j = 0; j < n; j+=SCALE) {//每个线程分别计算受力
        float dx = X(ps, j+offset) - x;
        float dy = Y(ps, j+offset) - y;
        float dz = Z(ps, j+offset) - z;
        float distSqr = dx * dx + dy * dy + dz * dz + SOFTENING;
        float invDist = rsqrtf(distSqr);
        float invDist3 = invDist * invDist * invDist;

        Fx += dx * invDist3;
        Fy += dy * invDist3;
        Fz += dz * invDist3;
    }
    __syncthreads();
    ps[threadIdx.x] = dt*Fx;//重复利用共享内存, 将这个线程数据放在共享内存中
    ps[threadIdx.x+THREAD_PER_BLOCK] = dt*Fy;
    ps[threadIdx.x+THREAD_PER_BLOCK*2] = dt*Fz;

    if(offset)return;//每个body只保留一个thread去收集计算结果
    __syncthreads();

    Fx =X(v,i);
    Fy =Y(v,i);
    Fz =Z(v,i);
#pragma unroll 16
    for(int j=threadIdx.x;j<THREAD_PER_BLOCK;j+=SLICE_PER_BLOCK){//累计结果
        Fx+=ps[j];
        Fy+=ps[j+THREAD_PER_BLOCK];
        Fz+=ps[j+THREAD_PER_BLOCK*2];
    }
    //交替使用了两个申请在device global memory的数组, 分别代表这一轮迭代前的值和迭代后的值
    X(v_o, i) = Fx;//更新速度信息
    Y(v_o, i) = Fy;
    Z(v_o, i) = Fz;
    X(p_o, i) = x + Fx * dt;//更新位置信息
    Y(p_o, i) = y + Fy * dt;
    Z(p_o, i) = z + Fz * dt;

    if(isfinal){//如果最后一轮迭代, 输出最终位置
        bodies[i].x = x + Fx * dt;
        bodies[i].y = y + Fy * dt;
        bodies[i].z = z + Fz * dt;
    }
}

int main(const int argc, const char** argv) {

    /*
     * Do not change the value for `nBodies` here. If you would like to modify it,
     * pass values into the command line.
     */

    int nBodies = 2<<11;
    int salt = 0;
    if (argc > 1) nBodies = 2<<atoi(argv[1]);

    /*
     * This salt is for assessment reasons. Tampering with it will result in automatic failure.
     */

    if (argc > 2) salt = atoi(argv[2]);

    const float dt = 0.01f; // time step
    const int nIters = 10;  // simulation iterations

    int bytes = nBodies * sizeof(Body);
    N = nBodies;
    printf("body size: %lu\n",sizeof (Body));
    float *bufp_d[2]={nullptr};
    float *bufv_d[2]={nullptr};
    float *buf,*buf_d;

    //分配在device上的内存
    cudaMalloc((void**)&bufp_d[0], bytes/2);
    cudaMalloc((void**)&bufv_d[0], bytes/2);
    cudaMalloc((void**)&bufp_d[1], bytes/2);
    cudaMalloc((void**)&bufv_d[1], bytes/2);
    cudaMalloc((void**)&buf_d, bytes);
    buf = (float *)malloc(bytes);


    /*
     * As a constraint of this exercise, `randomizeBodies` must remain a host function.
     */

    randomizeBodies(buf, 6 * nBodies); // Init pos / vel data
    for (int i = 0; i < nBodies; i++) {
        int siz = sizeof(float);
        //将host上数据转移到device上, 调整数据位置加速获取global memory的速度
        cudaMemcpy(&X(bufp_d[0],i), buf+6*i  , siz, cudaMemcpyHostToDevice);
        cudaMemcpy(&Y(bufp_d[0],i), buf+6*i+1, siz, cudaMemcpyHostToDevice);
        cudaMemcpy(&Z(bufp_d[0],i), buf+6*i+2, siz, cudaMemcpyHostToDevice);
        cudaMemcpy(&X(bufv_d[0],i), buf+6*i+3, siz, cudaMemcpyHostToDevice);
        cudaMemcpy(&Y(bufv_d[0],i), buf+6*i+4, siz, cudaMemcpyHostToDevice);
        cudaMemcpy(&Z(bufv_d[0],i), buf+6*i+5, siz, cudaMemcpyHostToDevice);


    }
    cudaMemcpy(buf_d,buf,bytes,cudaMemcpyHostToDevice);

    double totalTime = 0.0;
    //计算block数量
    int grid_x = (nBodies+THREAD_PER_BLOCK-1)/THREAD_PER_BLOCK;

    printf("block num:%d\n",grid_x);
    /*
     * This simulation will run for 10 cycles of time, calculating gravitational
     * interaction amongst bodies, and adjusting their positions to reflect.
     */

    /*******************************************************************/
    // Do not modify these 2 lines of code.
    for (int iter = 0; iter < nIters; iter++) {
        StartTimer();
        /*******************************************************************/

        /*
         * You will likely wish to refactor the work being done in `bodyForce`,
         * as well as the work to integrate the positions.
         */
        bool isfinal = iter == nIters - 1;
        int op = iter & 1;
        //启动kernel
        bodyForce<<<grid_x*SCALE, THREAD_PER_BLOCK>>>(bufp_d[op], bufv_d[op], bufp_d[op ^ 1], bufv_d[op ^ 1], (Body *) buf_d,
                                                dt, nBodies, isfinal); // compute interbody forces
        if(isfinal) {
            //将数据从device拷贝到host上
            cudaMemcpy(buf, buf_d, bytes, cudaMemcpyDeviceToHost);
        }
        /*******************************************************************/
        // Do not modify the code in this section.
        const double tElapsed = GetTimer() / 1000.0;
        totalTime += tElapsed;
    }
    double avgTime = totalTime / (double)(nIters);
    float billionsOfOpsPerSecond = 1e-9 * nBodies * nBodies / avgTime;

#ifdef ASSESS
    checkPerformance(buf, billionsOfOpsPerSecond, salt);
#else
    checkAccuracy(buf, nBodies);
    printf("%d Bodies: average %0.3f Billion Interactions / second\n", nBodies, billionsOfOpsPerSecond);
    salt += 1;
#endif
    /*******************************************************************/

    /*
     * Feel free to modify code below.
     */

    free(buf);
    cudaFree(buf_d);
    cudaFree(bufv_d[0]);
    cudaFree(bufv_d[1]);
    cudaFree(bufp_d[0]);
    cudaFree(bufp_d[1]);
}
