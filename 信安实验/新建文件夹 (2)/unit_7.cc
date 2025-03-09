// #include <iostream>
// #include <openssl/rc4.h>
// #include <openssl/des.h>
// #include <openssl/sha.h>

// using namespace std;

// // ================ RC4 Start ================================

// // 该函数实现RC4加密算法功能
// //  参数:
// //      data - 输入的明文字符串
// //      secret_key - 密钥
// //  返回值:
// //      string类型, 返回加密的结果。如果输入数据异常，则返回空字符串并退出
// // string rc4_encrypt(string data, string secret_key) {
// //     if(data==""||secret_key=="")
// //     {
// //         return "";
// //     }
// //     // RC4_KEY *s;  这样未创建实例，没有给s分配内存，应该直接创建实例
// //     RC4_KEY s;
// //     const char* secret_key_ctr=secret_key.c_str();
// //     const char* data_ctr=data.c_str();
// //     unsigned char res[data.length()+1];
// //     RC4_set_key(&s,secret_key.length(),reinterpret_cast<const unsigned char*>(secret_key_ctr) );//这里的第二个参数是密钥的长度
// //     RC4(&s,data.length(),reinterpret_cast<const unsigned char*>(data_ctr),res);//这里的第二个参数是数据的长度
// //     string str(reinterpret_cast<char *>(res),data.length());
// //     // TODO: 在此处实现你的代码
// //     return str;
// // }
// string rc4_encrypt(string data, string secret_key) {
//     if(data=="" || secret_key=="")
//     {
//         return "";
//     }
//     RC4_KEY* key_m=new RC4_KEY;
//     const char* secret_key_cstr=secret_key.c_str();
//     const char* data_cstr=data.c_str();
//     RC4_set_key( key_m, secret_key.length(), reinterpret_cast<const unsigned char*>(secret_key_cstr));
//     unsigned char outdata[data.length()+1];
//     RC4( key_m, data.length(), reinterpret_cast<const unsigned char*>(data_cstr),outdata);
//     string str(reinterpret_cast<const char*>(outdata),data.length());
//     // TODO: 在此处实现你的代码
//     return str;
// }
// // 该函数实现RC4解密算法功能
// //  参数:
// //      data - 输入的密文字符串
// //      secret_key - 密钥
// //  返回值:
// //      string类型, 返回解密的结果。如果输入数据异常，则返回空字符串并退出
// // 加密解密都是异或原理，所以解密就是再一次的加密
// string rc4_decrypt(string data, string secret_key) {
//       return rc4_encrypt(data, secret_key);
// }

// // ================ RC4   End ================================


// // ================ DES Start ================================

// // 请使用该函数将string类型转换为DES_cblock类型。（请勿更改此函数）
// // - 该函数仅用于转换明文和密文内容，请不要把用此函数转换secret_key。
// // - secret_key请使用`DES_string_to_key()`函数转换。

// void convert_string_to_des_block(string str, DES_cblock &output) {
//     for(int i = 0; i < 8; ++i) {
//         output[i] = str[i];
//     }
// }
// // 该函数实现DES-ECB加密算法功能
// //  参数:
// //      plain - 输入的明文字符串
// //      secret_key - 密钥
// //  返回值:
// //      string类型, 返回加密的结果
// //  其他说明:
// //      - 请使用`convert_string_to_des_block()`函数将string类型转换为DES_cblock类型。
// //        若自行转换，可能导致测试无法通过
// //      - secret_key使用前请用`DES_string_to_key()`设置key；

// string des_encrypt(string plain, string secret_key) 
// {
//     DES_cblock input,key_,output;
//     DES_key_schedule schedule;
//     convert_string_to_des_block(plain,input);
//     DES_string_to_key(secret_key.c_str(), &key_);
//     DES_set_key_unchecked(&key_, &schedule);
//     DES_ecb_encrypt(&input,&output,&schedule, DES_ENCRYPT);
//     string str(reinterpret_cast<const char*>(output),plain.length());
//     return str;

// }
// // 该函数实现DES-ECB解密算法功能
// //  参数:
// //      cipher - 输入的密文字符串
// //      secret_key - 密钥
// //  返回值:
// //      string类型, 返回解密的结果
// //  其他说明:
// //      - 请使用`convert_string_to_des_block()`函数将string类型转换为DES_cblock类型。
// //        若自行转换，可能导致测试无法通过
// //      - secret_key使用前请用`DES_string_to_key()`设置key
// string des_decrypt(string cipher, string secret_key) {
//     DES_cblock input,key_,output;
//     DES_key_schedule schedule;
//     convert_string_to_des_block(cipher,input);
//     DES_string_to_key(secret_key.c_str(), &key_);
//     DES_set_key_unchecked(&key_, &schedule);
//     DES_ecb_encrypt(&input,&output,&schedule, DES_DECRYPT);
//     string str(reinterpret_cast<const char*>(output),cipher.length());
//     return str;
// }

// // ================ DES   End ================================

// // ================ SHA1 Start ===============================

