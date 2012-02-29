using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections;

public partial class Order : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            if (Request.Cookies["UserName"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {

                txtFullName.Enabled = false;
                txtAddress.Enabled = false;
                txtPhoneNumber.Enabled = false;
                txtEmail.Enabled = false;

                SqlDataReader dr1;
                SqlConnection con1 = DBConnection.getConnection();
                SqlCommand cmd1 = new SqlCommand("SELECT * FROM PaymentMethods", con1);
                dr1 = cmd1.ExecuteReader();
                while (dr1.Read())
                {
                    ddlPaymentMethod.Items.Add(dr1["PaymentMethod"].ToString());
                }
                dr1.Close();
                con1.Close();

                SqlDataReader dr;
                SqlConnection con = DBConnection.getConnection();
                SqlCommand cmd = new SqlCommand("SELECT * FROM Customer WHERE UserName like @UserName", con);
                cmd.Parameters.Add(new SqlParameter("@UserName", Request.Cookies["UserName"].Value));
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    txtFullName.Text = dr["CustomerName"].ToString();
                    txtAddress.Text = dr["Address"].ToString();
                    txtEmail.Text = dr["Email"].ToString();
                    txtPhoneNumber.Text = dr["PhoneNumber"].ToString();
                }
                dr.Close();
                con.Close();
                MultiView1.ActiveViewIndex = 5;
            }
        }
        
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        txtFullName2.Text = txtFullName.Text;
        txtAddress2.Text = txtAddress.Text;
        txtEmail2.Text = txtEmail.Text;
        txtPhoneNumber2.Text = txtPhoneNumber.Text;

        txtFullName3.Text = txtFullName1.Text;
        txtAddress3.Text = txtAddress1.Text;
        txtEmail3.Text = txtEmail1.Text;
        txtPhoneNumber3.Text = txtPhoneNumber1.Text;
        MultiView1.ActiveViewIndex = 2;
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 5;
    }
    protected void btnContinue_Click(object sender, EventArgs e)
    {
        int id;
        DateTime datetime = DateTime.Now;
        if (ddlPaymentMethod.SelectedValue.ToString().Equals("Online"))
        {
            MultiView1.ActiveViewIndex = 3;
        }
        else {
            id = 2;
            SqlConnection con = DBConnection.getConnection();
            SqlCommand cmd = new SqlCommand("INSERT INTO Orders VALUES ((SELECT Customer.CustomerID FROM Customer WHERE Customer.UserName = @UserName), @PaymentMethodID, @OrderTime, @ShippingAddress, @PaymentDetail, @TotalPrice, @OrderStatus)", con);
            //SqlConnection con0 = DBConnection.getConnection();
            //SqlCommand cmd0 = new SqlCommand(" SELECT CustomerID FROM", con0);
            cmd.Parameters.Add(new SqlParameter("@UserName", Request.Cookies["UserName"].Value));
            cmd.Parameters.Add(new SqlParameter("@PaymentMethodID", id));
            cmd.Parameters.Add(new SqlParameter("@OrderTime", datetime));
            cmd.Parameters.Add(new SqlParameter("@ShippingAddress", txtAddress3.Text));
            cmd.Parameters.Add(new SqlParameter("@PaymentDetail", "Direct Payment"));
            cmd.Parameters.Add(new SqlParameter("@TotalPrice", Int32.Parse(Cart.Instance.GetSubTotal().ToString())));
            cmd.Parameters.Add(new SqlParameter("@OrderStatus", "Pending"));
            cmd.ExecuteNonQuery();
            con.Close();

            IEnumerator enm = Cart.Instance.Items.GetEnumerator();
            while (enm.MoveNext())
            {
                Object obj = enm.Current;
                CartItem item = new CartItem();
                item = (CartItem)obj;

                SqlDataReader dr;
                SqlConnection con1 = DBConnection.getConnection();
                SqlCommand cmd1 = new SqlCommand("INSERT INTO OrderDetails VALUES (@OrderID, @ImageUrl, @RES, @Quantity, @TPrice)", con1);
                SqlCommand cmd2 = new SqlCommand("SELECT TOP 1 * FROM Orders Order BY OrderID DESC", con1);
                dr = cmd2.ExecuteReader();
                while (dr.Read()) {
                    cmd1.Parameters.Add(new SqlParameter("@OrderID", dr["OrderID"]));
                }
                dr.Close();
                cmd1.Parameters.Add(new SqlParameter("@ImageUrl", item.ImageUrl));
                cmd1.Parameters.Add(new SqlParameter("@RES", item.Res));
                cmd1.Parameters.Add(new SqlParameter("@Quantity", item.Quantity));
                cmd1.Parameters.Add(new SqlParameter("@TPrice", item.TotalPrice));
                cmd1.ExecuteNonQuery();
                con1.Close();
            }
            MultiView1.ActiveViewIndex = 1;
        }
        
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 4;
    }
    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 4;
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 5;
    }
    protected void btnAccept_Click(object sender, EventArgs e)
    {
        CCEncrypt cce = new CCEncrypt();
        string ccencrypted = cce.EncryptTripleDES(txtCardNumber.Text, "aptech");
        ccservice.Service ccser = new ccservice.Service();
        bool valid = ccser.CheckCC(ccencrypted).CardValid;
        string ct = ccser.CheckCC(ccencrypted).CardType;
        if (valid == true)
        {
            Label9.Visible = false;
            int id = 1;
            DateTime datetime = DateTime.Now;
            SqlConnection con = DBConnection.getConnection();
            SqlCommand cmd = new SqlCommand("INSERT INTO Orders VALUES ((SELECT Customer.CustomerID FROM Customer WHERE Customer.UserName = @UserName), @PaymentMethodID, @OrderTime, @ShippingAddress, @PaymentDetail, @TotalPrice, @OrderStatus)", con);
            cmd.Parameters.Add(new SqlParameter("@UserName", Request.Cookies["UserName"].Value));
            cmd.Parameters.Add(new SqlParameter("@PaymentMethodID", id));
            cmd.Parameters.Add(new SqlParameter("@OrderTime", datetime));
            cmd.Parameters.Add(new SqlParameter("@ShippingAddress", txtAddress3.Text));
            cmd.Parameters.Add(new SqlParameter("@PaymentDetail", ct));
            cmd.Parameters.Add(new SqlParameter("@TotalPrice", Int32.Parse(Cart.Instance.GetSubTotal().ToString())));
            cmd.Parameters.Add(new SqlParameter("@OrderStatus", "Pending"));
            cmd.ExecuteNonQuery();
            con.Close();

            IEnumerator enm = Cart.Instance.Items.GetEnumerator();
            while (enm.MoveNext())
            {
                Object obj = enm.Current;
                CartItem item = new CartItem();
                item = (CartItem)obj;

                SqlDataReader dr;
                SqlConnection con1 = DBConnection.getConnection();
                SqlCommand cmd1 = new SqlCommand("INSERT INTO OrderDetails VALUES (@OrderID, @ImageUrl, @RES, @Quantity, @TPrice)", con1);
                SqlCommand cmd2 = new SqlCommand("SELECT TOP 1 * FROM Orders Order BY OrderID DESC", con1);
                dr = cmd2.ExecuteReader();
                while (dr.Read())
                {
                    cmd1.Parameters.Add(new SqlParameter("@OrderID", dr["OrderID"]));
                }
                dr.Close();
                cmd1.Parameters.Add(new SqlParameter("@ImageUrl", item.ImageUrl));
                cmd1.Parameters.Add(new SqlParameter("@RES", item.Res));
                cmd1.Parameters.Add(new SqlParameter("@Quantity", item.Quantity));
                cmd1.Parameters.Add(new SqlParameter("@TPrice", item.TotalPrice));
                cmd1.ExecuteNonQuery();
                con1.Close();
            }
            MultiView1.ActiveViewIndex = 0;
        }
        else
        {
            Label9.Visible = true;
        }
    }
    protected void btnCopy_Click(object sender, EventArgs e)
    {
        txtFullName1.Text = txtFullName.Text;
        txtAddress1.Text = txtAddress.Text;
        txtEmail1.Text = txtEmail.Text;
        txtPhoneNumber1.Text = txtPhoneNumber.Text;
    }
    protected void btnProfile_Click(object sender, EventArgs e)
    {
        Response.Redirect("CustomerPanel.aspx");
    }
}