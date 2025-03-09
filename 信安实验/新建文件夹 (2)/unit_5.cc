// #include <bits/stdc++.h>
// #include <openssl/bn.h>

// using namespace std;

// // 该函数用于进行大数模指数运算
// //  参数:
// //      string类型, 求解a^e mod m, 表示为10进制数字符串
// //  返回值:
// //      string类型, 返回计算的结果, 表示为10进制数字符串
// string mod_exp(string a, string e, string m)
// {
//     BIGNUM *an,*en,*mn,*res;
//     an=BN_new();
//     en=BN_new();
//     mn=BN_new();
//     res=BN_new();
//     BN_dec2bn(&an,a.c_str());
//     BN_dec2bn(&en,e.c_str());
//     BN_dec2bn(&mn,m.c_str());
//     if(BN_mod_exp(res, an, en,mn, BN_CTX_new()))
//     {
//         char *result;
//         result=BN_bn2dec(res);
//         return result;
//     } 
//     else
//     {
//         return "error";
//     }
//     BN_free(an);
//     BN_free(en);
//     BN_free(mn);
//     BN_free(res);
//     }

// // 该函数用于进行大数求乘法逆元.
// //  参数:
// //      string类型, 求解a关于mod m的乘法逆元, 表示为10进制数字符串
// //  返回值:
// //      string类型, 返回计算的结果, 表示为10进制数字符串
// string mod_inverse(string a, string m) 
// {
//     BIGNUM *an,*mn,*res;
//     an=BN_new();
//     mn=BN_new();
//     res=BN_new();
//     BN_dec2bn(&an,a.c_str());
//     BN_dec2bn(&mn,m.c_str());
//     if( BN_mod_inverse(res, an, mn,BN_CTX_new()))
//     {
//         char * result;
//         result=BN_bn2dec(res);
//         return result;
//     }
//     else
//     {
//         return "error";
//     }
// }
#include <bits/stdc++.h>
#include <openssl/bn.h>

using namespace std;

// 该函数用于进行大数模指数运算
//  参数:
//      string类型, 求解a^e mod m, 表示为10进制数字符串
//  返回值:
//      string类型, 返回计算的结果, 表示为10进制数字符串
string mod_exp(string a, string e, string m) 
{
    BIGNUM *a_,*e_,*m_,*r;
    a_=BN_new();
    e_=BN_new();
    m_=BN_new();
    r=BN_new();
    BN_dec2bn(&a_, a.c_str());
    BN_dec2bn(&e_, e.c_str());
    BN_dec2bn(&m_, m.c_str());
    if(BN_mod_exp(r, a_, e_,m_, BN_CTX_new()))
    {
        string res;
        res=BN_bn2dec(r);
        return res;
    }
    return "error";
}

// 该函数用于进行大数求乘法逆元
//  参数:
//      string类型, 求解a关于mod m的乘法逆元, 表示为10进制数字符串
//  返回值:
//      string类型, 返回计算的结果, 表示为10进制数字符串
string mod_inverse(string a, string m) 
{
    BIGNUM *a_,*m_,*r;
    a_=BN_new();
    m_=BN_new();
    r=BN_new();
    BN_dec2bn(&a_, a.c_str());
    BN_dec2bn(&m_, m.c_str());
    if(r=BN_mod_inverse(r, a_, m_, BN_CTX_new()))
    {
        string res;
        res=BN_bn2dec(r);
        return res;
    }
    return "error";
}