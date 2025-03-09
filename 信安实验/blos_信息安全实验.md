# 信安实验

## 模指数

- 记住溢出所以要不断进行取余操作
- 不要复制粘贴代码

## Eratosthenes筛选法

- 构造一个从2 到 sqrt（a）的集合，然后从2开始去掉集合中的倍数，最后看看a是否能整除这个集合中的数字
- memset(res,value,数量) 是从字节开始赋值，所以一般赋值0合适一点，尤其是int型数组
- **一定到考虑错误比如小于2以及其他情况的判断！！！！！！**
- unsigned 2^32-1==4294967295(这是上限) int 2^31 -1
- 为了防止计算溢出，采用**unsigned long long** 2^64-1  (long long 2^63-1)   差的都是符号位置

## 米勒拉宾素性检测

![image-20231119213317341](https://s2.loli.net/2024/03/12/wcyv1ufgkDWYIb4.png)![image-20231119221533079](https://s2.loli.net/2024/03/12/wYDvNQsgAaiplye.png)

- **判断a的范围**，**1<a<n-1**,1<=j<=k
- 看清上下角标
- pow在std中已经被定义过了
- 总共要判断两次

```c++
string miller_rabin_prime_test(unsigned int n, unsigned int a) {
    if(n<2 || a>=n-1)//因为a的范围，而且a是un型的变量，所以不能和素数比较，所以要a>=n-1，连负数一起判断
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
        if(mod_exp(a,int(pow(2,j-1))*q,n)==n-1)
        {
            return "uncertain";
        }
    }
    // TODO: 对n进行非确定性素性测试
    return "not_prime";
}

```



## 扩展欧几里得求逆元

- 先用欧几里得求出gcd以及x,y

- 然后对x进行非负判断 

  ```
   (x%m+m)%m;
  ```

- 注意gcd不是1，即不是互素，要进行判错

```c++
int ex_gcd(int a,int m,int &x,int &y)
{
    if(m==0)
    {
        x=1,y=0;
        return a;
    }
    int gcd=ex_gcd(m,a%m,y,x);
    y=y-(a/m)*x;
    return gcd;
}
int euclid_mod_reverse(int a, int m) {
    if(a<0 || m<0)
    {
        return -1;
    }
	int x,y;
    if(ex_gcd(a,m,x,y)!=1)
    {
        return -1;
    }
    else
    {
        return (x%m+m)%m;
    }
}

```

## 线性同余

- 记住唯一的公式即可，注意防止溢出

![image-20231120210157510](https://s2.loli.net/2024/03/12/MGSzlvcA47jaOQY.png)![image-20231120210208832](https://s2.loli.net/2024/03/12/U1WhkqnM4SIfQYP.png)

## BBS

![image-20231120210231813](https://s2.loli.net/2024/03/12/g8pqlcTyFsSYO9j.png)

![image-20231120210238697](https://s2.loli.net/2024/03/12/rPLzT4xtOCBReGJ.png)

- 重点是提取比特序列，奇偶校验位
- ![image-20231120210313072](https://s2.loli.net/2024/03/12/2XxM56VOvrkmFcg.png)

```c++
unsigned int bbs_rand(int flag) {
    if(flag!=0 && flag!=1 && flag!=2)//注意flag是012还是123
    {
        return 0;
    }//注意此处的错误判断
    int res_1[33],res_2[33],res_3[33];
           int tep=3;   
    for(int i=0;i<32;i++)
    {
 
        tep=(tep*tep)%(_p*_q);//注意只有第一下初始为3
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
            res_3[i]=0;//复制粘贴的时候出错误，为了避免得不偿失还是少点复制
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
```



## 编译过程

### 预处理

编译过程的第一个阶段就是预处理阶段。该阶段要完成的任务：

将#include关键字标示的含有定义的文件（包括文件或头文件）包含到源代码文件中。
将#include语句指定的值转换成常量。
在代码中调用宏的位置将宏定义转换成代码。
根据#if、#elif、#endif包含或排除特定部分的代码
     经过预处理阶段之后会形成一系列的.i文件

- 处理宏定义指令

  将已经定义过的参数变换成宏

- 处理条件编译指令

​		防止头文件的重复定义

- 扩展头文件包含指令

​		头文件以h结尾

**gcc -E**     **.i文件 1203.**

 **生成预处理代码**

![image-20231121213906025](https://s2.loli.net/2024/03/12/s9mZQ568rlcPhzI.png)

参考：[【精选】什么是预处理_预处理阶段-CSDN博客](https://blog.csdn.net/LMM1314521/article/details/127431524?ops_request_misc=%7B%22request%5Fid%22%3A%22170056996616777224456350%22%2C%22scm%22%3A%2220140713.130102334..%22%7D&request_id=170056996616777224456350&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~all~top_positive~default-1-127431524-null-null.142^v96^pc_search_result_base7&utm_term=预处理&spm=1018.2226.3001.4187)

[三、编译预处理阶段_scx_link的博客-CSDN博客](https://blog.csdn.net/adminstate/article/details/128438121?spm=1001.2101.3001.6650.2&utm_medium=distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~Rate-2-128438121-blog-127431524.235^v38^pc_relevant_sort_base3&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromBaidu~Rate-2-128438121-blog-127431524.235^v38^pc_relevant_sort_base3&utm_relevant_index=5)

### 编译

**将i文件处理为s文件**

**gcc -S**   ** **

```c
gcc -S demo.i –o demo.s
```

![image-20231121214002423](https://s2.loli.net/2024/03/12/9WZ2sqpb8N5fgLB.png)

### 汇编

将汇编语言转换成机器语言 生成目标文件 .O    也称 可重定位文件

```
gcc -c demo.s -o demo.o
```

![image-20231121214816752](https://s2.loli.net/2024/03/12/hoQRHxK8DUb1L2a.png)

### 链接

- 将各个目标文件组合到一起的过程
- 可执行文件windows后缀为.exe，Linux后缀为.out

链接器将各种.o文件进行合并并生成可执行目标文件，可以被加载到内存中，由系统进行执行。
连接目标代码，生成可执行程序。

```
g++ main.o -o main
```

![image-20231121214951803](https://s2.loli.net/2024/03/12/8cWyKAg7jGF5U23.png)

![image-20231121215941616](https://s2.loli.net/2024/03/12/lmQj2B1RPtUVZHL.png)

#### 静态库

![image-20231121220014874](https://s2.loli.net/2024/03/12/KiSEnmw46FrRep2.png)

- 创建过程

![image-20231121220102989](https://s2.loli.net/2024/03/12/FGTMYOe17BpaPct.png)

#### 动态库

![image-20231121220548758](https://s2.loli.net/2024/03/12/rnk28y3eim9GcKW.png)

![image-20231121220613719](https://s2.loli.net/2024/03/12/Ih8LviyHGlZWuQb.png)

预处理、编译、汇编和链接是计算机程序的构建过程中的四个主要阶段。它们按照顺序依次执行，最终将高级编程语言的源代码转化为可执行文件。下面是对每个阶段的详细介绍：

1. **预处理（Preprocessing）**：
   - **任务：** 预处理是在源代码被编译之前的第一步，它主要负责对源代码进行一些文本替换和处理，以生成被编译器进一步处理的中间代码。
   - **过程：** 预处理器通常会执行以下任务：
     - **宏替换：** 展开程序中的宏定义。
     - **文件包含：** 处理`#include`指令，将包含的头文件内容插入到源文件中。
     - **条件编译：** 处理`#if`、`#else`、`#endif`等条件编译指令，根据条件选择性地包含或排除代码。
     - **注释去除：** 去除注释，将注释后的内容删除。

2. **编译（Compiling）**：
   - **任务：** 编译阶段将预处理后的源代码转化为汇编代码，该代码是特定于目标机器架构的低级中间代码。
   - **过程：** 编译器执行以下关键任务：
     - **词法分析：** 将源代码转化为标记（tokens）。
     - **语法分析：** 构建抽象语法树（Abstract Syntax Tree，AST），检查语法错误。
     - **语义分析：** 检查语法结构的语义正确性，进行类型检查。
     - **优化：** 对代码进行一些优化，以提高执行效率。
     - **代码生成：** 生成与目标机器体系结构相关的汇编代码。

3. **汇编（Assembling）**：
   - **任务：** 汇编阶段将编译生成的汇编代码翻译成机器语言指令，生成可重定位的目标文件。
   - **过程：** 汇编器执行以下主要步骤：
     - **符号解析：** 将代码中使用的符号（变量、函数名等）映射到内存地址。
     - **地址解析：** 为指令生成实际的内存地址。
     - **生成目标文件：** 将汇编代码转化为目标文件，包含机器语言指令和相关的元信息。

4. **链接（Linking）**：
   - **任务：** 链接阶段将多个目标文件和库文件组合成一个可执行文件。
   - **过程：** 链接器执行以下主要任务：
     - **地址解析：** 解析和分配程序中使用的符号的最终内存地址。
     - **符号解析：** 解决在不同目标文件中定义的符号之间的引用关系。
     - **重定位：** 调整目标文件中的地址，使得各个目标文件中的地址能够正确地映射到最终的内存地址。
     - **生成可执行文件：** 将所有目标文件和必要的库文件链接在一起，生成最终的可执行文件。

综合来说，这四个阶段协同工作，将高级编程语言的源代码转化为可在计算机上执行的机器语言，并最终生成可执行文件。





当你在预处理过程中使用了尚未定义的函数时，预处理阶段本身不会报错。这是因为预处理阶段主要处理一些文本替换和条件编译等任务，而不会对代码的语法和语义进行深入检查。

具体来说，在预处理阶段，如果你使用了某个函数的声明，而该函数的定义在当前文件或包含的头文件中尚未出现，预处理器不会引发错误。预处理器只是简单地展开宏、处理条件编译指令、执行文件包含等操作。

## OPENSSL

`man` 是一个用于查看 Unix/Linux 系统上的手册页面的命令，但是在某些系统上，特别是一些较小或定制化的系统上，可能并没有完整的手册页面。如果你在使用 `man` 命令时无法查询到 OpenSSL 库函数的手册页面，有几种可能的原因和替代方法：

1. **手册页面不存在：** 确保 OpenSSL 库已经正确安装，并且你的系统支持 OpenSSL 的手册页面。你可以尝试安装 OpenSSL 的手册页面，具体方法可能因系统而异。例如，在基于 Debian 的系统上，你可以运行以下命令安装 OpenSSL 的手册页面：

   ```bash
   sudo apt-get install libssl-doc
   ```

   **2.openssl** 安装


```bash
	sudo apt-get install libssl-dev
```

### 声明

`BIGNUM *a_ = BN_new()` 这行代码在使用 OpenSSL 库中进行大数运算时创建了一个 BIGNUM 对象，其中：

- `BIGNUM` 是 OpenSSL 库中用于表示大整数的数据类型。
- `BN_new()` 是 OpenSSL 提供的函数，用于创建一个新的 BIGNUM 对象。

### 模指数

```c++
 int BN_mod_exp(BIGNUM *r, BIGNUM *a, const BIGNUM *p, const BIGNUM *m, BN_CTX *ctx);
```

- 返回值是1或者错误返回

- 注意最后一个参数为 BN_CTX_new()

- 最后要释放参数

- ```c++
  string mod_exp(string a, string e, string m)
  {
      BIGNUM *an,*en,*mn,*res;
      an=BN_new();
      en=BN_new();
      mn=BN_new();
      res=BN_new();
      BN_dec2bn(&an,a.c_str());
      BN_dec2bn(&en,e.c_str());
      BN_dec2bn(&mn,m.c_str());
      if(BN_mod_exp(res, an, en,mn, BN_CTX_new()))
      {
          char *result;
          result=BN_bn2dec(res);
          return result;
      } 
      else
      {
          return "error";
      }
      BN_free(an);
      BN_free(en);
      BN_free(mn);
      BN_free(res);
      }
  ```

  

### 逆元

```c++
 BIGNUM *BN_mod_inverse(BIGNUM *r, BIGNUM *a, const BIGNUM *n,BN_CTX *ctx);
```

- 返回值是大数指针或者错误返回
- 注意最后一个参数为 BN_CTX_new()

```c++
string mod_inverse(string a, string m) 
{
    BIGNUM *an,*mn,*res;
    an=BN_new();
    mn=BN_new();
    res=BN_new();
    BN_dec2bn(&an,a.c_str());
    BN_dec2bn(&mn,m.c_str());
    if( BN_mod_inverse(res, an, mn,BN_CTX_new()))
    {
        char * result;
        result=BN_bn2dec(res);
        return result;
    }
    else
    {
        return "error";
    }
     BN_free(an);
    BN_free(en);
    BN_free(mn);
    BN_free(res);
}

```

### RSA加解密以及数字签名

- 加解密原理 ：公钥加密、私钥解密
- ![image-20231124124453741](https://s2.loli.net/2024/03/12/eLXbUHIhF8ykQcr.png)

![image-20231124124458088](https://s2.loli.net/2024/03/12/e6gd8NCOvzFAYQZ.png)

![image-20231124124520516](C:/Users/LEGION/AppData/Roaming/Typora/typora-user-images/image-20231124124520516.png)

![image-20231124124729070](https://s2.loli.net/2024/03/12/pejDocCZzgirFws.png)

- 数字签名原理：私钥签名（加密）；公钥验证（解密）
- ![image-20231124130157885](https://s2.loli.net/2024/03/12/HBvct8e69JyWiTb.png)
- ![image-20231124130414279](https://s2.loli.net/2024/03/12/qDAKiRyPBGapzcw.png)

```c++
#include <bits/stdc++.h>
#include <openssl/bn.h>
#include <openssl/pem.h>
#include <openssl/rsa.h>

//  修改以下两个个宏定义为给出的RSA 2048密钥(密钥存储在keys文件夹中)的绝对路径(或不做修改使用默认的相对路径),
//  用于后续调用
//      PUBLICKEY 为 rsa公钥的存储路径
//      PRIVATEKEY 为rsa私钥的存储路径
#define PUBLICKEY "../keys/public.pem"
#define PRIVATEKEY "../keys/private.pem"

using namespace std;
//RSA 私钥、公钥用 RSA*指针表示
RSA* rsa_private_key = NULL; // 需要读取的rsa私钥，
RSA* rsa_public_key = NULL; // 需要读取的rsa公钥

// 该函数用于读取rsa密钥(公钥和私钥)
//  返回值:
//      true 代表读取成功
//      false 代表读取失败
// 其他说明:
// //      通过宏定义的路径和口令将rsa的公钥,私钥分别读取到rsa_private_key和rsa_public_key中s

bool load_RSA_keys() 
{
    FILE *p=NULL,*s=NULL;//文件指针，FILE大写
    const char* rsa_public_path=PUBLICKEY;//fopen第一个参数是const char*类型，所以需要转换
    const char* rsa_private_path=PRIVATEKEY;
    p=fopen(rsa_public_path,"r");//"r" 字符串格式 而不是 'r'
    s=fopen(rsa_private_path,"r");
    if(p!=NULL && s!=NULL)
    {
        PEM_read_RSA_PUBKEY(p,&rsa_public_key,NULL,NULL);//PEM_read_RSA_PUBKEY读取 -----BEGIN PUBLIC KEY-----格式
        										//PEM_read_RSAPublicKey读取-----BEGIN RSA PUBLIC  KEY-----格式
        										// PEM_read_PUBKEY还需要其他格式转换一般不用
        PEM_read_RSAPrivateKey(s,&rsa_private_key,NULL,NULL);//私钥读取函数固定
    }
    else{
        return false;//判断失败
    }
    fclose(p);//好习惯关闭文件指针
    fclose(s);
    return true;
}

string RSA_Encryption(string plaintext)
{
    load_RSA_keys();
    int flen=plaintext.length(),elen;//flen表示消息长度，elen表示一会加密完的密文长度
    const char * plaintext_cstr=plaintext.c_str();//首先将plaintext转换成const char * 再转换成const unsigned char *
    unsigned char  res[1000];//用于存放密文的数组
    elen=RSA_public_encrypt(flen,reinterpret_cast<const unsigned char *>(plaintext_cstr),res,rsa_public_key,RSA_PKCS1_PADDING);
    //reinterpret_cast 强制转换  RSA_PKCS1_PADDING 填重都用这个格式
    string str(reinterpret_cast< char*>(res),elen);//最后将数组中的密文输出，需要将res变为char类型，迭代的第二个参数是密文的长度
    return str;
}

// 该函数用于进行rsa私钥解密
//  参数:
//      ciphertext 代表输入的密文字符串
//  返回值:
//      string类型, 返回解密的结果

string RSA_Decryption(string ciphertext)
{
    load_RSA_keys();
    int flen=ciphertext.length();
    int mlen;
    const char* ciphertext_cstr=ciphertext.c_str();
    unsigned char res[1000];
    mlen= RSA_private_decrypt(flen,reinterpret_cast<const unsigned char*>(ciphertext_cstr),res,rsa_private_key,RSA_PKCS1_PADDING);//注意函数名的变化
    string str(reinterpret_cast<char *>(res),mlen);
    return str;
}
// 该函数用于进行rsa签名生成
//  参数:
//      input 代表输入的明文字符串
//  返回值:
//      string类型, 返回解密签名结果后的明文
string RSA_signature_signing(string input)
{
    load_RSA_keys();
    int flen=input.length();
    int elen;
    const char* input_cstr=input.c_str();
    unsigned char res[1000];
    elen=RSA_private_encrypt(flen,reinterpret_cast<const unsigned char*>(input_cstr),res,rsa_private_key,RSA_PKCS1_PADDING);
    //唯一的不同就是函数变了
    string str(reinterpret_cast<char *>(res),elen);
    return str;
}

// 该函数用于进行rsa签名验证
//  参数:
//      message 代表输入的签名结果
//      signature 代表签名的结果
//  返回值:
//      bool类型, 返回签名的结果, 验证成功为返回true, 失败返回false
bool RSA_signature_verify(string message, string signature)
{
    load_RSA_keys();
    int flen=signature.length(),elen;
    const char * signature_cstr=signature.c_str();
    unsigned char  res[1000];
    elen=RSA_public_dncrypt(flen,reinterpret_cast<const unsigned char *>(signature_cstr),res,rsa_public_key,RSA_PKCS1_PADDING);
    string str(reinterpret_cast< char*>(res),elen);
    return str==message;

}
```



```bash
gcc rsa_test.cpp -o try -lstdc++ -lcrypto//编译

// 生成RSA私钥，存入PEM文件
$ openssl genrsa -out rsa_pri.pem 2048
// 从RSA私钥中提取公钥，存入PEM文件
$ openssl rsa -in rsa_pri.pem -pubout -out rsa_pub.pem
```



## RC4

- 流密码
- 算法分为两部分  构造和加密

![image-20231127212339242](https://s2.loli.net/2024/03/12/KTwjxEe4tbVvF9Z.png)

![image-20231127212343045](https://s2.loli.net/2024/03/12/reZIWgSjmUfzkV2.png)![image-20231127212402994](C:/Users/LEGION/AppData/Roaming/Typora/typora-user-images/image-20231127212402994.png)

![image-20231127212346502](C:/Users/LEGION/AppData/Roaming/Typora/typora-user-images/image-20231127212346502.png)

![image-20231127212435609](C:/Users/LEGION/AppData/Roaming/Typora/typora-user-images/image-20231127212435609.png)

```c++
string rc4_encrypt(string data, string secret_key) {
    if(data=="" || secret_key=="")
    {
        return "";
    }//错误判定
    RC4_KEY* key_m=new RC4_KEY;//RC4_KEY是个结构体，可以用指针+new，也可以直接声明（RC4_KEY key_m）,类型不可以用前者
    const char* secret_key_cstr=secret_key.c_str();
    const char* data_cstr=data.c_str();
    RC4_set_key( key_m, secret_key.length(), reinterpret_cast<const unsigned char*>(secret_key_cstr));//将输入的密钥转换成RC4格式，第一个算法
    unsigned char outdata[data.length()+1];
    RC4( key_m, data.length(), reinterpret_cast<const unsigned char*>(data_cstr),outdata);
    string str(reinterpret_cast<const char*>(outdata),data.length());
    // TODO: 在此处实现你的代码
    return str;
}
string rc4_decrypt(string data, string secret_key) {
      return rc4_encrypt(data, secret_key);//因为加解密都是异或，所以解密就是直接再一次加密
}
```



## DES

去看ppt

```c++
// 请使用该函数将string类型转换为DES_cblock类型。（请勿更改此函数）
// - 该函数仅用于转换明文和密文内容，请不要把用此函数转换secret_key。
// - secret_key请使用`DES_string_to_key()`函数转换。

void convert_string_to_des_block(string str, DES_cblock &output) {
    for(int i = 0; i < 8; ++i) {
        output[i] = str[i];
    }
}
//DES_cblock是一种数组类型，unsigned char[8]，转换就是逐个转换

// 该函数实现DES-ECB加密算法功能
//  参数:
//      plain - 输入的明文字符串
//      secret_key - 密钥
//  返回值:
//      string类型, 返回加密的结果
//  其他说明:
//      - 请使用`convert_string_to_des_block()`函数将string类型转换为DES_cblock类型。
//        若自行转换，可能导致测试无法通过
//      - secret_key使用前请用`DES_string_to_key()`设置key；

string des_encrypt(string plain, string secret_key) 
{
    DES_cblock input,key_,output;//声明一些基本参数
    DES_key_schedule schedule;//DES采用的key是序列，所以需要转换
    convert_string_to_des_block(plain,input);//将输入的密文转换成DES类型
    DES_string_to_key(secret_key.c_str(), &key_);//将输入的密钥转换成DES类型
    DES_set_key_unchecked(&key_, &schedule);//将DES类型的密钥再次转换成序列
    DES_ecb_encrypt(&input,&output,&schedule, DES_ENCRYPT);//加解密的函数头一样，区别是最后一个参数，因为不是类型，所以需要加&
    string str(reinterpret_cast<const char*>(output),plain.length());
    return str;

}
// 该函数实现DES-ECB解密算法功能
//  参数:
//      cipher - 输入的密文字符串
//      secret_key - 密钥
//  返回值:
//      string类型, 返回解密的结果
//  其他说明:
//      - 请使用`convert_string_to_des_block()`函数将string类型转换为DES_cblock类型。
//        若自行转换，可能导致测试无法通过
//      - secret_key使用前请用`DES_string_to_key()`设置key
string des_decrypt(string cipher, string secret_key) {
    DES_cblock input,key_,output;
    DES_key_schedule schedule;
    convert_string_to_des_block(cipher,input);
    DES_string_to_key(secret_key.c_str(), &key_);
    DES_set_key_unchecked(&key_, &schedule);
    DES_ecb_encrypt(&input,&output,&schedule, DES_DECRYPT);
    string str(reinterpret_cast<const char*>(output),cipher.length());
    return str;
}

```

## SHA1

![image-20231127213854724](C:/Users/LEGION/AppData/Roaming/Typora/typora-user-images/image-20231127213854724.png)

![image-20231127213908847](C:/Users/LEGION/AppData/Roaming/Typora/typora-user-images/image-20231127213908847.png)

```c++
string sha1_digest(string msg) {
    //可以用SHA1直接对短密文加密，以下是短、长密文都适用的
    SHA_CTX ctx;//声明类型
    SHA1_Init(&ctx);//初始化
    SHA1_Update(&ctx, msg.c_str(), msg.length());//意思是将每块消息都进行更行映射，信息存储在ctx中

    unsigned char hash[SHA_DIGEST_LENGTH];  // SHA_DIGEST_LENGTH is 20 for SHA-1
    SHA1_Final(hash, &ctx);//将ctx中的信息存入到结果数组中

    // 将二进制哈希值直接作为std::string返回
    return string(reinterpret_cast<const char*>(hash), SHA_DIGEST_LENGTH);
}
```

## 密码学基础知识回顾

![image-20231129165440664](C:/Users/LEGION/AppData/Roaming/Typora/typora-user-images/image-20231129165440664.png)

密码的四个性质：保密性、完整性、认证性、不可否认性

- 唯密文攻击：只知道密文
- 已知明文攻击：一些明文和对应的密文
- 选择明文攻击：可以选择一些明文，并且得到相应的密文
- 选择密文攻击：选择密文得到相应的明文