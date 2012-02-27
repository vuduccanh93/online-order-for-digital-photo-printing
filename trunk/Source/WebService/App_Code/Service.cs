using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]

public class Service : System.Web.Services.WebService
{
    public Service () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }
    byte[] Buffer = new byte[0];
    public string DecryptTripleDES(string base64Text, string Key)
    {

        System.Security.Cryptography.TripleDESCryptoServiceProvider DES = new System.Security.Cryptography.TripleDESCryptoServiceProvider();

        System.Security.Cryptography.MD5CryptoServiceProvider hashMD5 = new System.Security.Cryptography.MD5CryptoServiceProvider();

        DES.Key = hashMD5.ComputeHash(System.Text.ASCIIEncoding.ASCII.GetBytes(Key));

        DES.Mode = System.Security.Cryptography.CipherMode.ECB;

        System.Security.Cryptography.ICryptoTransform DESDecrypt = DES.CreateDecryptor();

        Buffer = Convert.FromBase64String(base64Text);

        string DecTripleDES = System.Text.ASCIIEncoding.ASCII.GetString(DESDecrypt.TransformFinalBlock(Buffer, 0, Buffer.Length));

        return DecTripleDES;

    }
    [WebMethod]
    public ReturnIndicator CheckCC(string CardNumberEncrypted)
    {
        ReturnIndicator ri = new ReturnIndicator();
        ri.CardValid = false;
        string CardNumber = DecryptTripleDES(CardNumberEncrypted, "aptech");

        byte[] number = new byte[16];


        int len = 0;
        for (int i = 0; i < CardNumber.Length; i++)
        {
            if (char.IsDigit(CardNumber, i))
            {
                if (len == 16) return ri;
                number[len++] = byte.Parse(CardNumber[i].ToString());
            }
        }


        int sum = 0;
        for (int i = len - 1; i >= 0; i--)
        {
            if (i % 2 == len % 2)
            {
                int n = number[i] * 2;
                sum += (n / 10) + (n % 10);
            }
            else
                sum += number[i];
        }

        ri.CardValid = (bool)(sum % 10 == 0);
        if ((ri.CardValid == true))
        {
            switch (CardNumber.Substring(0, 1))
            {
                case "3":
                    ri.CardType = "AMEX/Diners Club/JCB";
                    break;
                case "4":
                    ri.CardType = "VISA";
                    break;
                case "5":
                    ri.CardType = "MasterCard";
                    break;
                case "6":
                    ri.CardType = "Discover";
                    break;
                default:
                    ri.CardType = "Unknown";
                    break;
            }
        }
        else
        {
            ri.CardType = "NONE";
        }
        return ri;
    }

    
    public class ReturnIndicator
    {
        public string CardType;
        public bool CardValid;
    }
    
}