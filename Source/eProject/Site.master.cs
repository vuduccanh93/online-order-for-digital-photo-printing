using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!(Request.Cookies["UserName"] == null))
        {
            lbtnUserName.Text = Request.Cookies["UserName"].Value;
            lbtnUserName.Visible = true;
            lbtnLogout.Visible = true;
            lbtnVewCart.Visible = true;
            lbtnLogin.Visible = false;
            lbtnRegister.Visible = false;
            lblGuest.Visible = false;
            
        }
        else {
            lbtnUserName.Visible = false;
            lbtnLogout.Visible = false;
            lbtnVewCart.Visible = false;
            lbtnLogin.Visible = true;
            lbtnRegister.Visible = true;
            lblGuest.Visible = true;
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }
    protected void lbtnUserName_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerPanel.aspx");
    }
    protected void lbtnLogout_Click(object sender, EventArgs e)
    {
        //Response.Cookies["UserName"].Value = null;
        //Response.Cookies["Password"].Value = null;
        Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(-1);
        Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);
        Response.Redirect("Login.aspx");
    }
    protected void lbtnVewCart_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserCart.aspx");
    }
}
