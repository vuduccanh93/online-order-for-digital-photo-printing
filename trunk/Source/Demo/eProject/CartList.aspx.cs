using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

public partial class CartList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Cart cart = new Cart();
        IEnumerator enm = cart.Items.GetEnumerator();
        int i = 0;
        int t = cart.Items.Count;
        TableRow[] row = new TableRow[t];
        TableCell[] col = new TableCell[4];
        tbMain.BorderWidth = 0;
        tbMain.CellPadding = 10;

        while (enm.MoveNext())
        {
            Object obj = enm.Current;
            CartItem cartItem = new CartItem();
            cartItem = (CartItem)obj;

            row[i] = new TableRow();
            col[0] = new TableCell();
            col[1] = new TableCell();
            tbMain.Rows.Add(row[i]);

            row[i].Cells.Add(col[0]);
            row[i].Cells.Add(col[1]);

            col[0].Text = "<b>" + cartItem.ImageUrl.ToString() + "</b>";
            col[0].HorizontalAlign = HorizontalAlign.Center;
            col[0].BorderWidth = 1;
            col[0].Width = Unit.Percentage(50);

            col[1].Text = cartItem.Res.ToString();
            col[1].HorizontalAlign = HorizontalAlign.Left;
            col[1].BorderWidth = 1;
            col[1].Width = Unit.Percentage(20);

            //col[2].Text = cartItem.Quantity.ToString();
            //col[2].HorizontalAlign = HorizontalAlign.Left;
            //col[2].BorderWidth = 1;
            //col[2].Width = Unit.Percentage(20);

            //col[3].Text = cartItem.Price.ToString() + "$";
            //col[3].HorizontalAlign = HorizontalAlign.Left;
            //col[3].BorderWidth = 1;
            //col[3].Width = Unit.Percentage(10);
            //i++;
        }
    }
}