#include <bits/stdc++.h>
using namespace std;
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
int myexd(int a,int m)
{
    int x,y;
    if(exd(a,m,x,y)!=1)
    {
        return -1;
    }
    return (x%m+m)%m;
}
int main()
{
    cout<<myexd(4,5)<<endl;
}