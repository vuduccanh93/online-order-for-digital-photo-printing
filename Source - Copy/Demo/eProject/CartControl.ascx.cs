using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CartControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
                
            ReBindGrid();
                
    }
    private void ReBindGrid()
    {
        gvShoppingCart.DataSource = Cart.Instance.Items;
        gvShoppingCart.DataBind();        
    }
    protected void gvShoppingCart_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            e.Row.Cells[4].Text = "Total: " + Cart.Instance.GetSubTotal().ToString("C");
        }
    }
    protected void gvShoppingCart_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Remove")
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
            string imageurl = commandArgs[0];
            string res = commandArgs[1];            
            Cart.Instance.RemoveItem(imageurl,res);
        }

        ReBindGrid();
    }
    protected void btnUpdateCart_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in gvShoppingCart.Rows)
        {
            if (row.RowType == DataControlRowType.DataRow)
            {
                // We'll use a try catch block in case something other than a number is typed in
                // If so, we'll just ignore it.
                try
                {
                    // Get the productId from the GridView's datakeys
                    int productId = Convert.ToInt32(gvShoppingCart.DataKeys[row.RowIndex].Value);
                    string imageurl = row.Cells[1].Text;
                    string res = row.Cells[2].Text;
                    // Find the quantity TextBox and retrieve the value
                    int quantity = Int32.Parse(((TextBox)row.Cells[3].FindControl("txtQuantity")).Text);
                    Cart.Instance.SetItemQuantity(imageurl,res,3);
                    
                }
                catch (FormatException) { }
            }
        }

        ReBindGrid();
        
        
    }

}