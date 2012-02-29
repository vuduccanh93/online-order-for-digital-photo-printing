using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["Loggedin"] != null)
        {
            if (Request.Cookies["Loggedin"].Value.Equals("y"))
            {
                Response.Redirect("OrderManagement.aspx");
            }
        }

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection con1 = DBConnection.getConnection();
        SqlCommand cmd1 = new SqlCommand("SELECT * FROM Administrator WHERE UserName = @username AND Password = @password", con1);
        cmd1.Parameters.Add("@username", txtUserName.Text);
        cmd1.Parameters.Add("@password", txtPwd1.Text);
        SqlDataReader reader = cmd1.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                Response.Cookies["admin"].Value = reader["UserName"].ToString();
                Response.Cookies["Loggedin"].Value = "y";
            }
            Response.Redirect("OrderManagement.aspx");

        }
        else
        {
            lblMsg1.Text = "Username or Password invalid";
        }
    }
}