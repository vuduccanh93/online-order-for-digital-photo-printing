using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class admin_OrderDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null)
        {
            Response.Redirect("OrderManagement.aspx");
        }
        else
        {
            string orderid = Request.QueryString["id"];
            SqlConnection con = DBConnection.getConnection();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Orders WHERE OrderID = @orderid", con);
            cmd.Parameters.Add("@orderid", orderid);
            SqlDataReader reader = cmd.ExecuteReader();
            DetailsView1.DataSource = reader;
            DetailsView1.DataBind();
            reader.Close();

            SqlCommand cmd1 = new SqlCommand("SELECT * FROM Customer WHERE CustomerID = @customerid", con);
            cmd1.Parameters.Add("@customerid", DetailsView1.Rows[1].Cells[1].Text);
            SqlDataReader reader1 = cmd1.ExecuteReader();
            DetailsView2.DataSource = reader1;
            DetailsView2.DataBind();
            reader1.Close();
            SqlCommand cmd2 = new SqlCommand("SELECT * FROM OrderDetails WHERE OrderID = @orderid", con);
            cmd2.Parameters.Add("@orderid", orderid);
            SqlDataReader reader2 = cmd2.ExecuteReader();
            GridView1.DataSource = reader2;
            GridView1.DataBind();
            reader2.Close();
            SqlCommand cmd3 = new SqlCommand("SELECT * FROM PaymentMethods WHERE PaymentMethodID = @paymentid", con);
            cmd3.Parameters.Add("@paymentid", DetailsView1.Rows[2].Cells[1].Text);
            SqlDataReader reader3 = cmd3.ExecuteReader();
            while (reader3.Read())
            {
                Label1.Text = "Payment Method : " + reader3["PaymentMethod"].ToString();
            }
            reader3.Close();
            con.Close();
                
            
            
            
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string orderid = Request.QueryString["id"];
        SqlConnection con = DBConnection.getConnection();
        SqlCommand cmd = new SqlCommand("UPDATE Orders SET OrderStatus = @status WHERE OrderID = @orderid ", con);
        cmd.Parameters.Add("@status", "Shipped");
        cmd.Parameters.Add("@orderid", orderid);
        cmd.ExecuteNonQuery();
        SqlCommand cmd1 = new SqlCommand("SELECT * FROM Orders WHERE CustomerID = @customerid ", con);
        cmd1.Parameters.Add("@customerid", DetailsView1.Rows[1].Cells[1].Text);
        SqlDataReader reader = cmd1.ExecuteReader();
        int count = 0;
        while (reader.Read())
        {
            if (reader["OrderStatus"].ToString().Equals("Pending"))
            {
                count++;
            }

        }
        if (count == 0)
        {
            string imgdir = Server.MapPath("Images");
            System.IO.Directory.Delete(imgdir + "\\" + Request.Cookies["username"].Value,true);
        }
        Response.Redirect(Request.RawUrl);
        con.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string orderid = Request.QueryString["id"];
        SqlConnection con = DBConnection.getConnection();
        SqlCommand cmd = new SqlCommand("UPDATE Orders SET OrderStatus = @status WHERE OrderID = @orderid ", con);
        cmd.Parameters.Add("@status", "Declined");
        cmd.Parameters.Add("@orderid", orderid);
        cmd.ExecuteNonQuery();
        Response.Redirect(Request.RawUrl);
        con.Close();
    }
}