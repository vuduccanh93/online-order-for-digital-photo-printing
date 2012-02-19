using System;
using System.Collections.Generic;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for DBConnection
/// </summary>
public class DBConnection
{
	public static SqlConnection getConnection()
	{
        try
        {
            string constr = "Server=.;Database=Online_Order_For_Digital_Photo_Printing;User Id=sa;Password=adminadmin";
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