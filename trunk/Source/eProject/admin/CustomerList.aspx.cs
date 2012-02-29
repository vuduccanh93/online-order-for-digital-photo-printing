using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_CustomerList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["Loggedin"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        if (!Request.Cookies["Loggedin"].Value.Equals("y"))
        {
            Response.Redirect("Login.aspx");
        }
    }
}