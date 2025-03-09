// #include <bits/stdc++.h>
// #include <openssl/bn.h>
// #include <openssl/pem.h>
// #include <openssl/rsa.h>

// //  修改以下两个个宏定义为给出的RSA 2048密钥(密钥存储在keys文件夹中)的绝对路径(或不做修改使用默认的相对路径),
// //  用于后续调用
// //      PUBLICKEY 为 rsa公钥的存储路径
// //      PRIVATEKEY 为rsa私钥的存储路径
// #define PUBLICKEY "../keys/public.pem"
// #define PRIVATEKEY "../keys/private.pem"

// using namespace std;
// //RSA 私钥、公钥用 RSA*指针表示
// RSA* rsa_private_key = NULL; // 需要读取的rsa私钥，
// RSA* rsa_public_key = NULL; // 需要读取的rsa公钥

// // 该函数用于读取rsa密钥(公钥和私钥)
// //  返回值:
// //      true 代表读取成功
// //      false 代表读取失败
// // 其他说明:
// // //      通过宏定义的路径和口令将rsa的公钥,私钥分别读取到rsa_private_key和rsa_public_key中s

// bool load_RSA_keys() 
// {
//     FILE *p=NULL,*s=NULL;//文件指针，FILE大写
//     const char* rsa_public_path=PUBLICKEY;//fopen第一个参数是const char*类型，所以需要转换
//     const char* rsa_private_path=PRIVATEKEY;
//     p=fopen(rsa_public_path,"r");//"r" 字符串格式 而不是 'r'
//     s=fopen(rsa_private_path,"r");
//     if(p!=NULL && s!=NULL)
//     {
//         PEM_read_RSA_PUBKEY(p,&rsa_public_key,NULL,NULL);//PEM_read_PUBKEY读取 -----BEGIN PUBLIC KEY-----格式
//         										//PEM_read_RSAPublicKey读取-----BEGIN RSA PRIVATE KEY-----
//         PEM_read_RSAPrivateKey(s,&rsa_private_key,NULL,NULL);
//     }
//     else{
//         return false;
//     }
//     fclose(p);
//     fclose(s);
//     return true;
// }

// string RSA_Encryption(string plaintext)
// {
//     load_RSA_keys();
//     int flen=plaintext.length(),elen;
//     const char * plaintext_cstr=plaintext.c_str();
//     unsigned char  res[1000];
//     elen=RSA_public_encrypt(flen,reinterpret_cast<const unsigned char *>(plaintext_cstr),res,rsa_public_key,RSA_PKCS1_PADDING);
//     string str(reinterpret_cast< char*>(res),elen);
//     return str;
// }

// // 该函数用于进行rsa私钥解密
// //  参数:
// //      ciphertext 代表输入的密文字符串
// //  返回值:
// //      string类型, 返回解密的结果

// string RSA_Decryption(string ciphertext)
// {
//     load_RSA_keys();
//     int flen=ciphertext.length();
//     int mlen;
//     const char* ciphertext_cstr=ciphertext.c_str();
//     unsigned char res[1000];
//     mlen= RSA_private_decrypt(flen,reinterpret_cast<const unsigned char*>(ciphertext_cstr),res,rsa_private_key,RSA_PKCS1_PADDING);
//     string str(reinterpret_cast<char *>(res),mlen);
//     return str;
// }
// // 该函数用于进行rsa签名生成
// //  参数:
// //      input 代表输入的明文字符串
// //  返回值:
// //      string类型, 返回解密签名结果后的明文
// string RSA_signature_signing(string input)
// {
//     load_RSA_keys();
//     int flen=input.length();
//     int elen;
//     const char* input_cstr=input.c_str();
//     unsigned char res[1000];
//     elen=RSA_private_encrypt(flen,reinterpret_cast<const unsigned char*>(input_cstr),res,rsa_private_key,RSA_PKCS1_PADDING);
//     string str(reinterpret_cast<char *>(res),elen);
//     return str;
// }

