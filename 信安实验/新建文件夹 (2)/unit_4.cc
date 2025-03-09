// #include <iostream>
// #include <sys/time.h>
// #include <bits/stdc++.h>
// using namespace std;

// // 该全局变量可以修改变量值，但是不允许修改变量名，否则测试会不通过
// unsigned int _seed = 1;
// // 既定的全局变量，请勿修改以下三个变量值以及变量名，否则测试会不通过
// const unsigned int _a = 1103515245;
// const unsigned int _c = 12345;
// const unsigned int _m = 2147483648; // => 2^31

// //该函数定下线性同余计算的种子
// // 参数：
// //     seed - 种子值
// // 说明：使用`_seed`来存储种子值
// void lcg_srand(unsigned int seed) {
//     // TODO: 请在这里实现设置种子

//     // 全局变量默认值：
//     //  a = 1103515245
//     //  c = 12345
//     //  m = 2^31
//     //  _seed = 1
//     _seed=seed;
// }

// //该函数使用线性同余算法实现
// // 实现说明：采用以下固定值
// //      _a - 值为：1103515245
// //      _c - 值为：12345
// //      _m - 值为：2^31
// // 返回值：unsigned int
// //     返回值说明：返回线性同余算法产生的下一个unsigned int伪随机数
// // 其他说明：
// //     - 该函数运算将基于`lcg_srand()`设置的种子；如果未通过`lcg_srand()`，种子默认为1
// //     - 请使用规定的全局变量
// unsigned int lcg_rand() {
//     unsigned int tep;
//     tep=( ((_a%_m)*(_seed%_m))%_m+_c%_m)%_m;
//     _seed=tep;
//     return tep;


//     // TODO：返回一次迭代后的结果，结果值需存储在全局变量`_seed`中
// }

// //====================================//

// // 规定好的宏定义，请勿修改。用于`void bbs_rand(int flag)`中使用
// const int BBS_USE_LAST_BIT = 0;
// const int BBS_USE_ODD_BIT = 1;
// const int BBS_USE_EVEN_BIT = 2;

// // 既定的全局变量，请勿修改以下四个变量值以及变量名，否则测试将不通过
// unsigned long _bbs_seed = 3;
// const unsigned long _p = 11;
// const unsigned long _q = 19;
// const unsigned long _n = _p * _q;
// string DecimalToBinary(int decimalNumber) {
//     if (decimalNumber == 0) {
//         return "0";
//     }

//     std::string binaryString = "";
//     while (decimalNumber > 0) {
//         int remainder = decimalNumber % 2;
//         binaryString = std::to_string(remainder) + binaryString;
//         decimalNumber /= 2;
//     }

//     return binaryString;
// }
// int CountOnesInBinaryString(const std::string& binaryString) {
//     int count = 0;
//     for (char c : binaryString) {
//         if (c == '1') {
//             count++;
//         }
//     }
//     return count;
// }
// //该函数实现BBS伪随机算法，需要进行32轮迭代，将产生的32轮伪随机比特转换成伪随机数
// // 参数说明：
// //     flag - 该标志位表示选择三种伪随机序列中的一种，请使用规定好的宏定义
// // 返回值：unsigned int
// //     返回值说明：
// //          - 返回BBS算法产生的下一个unsinged int伪随机数
// // 其他说明：
// //     - 种子请使用`_bbs_seed`变量
// //     - 模数n请使用变量：`_n`，其中_n = _p * _q
// unsigned int bbs_rand(int flag) {
//     if(flag!=0&flag!=1&flag!=2)
//     {
//         return 0;
//     }
//     int res_0[33],res_1[33],res_2[33];
//     int tep;
//     for(int i=1;i<=32;i++)
//     {
//         tep=((_bbs_seed)*(_bbs_seed))%_n;
// //        printf("%d", tep);
//         _bbs_seed=tep;
//         res_0[i]=int(DecimalToBinary(tep)[DecimalToBinary(tep).length()-1])-48;
// //        printf("%d\n", res_0[i]);
//         if(CountOnesInBinaryString(DecimalToBinary(tep))%2==0)
//         {
//             res_1[i]=1;
//             res_2[i]=0;
//         }
//         else{
//             res_2[i]=1;
//             res_1[i]=0;
//         }
//     }
//     if(flag==0)
//     {
//         unsigned res=0;
//         for(int i=1;i<=32;i++)
//         {
//             res+=(res_0[i])*pow(2,32-i);
            
//         }
//         return res;
//     }
//     else if (flag==1)
//     {
//         unsigned long  res=0;
//         for(int i=1;i<=32;i++)
//         {
//             res+=(res_1[i])*pow(2,32-i);
            
//         }
//         return res;
//     }
//     else
//     {
//         unsigned res=0;
//         for(int i=1;i<=32;i++)
//         {
//             res+=(res_2[i])*pow(2,32-i);
            
//         }
//         return res;
//     }
// 	return 0;
// }

// //该函数用于：在多轮运算情况下，比较线性同余算法和BBS算法的运行时间
// // 调用说明：
// //     - 调用lcg_rand和bbs_rand分别产生10个unsigned int伪随机数，比较运行时间
// // 其他说明：
// //     - 该函数不无实际的测试用例，仅用于输出时间
// //     - 两种算法至少运算使用10轮以上进行比较（BBS算法选取的flag任选）
// void measure_rand_time() {
//     auto lcg_start = std::chrono::high_resolution_clock::now();

//     for (int i = 0; i < 10; i++) {
//         lcg_rand();
//     }

//     auto lcg_end = std::chrono::high_resolution_clock::now();
//     auto lcg_duration = std::chrono::duration_cast<std::chrono::microseconds>(lcg_end - lcg_start).count();

