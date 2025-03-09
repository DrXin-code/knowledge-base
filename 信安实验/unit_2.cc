
//  #include<bits/stdc++.h>
//  #define MAX_M 1e+10
// using namespace std;

// unsigned int sqrt_16(unsigned long M)
// {
//      unsigned int N, i;
//      unsigned long tmp, ttp;  
 
//      if (M == 0) 
//          return 0;
 
//      N = 0;
//      tmp = (M >> 30);  
//      M <<= 2;
 
//      if (tmp > 1)   
//      {
//          N ++;     
//          tmp -= N;
//      }
 
//      for (i=15; i>0; i--)  
//      {
//          N <<= 1;     
//          tmp <<= 2;
//          tmp += (M >> 30);  
//          ttp = N;
//          ttp = (ttp<<1)+1;
 
//          M <<= 2;
//          if (tmp >= ttp)  
//          {
//              tmp -= ttp;
//              N ++;
//          }
//      }
//      return N;
// }


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
// bool prime_test(unsigned int a) {
// 	unsigned long long a_sqrt=1;
//     if(a<2)
// 	{
// 		return false;
// 	}

// 	while(a_sqrt*a_sqrt<a)
// 	{
// 		a_sqrt+=1;
// 	}

// 	int nums[70000];
// 	memset(nums,0,a_sqrt);

// 	for(unsigned long long i=2;i<a_sqrt;i++)
// 	{
// 		if(nums[i]==1)
// 		{
// 			continue;
// 		}
// 		for(unsigned long long j=i;j<a_sqrt;j*=j)
// 		{
// 			if(nums[i]==1)
// 		{
// 			continue;
// 		}
// 			nums[j]=1;
// 		}
// 	}
// 	for(unsigned long long i=2;i<a_sqrt;i++)
// 	{
// 		if(a%i==0)
// 		{
// 			return false;
// 		}
// 	}
// 	return true;
	
	
	
// }
#include <cmath>
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

bool prime_test(unsigned int a)
{
    if(a<2)
    {
        return false;
    }
	unsigned long long a_sqrt=1;
	while (a_sqrt*a_sqrt<a)
	{
		a_sqrt++;
	}
	int res[a_sqrt+1];
	for(int i=2;i<a_sqrt;i++ )
	{
		res[i]=0;
	}
	for(int i=2;i<a_sqrt;i++ )
	{
		if(res[i]==0)
		{
			for(int j=i+1;j<a_sqrt;j++)
			{	
				if(j%i==0)
				{
					res[j]==1;
				}
			}
		}
	}
	for(int i=2;i<a_sqrt;i++ )
	{
		if(res[i]==0 && a%i==0)
		{
			return false;
		}
	}
	return true;
    
}