// // 该函数实现SHA1 hash算法功能
// //  参数:
// //      msg - 输入的字符串
// //  返回值:
// //      string类型, 返回sha1消息摘要结果
// string sha1_digest(string msg) {
//     SHA_CTX ctx;
//     SHA1_Init(&ctx);
//     SHA1_Update(&ctx, msg.c_str(), msg.length());

//     unsigned char hash[SHA_DIGEST_LENGTH];  // SHA_DIGEST_LENGTH is 20 for SHA-1
//     SHA1_Final(hash, &ctx);

//     // 将二进制哈希值直接作为std::string返回
//     return string(reinterpret_cast<const char*>(hash), SHA_DIGEST_LENGTH);
// }
// // ================ SHA1   End ===============================

// // ================ Helper Start =============================
// // Helper 说明：
// //     1. 你的测试已经全部完成了，不用再往下看了。
// //     2. 请勿修改以下内容。其他功能函数。尝试修改可能导致单元测试无法通过


// // ================ Helper End ================================
// // int main()
// // {
// //     cout<<sha1_digest("huang")<<endl;
// //     return 0;
// // }
#include <iostream>
#include <openssl/rc4.h>
#include <openssl/des.h>
#include <openssl/sha.h>
#include <bits/stdc++.h>
using namespace std;

// ================ RC4 Start ================================

// 该函数实现RC4加密算法功能
//  参数:
//      data - 输入的明文字符串
//      secret_key - 密钥
//  返回值:
//      string类型, 返回加密的结果。如果输入数据异常，则返回空字符串并退出
string rc4_encrypt(string data, string secret_key) {
    if(data=="" || secret_key=="")
    {
        return "";
    }

    RC4_KEY key;
    const char* data_cstr=data.c_str();
    const char* secret_key_cstr=secret_key.c_str();
    RC4_set_key(&key, secret_key.length(),reinterpret_cast<const unsigned char*>(secret_key_cstr));
    unsigned char res[data.length()];
    RC4(&key, data.length(), reinterpret_cast<const unsigned char*>(data_cstr),res);
    string str(reinterpret_cast<const  char*>(res),data.length());
    return str;
}

// 该函数实现RC4解密算法功能
//  参数:
//      data - 输入的密文字符串
//      secret_key - 密钥
//  返回值:
//      string类型, 返回解密的结果。如果输入数据异常，则返回空字符串并退出
string rc4_decrypt(string data, string secret_key) {
    // TODO: 在此处实现你的代码
    return rc4_encrypt(data, secret_key);
}

// ================ RC4   End ================================


// ================ DES Start ================================

// 请使用该函数将string类型转换为DES_cblock类型。（请勿更改此函数）
// - 该函数仅用于转换明文和密文内容，请不要把用此函数转换secret_key。
// - secret_key请使用`DES_string_to_key()`函数转换。
void convert_string_to_des_block(string str, DES_cblock &output);

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
string des_encrypt(string plain, string secret_key) {
    if(plain=="" || secret_key=="")
    {
        return "";
    }

    DES_cblock plain_des,key_des,res;
    convert_string_to_des_block(plain,plain_des);
    DES_string_to_key(secret_key.c_str(), &key_des);
    DES_key_schedule key_sche;
    DES_set_key_unchecked(&key_des, &key_sche);
    DES_ecb_encrypt(&plain_des, &res,&key_sche, DES_ENCRYPT);
    string str(reinterpret_cast<const char*>(res),plain.length());
    return str;
}

string des_decrypt(string cipher, string secret_key) {
    if(cipher=="" || secret_key=="") 
    {
        return "";
    }
    DES_cblock cipher_des,key_des,res;
    convert_string_to_des_block(cipher,cipher_des);
    DES_string_to_key(secret_key.c_str(), &key_des);
    DES_key_schedule key_sche;
    DES_set_key_unchecked(&key_des, &key_sche);
    DES_ecb_encrypt(&cipher_des, &res,&key_sche, DES_DECRYPT);
    string str(reinterpret_cast<const char*>(res),cipher.length());
    return str;
}


// ================ DES   End ================================

// ================ SHA1 Start ===============================

// 该函数实现SHA1 hash算法功能
//  参数:
//      msg - 输入的字符串
//  返回值:
//      string类型, 返回sha1消息摘要结果
string sha1_digest(string msg) {
    SHA_CTX ctx;
    SHA1_Init(&ctx);
    SHA1_Update(&ctx, msg.c_str(), msg.length());

    unsigned char hash[SHA_DIGEST_LENGTH];  // SHA_DIGEST_LENGTH is 20 for SHA-1
    SHA1_Final(hash, &ctx);

    // 将二进制哈希值直接作为std::string返回
    return string(reinterpret_cast<const char*>(hash), SHA_DIGEST_LENGTH);
}
// ================ SHA1   End ===============================

// ================ Helper Start =============================
// Helper 说明：
//     1. 你的测试已经全部完成了，不用再往下看了。
//     2. 请勿修改以下内容。其他功能函数。尝试修改可能导致单元测试无法通过

void convert_string_to_des_block(string str, DES_cblock &output) {
    for(int i = 0; i < 8; ++i) {
        output[i] = str[i];
    }
}
// ================ Helper End ================================
// int main()
// {
//     cout<<rc4_encrypt("21312312312312","@32131")<<endl;
// }
