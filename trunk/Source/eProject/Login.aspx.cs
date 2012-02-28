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

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        SqlConnection con1 = DBConnection.getConnection();
        SqlCommand cmd1 = new SqlCommand("SELECT UserName,Password FROM Customer WHERE UserName = @username AND Password = @password", con1);
        cmd1.Parameters.Add("@username", txtUserName.Text);
        cmd1.Parameters.Add("@password", txtPwd1.Text);
        SqlDataReader reader = cmd1.ExecuteReader();
        if (reader.HasRows)
        {
            Response.Cookies["UserName"].Value = txtUserName.Text;
            Response.Cookies["Password"].Value = txtPwd1.Text;
            Response.Redirect("Album.aspx");
            
        }
        else
        {
            lblMsg1.Text = "Username or Password invalid";
        }
    }
}