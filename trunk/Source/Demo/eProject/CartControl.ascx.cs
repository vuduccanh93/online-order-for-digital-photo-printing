using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CartControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!Page.IsPostBack)
        {
            ReBindGrid();
        }
        
    }
    private void ReBindGrid()
    {
        grdCart.DataSource = Cart.Instance.Items;
        DataBind();        
    }
}