using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_CustomerSearch : System.Web.UI.Page
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        SqlDataSource1.SelectCommand = "SELECT * FROM [Customer] WHERE (([Address] LIKE '%' + @search + '%') OR ([CustomerName] LIKE '%' + @search + '%') OR ([Email] LIKE '%' + @search + '%') OR ([UserName] LIKE '%' + @search + '%'))";
        
        SqlDataSource1.DataBind();
        GridView1.DataBind();
        GridView1.Visible = true;
    }
}