// // 该函数用于进行rsa签名验证
// //  参数:
// //      message 代表输入的签名结果
// //      signature 代表签名的结果
// //  返回值:
// //      bool类型, 返回签名的结果, 验证成功为返回true, 失败返回false
// bool RSA_signature_verify(string message, string signature)
// {
//     load_RSA_keys();
//     int flen=signature.length(),elen;
//     const char * signature_cstr=signature.c_str();
//     unsigned char  res[1000];
//     elen=RSA_public_decrypt(flen,reinterpret_cast<const unsigned char *>(signature_cstr),res,rsa_public_key,RSA_PKCS1_PADDING);
//     string str(reinterpret_cast< char*>(res),elen);
//     return str==message;

// }
#include <bits/stdc++.h>
#include <openssl/bn.h>
#include <openssl/pem.h>
#include <openssl/rsa.h>

//  修改以下两个个宏定义为给出的RSA 2048密钥(密钥存储在keys文件夹中)的绝对路径(或不做修改使用默认的相对路径),
//  用于后续调用
//      PUBLICKEY 为 rsa公钥的存储路径
//      PRIVATEKEY 为rsa私钥的存储路径
#define PUBLICKEY "rsa_pub.pem"
#define PRIVATEKEY "rsa_pri.pem"

using namespace std;

RSA* rsa_private_key = NULL; // 需要读取的rsa私钥
RSA* rsa_public_key = NULL; // 需要读取的rsa公钥

// 该函数用于读取rsa密钥(公钥和私钥)
//  返回值:
//      true 代表读取成功
//      false 代表读取失败
// 其他说明:
//      通过宏定义的路径和口令将rsa的公钥,私钥分别读取到rsa_private_key和rsa_public_key中
bool load_RSA_keys() 
{
    FILE *p=NULL;
    FILE *s=NULL;
    const char* rsa_public_key_path=PUBLICKEY;
    const char* rsa_private_key_path=PRIVATEKEY;
    if((p=fopen(rsa_public_key_path,"r"))==NULL)
    {
        return false;
    }
    PEM_read_RSA_PUBKEY(p, &rsa_public_key,NULL, NULL);
    fclose(p);
    if((s=fopen(rsa_private_key_path,"r"))==NULL)
    {
        return false;
    }
    PEM_read_RSAPrivateKey(s, &rsa_private_key,NULL, NULL);
    fclose(s);

}

// 该函数用于进行rsa公钥加密
//  参数:
//      plaintext 代表输入的明文字符串
//  返回值:
//      string类型, 返回加密的结果
string RSA_Encryption(string plaintext)
{
    load_RSA_keys();
    const char* plaintext_cstr=plaintext.c_str();
    int flen=plaintext.length();
    unsigned char res[10000];
    int elen=RSA_public_encrypt(flen, reinterpret_cast<const unsigned char*>(plaintext_cstr),res, rsa_public_key, RSA_PKCS1_PADDING);
    string str(reinterpret_cast<const char*>(res),elen);
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
    const char* ciphertext_cstr=ciphertext.c_str();
    int flen=ciphertext.length();
    unsigned char res[10000];
    int elen=RSA_private_decrypt(flen, reinterpret_cast<const unsigned char*>(ciphertext_cstr),res, rsa_private_key, RSA_PKCS1_PADDING);
    string str(reinterpret_cast<const char*>(res),elen);
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
    const char* input_cstr=input.c_str();
    int flen=input.length();
    unsigned char res[10000];
    int elen=RSA_private_encrypt(flen, reinterpret_cast<const unsigned char*>(input_cstr),res, rsa_private_key, RSA_PKCS1_PADDING);
    string str(reinterpret_cast<const char*>(res),elen);
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
    const char* signature_cstr=signature.c_str();
    int flen=signature.length();
    unsigned char res[10000];
    int elen= RSA_public_decrypt(flen, reinterpret_cast<const unsigned char*>(signature_cstr),res, rsa_public_key, RSA_PKCS1_PADDING);
    string str(reinterpret_cast<const char*>(res),elen);
    return str==message;
}