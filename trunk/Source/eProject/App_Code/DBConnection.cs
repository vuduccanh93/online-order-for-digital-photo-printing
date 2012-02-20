using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;


    public class DBConnection
    {
        public static SqlConnection getConnection()
        {
            try
            {
                string constr = ConfigurationManager.ConnectionStrings["myCon"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                con.Open();
                return con;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }

