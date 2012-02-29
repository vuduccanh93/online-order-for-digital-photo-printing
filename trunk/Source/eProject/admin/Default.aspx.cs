using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["Loggedin"].Value == "y")
        {
            Response.Redirect("OrderManagement.aspx");
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }
}