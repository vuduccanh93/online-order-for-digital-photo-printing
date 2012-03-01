using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Collections;
using System.Data;
using System.Text;

public partial class CustomerPanel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        lblPassword.Visible = false;
        lblMess1.Visible = false;
        lblMess2.Visible = false;
        if (!IsPostBack)
        {
            //Response.Cookies["UserName"].Value = "";
            if (Request.Cookies["UserName"] == null)
            {
                Response.Redirect("Login.aspx");
            } else {
            //if (!IsPostBack)
            //{
                mtvProfile.ActiveViewIndex = 2;
                txtOldPass.Text = "";
                txtNewPass.Text = "";
                txtRePass.Text = "";

                SqlDataReader dr;
                SqlConnection con = DBConnection.getConnection();
                SqlCommand cmd = new SqlCommand("SELECT UserName, CustomerName, DoB, Gender, Email, PhoneNumber, Address FROM Customer WHERE UserName = @UserName", con);
                cmd.Parameters.Add(new SqlParameter("@UserName", Request.Cookies["UserName"].Value));
                dr = cmd.ExecuteReader();
                DateTime d = new DateTime();
                while (dr.Read())
                {
                    txtUserName.Text = dr["UserName"].ToString();
                    txtFullName.Text = dr["CustomerName"].ToString();
                    txtEmail.Text = dr["Email"].ToString();
                    txtPhoneNumber.Text = dr["PhoneNumber"].ToString();
                    d = DateTime.Parse(dr["DoB"].ToString());
                    txtDoB.Text = String.Format("{0:dd/MM/yyyy}", d);
                    txtAddress.Text = dr["Address"].ToString();
                    lblGender.Text = dr["Gender"].ToString();
                }
                dr.Close();
                con.Close();

                SqlConnection con1 = DBConnection.getConnection();
                SqlCommand cmd1 = new SqlCommand("SELECT Orders.OrderID, Customer.UserName, Customer.CustomerName, Orders.PaymentDetail,Orders.ShippingAddress, Orders.TotalPrice, Orders.OrderTime, Orders.OrderStatus FROM Orders INNER JOIN Customer ON Orders.CustomerID = Customer.CustomerID WHERE Customer.UserName like @UserName ORDER BY OrderTime DESC", con1);
                cmd1.Parameters.Add(new SqlParameter("@UserName", Request.Cookies["UserName"].Value));
                SqlDataReader reader = cmd1.ExecuteReader();
                GridView1.DataSource = reader;
                GridView1.DataBind();
            }
        }
        //catch (Exception ex) {
        //    Response.Write(Request.Cookies["username"].Value);
        //    //Response.Redirect("Login.aspx");
        //}
        
    }
    protected void btnClear1_Click(object sender, EventArgs e)
    {
        txtOldPass.Text = "";
        txtNewPass.Text = "";
        txtRePass.Text = "";
    }
    protected void btnChange1_Click(object sender, EventArgs e)
    {
        try {
            string pass = "";
            SqlDataReader dr;
            SqlConnection con = DBConnection.getConnection();
            SqlCommand cmd = new SqlCommand("SELECT Password FROM Customer WHERE UserName = @UserName", con);
            cmd.Parameters.Add(new SqlParameter("@UserName", Request.Cookies["UserName"].Value));
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                pass = dr["Password"].ToString();
            }
            dr.Close();
            con.Close();
            if (pass.Equals(txtOldPass.Text))
            {
                SqlConnection con1 = DBConnection.getConnection();
                SqlCommand cmd1 = new SqlCommand("UPDATE Customer SET Password = @Password WHERE UserName = @UserName", con1);
                cmd1.Parameters.Add(new SqlParameter("@Password", txtNewPass.Text));
                cmd1.Parameters.Add(new SqlParameter("@UserName", Request.Cookies["UserName"].Value));
                cmd1.ExecuteNonQuery();
                con1.Close();
                lblMess1.Visible = false;
            }
            else
            {
                lblPassword.Visible = true;
            }
        } catch (Exception ex) {
            lblMess1.Text = "Connection Error!";
            lblMess1.Visible = true;
        }
    }
    protected void btnClear2_Click(object sender, EventArgs e)
    {
        txtFullName.Text = "";
        txtAddress.Text = "";
        txtEmail.Text = "";
        txtPhoneNumber.Text = "";
        txtDoB.Text = "";
    }
    protected void btnChange2_Click(object sender, EventArgs e)
    {
        DateTime d = new DateTime();
        d = DateTime.ParseExact(txtDoB.Text, "dd/MM/yyyy", System.Globalization.CultureInfo.CurrentCulture);
        try {

            SqlConnection con = DBConnection.getConnection();
            SqlCommand cmd = new SqlCommand("UPDATE Customer SET CustomerName = @CustomerName, DoB = @DoB, Email = @Email, PhoneNumber = @PhoneNumber, Address = @Address FROM Customer WHERE UserName = @UserName", con);
            cmd.Parameters.Add(new SqlParameter("@UserName", Request.Cookies["UserName"].Value));
            cmd.Parameters.Add(new SqlParameter("@CustomerName", txtFullName.Text));
            cmd.Parameters.Add(new SqlParameter("@DoB", d));
            cmd.Parameters.Add(new SqlParameter("@Email", txtEmail.Text));
            cmd.Parameters.Add(new SqlParameter("@Address", txtAddress.Text));
            cmd.Parameters.Add(new SqlParameter("@PhoneNumber", txtPhoneNumber.Text));
            cmd.ExecuteNonQuery();
            con.Close();
            lblMess2.Text = "Profile is changed!";
            lblMess2.Visible = true;
        } catch(Exception ex) {
            lblMess2.Text = "Connection Error!";
            lblMess2.Visible = true;
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int currentRowIndex = Int32.Parse(e.CommandArgument.ToString());
        GridViewRow gvr = GridView1.Rows[currentRowIndex];
        string id = gvr.Cells[1].Text;
        SqlConnection con = DBConnection.getConnection();
        SqlCommand cmd = new SqlCommand("SELECT ImgUrl, RES, Quantity, TPrice FROM OrderDetails WHERE OrderID = @OrderID ORDER BY OrderDetailsID DESC", con);
        cmd.Parameters.Add(new SqlParameter("@OrderID", Int32.Parse(id)));
        SqlDataReader reader = cmd.ExecuteReader();
        GridView2.DataSource = reader;
        GridView2.DataBind();
        reader.Close();
        con.Close();
        mtvProfile.ActiveViewIndex = 0;
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        e.Row.Cells[1].Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        mtvProfile.ActiveViewIndex = 1;
    }
    protected void btnProfile_Click(object sender, EventArgs e)
    {
        mtvProfile.ActiveViewIndex = 2;
    }
    protected void btnOrder_Click(object sender, EventArgs e)
    {
        mtvProfile.ActiveViewIndex = 1;
    }
}