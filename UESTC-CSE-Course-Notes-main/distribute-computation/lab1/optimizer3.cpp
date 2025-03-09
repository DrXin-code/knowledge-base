#include "mpi.h"
#include <math.h>
#include <stdio.h>
#include "string.h"
#include <stdlib.h>
#define MIN(a,b)  ((a)<(b)?(a):(b))
#define ull unsigned long long
int  getprime(int n,int * prime){
    bool * isnotprime = new bool [n+1];
    int ptot = 0;
    memset(isnotprime,0,sizeof(bool)*(n+1));
    isnotprime[1]=isnotprime[0]=1;
    for(int i=2;i<=n;i++){
        if(!isnotprime[i])prime[ptot++]=i;
        for(int j=0;j<ptot&&i*prime[j]<=n;j++){
            isnotprime[i*prime[j]]=true;
            if(i%prime[j]==0)break;
        }
    }
    //printf("%d %d\n",ptot,n);
    delete []isnotprime;
    return ptot;
}
int main (int argc, char *argv[])
{
    int    count;        /* Local prime count */
    double elapsed_time; /* Parallel execution time */
    int    first;        /* Index of first multiple */
    int    global_count; /* Global prime count */
    int    high_value;   /* Highest value on this proc */
    register int    i;
    int    id;           /* Process ID number */
    int    index;        /* Index of current prime */
    int    low_value;    /* Lowest value on this proc */
    register char  *marked;       /* Portion of 2,...,'n' */
    int    n;            /* Sieving from 2, ..., 'n' */
    int    p;            /* Number of processes */
    int    proc0_size;   /* Size of proc 0's subarray */
    register int    prime;        /* Current prime */
    int    size;         /* Elements in 'marked' */

    MPI_Init (&argc, &argv);

    /* Start the timer */

    MPI_Comm_rank (MPI_COMM_WORLD, &id);
    MPI_Comm_size (MPI_COMM_WORLD, &p);
    MPI_Barrier(MPI_COMM_WORLD);
    elapsed_time = -MPI_Wtime();

    if (argc != 2) {
        if (!id) printf ("Command line: %s <m>\n", argv[0]);
        MPI_Finalize();
        exit (1);
    }

    n = atoi(argv[1]);

    int sqr =sqrt(n)+1;
    int*primes = new int[sqr];
    int ptot=0;
    ptot=getprime(sqr,primes);

    /* Figure out this process's share of the array, as
       well as the integers represented by the first and
       last array elements */

    low_value = 2 + id*1ll*(n-1)/p;
    high_value = 1 + (id+1)*1ll*(n-1)/p;
    low_value = low_value|1;
    high_value = (high_value&1)?high_value:high_value-1;

    register int osize = (high_value - low_value)/2 + 1;
    size = osize;
    size = (size+8-1)/8;

    size = (size +8-1)/8*8;
    //printf("h:%d l:%d\n",high_value,low_value);

    /* Bail out if all the primes used for sieving are
       not all held by process 0 */

    proc0_size = (n-1)/p;

    if ((2 + proc0_size) < (int) sqrt((double) n)) {
        if (!id) printf ("Too many processes\n");
        MPI_Finalize();
        exit (1);
    }
    //marked = new char *[SPLIT_NUM];
    /* Allocate this process's share of the array. */
    marked = new char[size]();
    //memset(marked,0,sizeof(char)*size);
    /*for(int k=0;k<SPLIT_NUM;k++){
        int num  =(size + SPLIT_NUM-1)/SPLIT_NUM;
        marked[k] = new char [num];
        memset(marked[k],0,sizeof(char)*num);
    }*/

    if (marked == NULL) {
        printf ("Cannot allocate enough memory\n");
        MPI_Finalize();
        exit (1);
    }

    //for (i = 0; i < size; i++) marked[i] = 0;
    if (!id) index = 0;

    for(int k = 1;k<ptot;k++) {
        prime = primes[k];
        //printf("%d\n",prime);
        int p2=prime*prime;
        if (p2 > low_value)
            first = p2 - low_value;
        else {
            if (!(low_value % prime)) first = 0;
            else first = prime - (low_value % prime);
        }
        if((first&1))first+=prime;

        for (i =( first>>1); i < osize; i += prime) marked[i>>3] |= 1<<(i&7);
    }
    count = 0;
    register unsigned long long * v =(unsigned long long *)marked;
    register unsigned long long *end =(unsigned long long *)(marked+size);
    for (;v!=end;v++) {
        count+=__builtin_popcountll(*v);
        /*if (!(marked[i>>3] & (1 << (i & 7)))) {
            count++;
        }*/
    }
    count = osize - count;

    if(!id)count ++;
    if (p > 1) MPI_Reduce (&count, &global_count, 1, MPI_INT, MPI_SUM,
                           0, MPI_COMM_WORLD);
    else{
        global_count = count;
    }

    /* Stop the timer */

    elapsed_time += MPI_Wtime();


    /* Print the results */

    if (!id) {
        printf ("There are %d primes less than or equal to %d\n",
                global_count, n);
        printf ("SIEVE (%d) %10.6f\n", p, elapsed_time);
    }
    MPI_Finalize ();
    return 0;
}
