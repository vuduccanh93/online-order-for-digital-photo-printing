using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["username"] != null)
        {
            Label1.Text = Request.Cookies["username"].Value;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Cookies["Loggedin"].Value = "n";
        Response.Cookies["username"].Value = "";
        Response.Redirect("Login.aspx");

    }
}
