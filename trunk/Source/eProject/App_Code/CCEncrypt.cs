using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CCEncrypt
/// </summary>
public class CCEncrypt
{
    byte[] Buffer = new byte[0];
    

    public string EncryptTripleDES(string Plaintext, string Key)
    {

        System.Security.Cryptography.TripleDESCryptoServiceProvider DES = new System.Security.Cryptography.TripleDESCryptoServiceProvider();

        System.Security.Cryptography.MD5CryptoServiceProvider hashMD5 = new System.Security.Cryptography.MD5CryptoServiceProvider();

        DES.Key = hashMD5.ComputeHash(System.Text.ASCIIEncoding.ASCII.GetBytes(Key));

        DES.Mode = System.Security.Cryptography.CipherMode.ECB;

        System.Security.Cryptography.ICryptoTransform DESEncrypt = DES.CreateEncryptor();

        Buffer = System.Text.ASCIIEncoding.ASCII.GetBytes(Plaintext);

        string TripleDES = Convert.ToBase64String(DESEncrypt.TransformFinalBlock(Buffer, 0, Buffer.Length));

        return TripleDES;

    }
	public CCEncrypt()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}