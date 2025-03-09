// #include<bits/stdc++.h>
// #include<math.h>
// using namespace std;
// string decimal_to_binary(unsigned x)
// {
//     char res[256];
//     int cnt=0,tep=0;
//     while(x>=1)
//     {   tep=x%2;
//         res[cnt]=tep+'0';
//         x=x/2;
//         cnt++;
//     }
//     for(int i=0;i<cnt/2;i++)
//     {
//         swap(res[i],res[cnt-i-1]);
//     }
//     string str(res,cnt);

//     return str;
// }
// unsigned int mod_exp(unsigned int a, unsigned int e, unsigned int m)
// {
//     // TODO: return the answer of a^e mod m";
//     string str_e= decimal_to_binary(e);
//     unsigned tep=1;
//     for(int i=0;i<str_e.length()-1;i++)
//     {
//         if(str_e[i]=='1')
//         {
//             tep=((tep%m)*(a%m))%m;
//             tep=((tep%m)*(tep%m))%m;

//         }
//         else if(str_e[i]=='0')
//         {
//             tep=((tep%m)*(tep%m))%m;

//         }
//     }
//      if(str_e[str_e.length()-1]=='1')
//         {
//             tep=((tep%m)*(a%m))%m;

//         }

//     return tep;
    


// }
// //该函数使用Miller Rabin非确定性素数测试
// // 参数：
// //     n - 需要被测试的数
// //     a - 随机选择的数
// // 返回值：std::string
// //     返回值说明：
// //       "not_prime" - 表示一定不是素数
// //       "uncertain" - 表示不一定是素数，即无法确定
// std::string miller_rabin_prime_test(unsigned int n, unsigned int a) {
// 	if(a>1 && a<n-1)
// 	{
// 	}
// 	else{
// 		return "error";
// 	}
// 	unsigned int k=0,q;
// 	while(1)
// 	{
// 		q=(n-1)/pow(2,k);
// 		if(q%2==1)
// 		{
// 			q=(n-1)/pow(2,k);
// 			break;
// 		}
// 		k++;
// 	}
// 	if(mod_exp(a,q,n)==1)
// 	{
// 		return  "uncertain";
// 	}
// 	for(int j=1;j<=k;j++)
// 	{
// 		if(mod_exp(a,pow(2,j-1)*q,n)==n-1)
// 		{
// 			return  "uncertain";
// 		}
// 	}
	
//     // TODO: 对n进行非确定性素性测试
//     return  "not_prime";
// }


// int ex_gcd(int a,int m,int &x,int &y)
// {
//     if(m==0)
//     {
//         x=1,y=0;
//         return a;
//     }
//     int gcd=ex_gcd(m,a%m,y,x);
//     y=y-(a/m)*x;
//     return gcd;
// }
// int euclid_mod_reverse(int a, int m) {
//     if(a<0 || m<0)
//     {
//         return -1;
//     }
// 	int x,y;
//     if(ex_gcd(a,m,x,y)!=1)
//     {
//         return -1;
//     }
//     else
//     {
//         return (x%m+m)%m;
//     }
// }
#include <iostream>
#include <bits/stdc++.h>
using namespace std;
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
unsigned int mod_exp(unsigned int a, unsigned int e, unsigned int m)
{
    string dec_e=de_2_bn(e);
    unsigned int res=1;
    for(int i=0;i<dec_e.length()-1;i++)
    {
    	if (dec_e[i]=='1')
    	{	
    		res=((res%m)*(a%m))%m;
    		res=((res%m)*(res%m))%m;
		}
		else if (dec_e[i]=='0')
    	{	
    		res=((res%m)*(1%m))%m;
    		res=((res%m)*(res%m))%m;
		}
	}
		if (dec_e[dec_e.length()-1]=='1')
    	{	
    		res=((res%m)*(a%m))%m;
		}
		else if (dec_e[dec_e.length()-1]=='0')
    	{	
    		res=((res%m)*(1%m))%m;
		}
	return res;
}

string miller_rabin_prime_test(unsigned int n, unsigned int a) {
    if(n<2 || a>=n-1)
    {
        return "error";
    }
    unsigned k=0,q;
    while(1)
    {
        q=(n-1)/int(pow(2,k));
        if(q%2==1)
        {
            break;
        }
        k++;
    }
    if(mod_exp(a,q,n)==1)
    {
        return "uncertain";
    }
    for(int j=1;j<=k;j++)
    {
//    	cout<<int(pow(2,j-1))*q<<endl;
        if(mod_exp(a,int(pow(2,j-1))*q,n)==n-1)
        {
//        	cout<<int(pow(2,j-1))*q<<endl;
            return "uncertain";
        }
    }
    // TODO: 对n进行非确定性素性测试
    return "not_prime";
}


string miller_rabin_multiple_test(unsigned int n, unsigned int repeat_times) {
    // TODO: 随机化对n进行非确定性素性测试
    return "TODO";
}
int exd(int a,int m,int &x,int &y)
    {
        if(m==0)
        {
            x=1;
            y=0;
            return a;
        }
        int gcd=exd(m,a%m,y,x);
        y-=(a/m)*x;
        return gcd;
    }
int euclid_mod_reverse(int a, int m) {
    
    if(a<=0 || m<=0)
    {
        return -1;
    }
    int x,y;
    if(exd(a,m,x,y)!=1)
    {
        return -1;
    }
    return (x%m+m)%m;
    // TODO: a * x = 1(mod b)，求a的逆元x并返回x
    return 0;
}
// int main()
// {
// 	cout<<miller_rabin_prime_test(29, 2);
// //	cout<<euclid_mod_reverse(3,5)<<endl;
// }