//     auto bbs_start = std::chrono::high_resolution_clock::now();

//     for (int i = 0; i < 10; i++) {
//         bbs_rand(BBS_USE_LAST_BIT); // 您可以选择BBS的任何标志位
//     }

//     auto bbs_end = std::chrono::high_resolution_clock::now();
//     auto bbs_duration = std::chrono::duration_cast<std::chrono::microseconds>(bbs_end - bbs_start).count();

//     printf("lcg 时间为 %ld 微秒\n", lcg_duration);
//     printf("bbs 时间为 %ld 微秒\n", bbs_duration);
// }
#include <iostream>
#include <sys/time.h>
#include <bits/stdc++.h>

using namespace std;

// 该全局变量可以修改变量值，但是不允许修改变量名，否则测试会不通过
unsigned int _seed = 1;
// 既定的全局变量，请勿修改以下三个变量值以及变量名，否则测试会不通过
const unsigned int _a = 1103515245;
const unsigned int _c = 12345;
const unsigned int _m = 2147483648; // => 2^31

//该函数定下线性同余计算的种子
// 参数：
//     seed - 种子值
// 说明：使用`_seed`来存储种子值
void lcg_srand(unsigned int seed) {
    _seed=seed;

}

//该函数使用线性同余算法实现
// 实现说明：采用以下固定值
//      _a - 值为：1103515245
//      _c - 值为：12345
//      _m - 值为：2^31
// 返回值：unsigned int
//     返回值说明：返回线性同余算法产生的下一个unsigned int伪随机数
// 其他说明：
//     - 该函数运算将基于`lcg_srand()`设置的种子；如果未通过`lcg_srand()`，种子默认为1
//     - 请使用规定的全局变量
unsigned int lcg_rand() {
    _seed= ((_a*_seed)%_m+_c%_m)%_m;
    return _seed;
    // TODO：返回一次迭代后的结果，结果值需存储在全局变量`_seed`中
}

//====================================//

// 规定好的宏定义，请勿修改。用于`void bbs_rand(int flag)`中使用
const int BBS_USE_LAST_BIT = 0;
const int BBS_USE_ODD_BIT = 1;
const int BBS_USE_EVEN_BIT = 2;

// 既定的全局变量，请勿修改以下四个变量值以及变量名，否则测试将不通过
unsigned long _bbs_seed = 3;
const unsigned long _p = 11;
const unsigned long _q = 19;
const unsigned long _n = _p * _q;
string de_2_bn(unsigned int x )
{
	char res[256];
	int cnt=0;
	while(x>0)
	{
		res[cnt]=x%2+48;
		x/=2;
		cnt+=1;
	}
	for(int i=0;i<cnt/2;i++)
	{
		swap(res[i],res[cnt-1-i]);
	}
	 string str(reinterpret_cast<const char*>(res),cnt);
	return str;
}
int one_in_dec(string x)
{
    int cnt=0;
    for(int i=0;i<x.length();i++)
    {
        if(x[i]=='1')
        {
            cnt++;
        }
    }
    return cnt;
}
//该函数实现BBS伪随机算法，需要进行32轮迭代，将产生的32轮伪随机比特转换成伪随机数
// 参数说明：
//     flag - 该标志位表示选择三种伪随机序列中的一种，请使用规定好的宏定义
// 返回值：unsigned int
//     返回值说明：
//          - 返回BBS算法产生的下一个unsinged int伪随机数
// 其他说明：
//     - 种子请使用`_bbs_seed`变量
//     - 模数n请使用变量：`_n`，其中_n = _p * _q
unsigned int bbs_rand(int flag) {
    if(flag!=0 && flag!=1 && flag!=2)
    {
        return 0;
    }
    int res_1[33],res_2[33],res_3[33];
           int tep=3;   
    for(int i=0;i<32;i++)
    {
 
        tep=(tep*tep)%(_p*_q);
        cout<<tep;
        string tep_dec=de_2_bn(tep);
        if(tep_dec[tep_dec.length()-1]=='1')
        {
            res_1[i]=1;
        }
        else
        {
            res_1[i]=0;
        }
        if(one_in_dec(tep_dec)%2==0)
        {
            res_2[i]=1;
            res_3[i]=0;
        }
        else
        {
            res_2[i]=0;
            res_3[i]=1;
        }
    }
    if(flag==0)
    {
        int res=0;
        for(int i=0;i<32;i++)
        {
            res+=pow(2,31-i)*res_1[i];
        }
        return res;
    }
    if(flag==1)
    {
        int res=0;
        for(int i=0;i<32;i++)
        {
            res+=pow(2,31-i)*res_2[i];
        }
        return res;
    }
    if(flag==2)
    {
        int res=0;
        for(int i=0;i<32;i++)
        {
            res+=pow(2,31-i)*res_3[i];
        }
        return res;
    }
    // TODO: 返回32轮迭代过后的伪随机数值

    // 全局变量默认值：
    //  p = 11
    //  q = 19
    //  n = p * q
    //  _bbs_seed = 3
}

//该函数用于：在多轮运算情况下，比较线性同余算法和BBS算法的运行时间
// 调用说明：
//     - 调用lcg_rand和bbs_rand分别产生10个unsigned int伪随机数，比较运行时间
// 其他说明：
//     - 该函数不无实际的测试用例，仅用于输出时间
//     - 两种算法至少运算使用10轮以上进行比较（BBS算法选取的flag任选）
void measure_rand_time() {
    // TODO: 计算至少10次以上比较两种伪随机数生成算法的运行时间

    // 输出示例：
    // printf("lcg time is xxx us\n", xxxx);
    // printf("bbs time is xxxx us\n", xxxx);
}
// int main()
// {
// 	cout<< bbs_rand(1)<<endl;
// }