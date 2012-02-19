using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Order : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {

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
            cmd.Parameters.Add(new SqlParameter("@UserName", "longnh"));
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
            MultiView1.ActiveViewIndex = 2;
        }
        
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        MultiView1.ActiveViewIndex = 1;
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 2;
    }
    protected void btnContinue_Click(object sender, EventArgs e)
    {
        if (ddlPaymentMethod.SelectedValue.ToString().Equals("Online"))
        {
            MultiView1.ActiveViewIndex = 0;
        }
        else { 
        
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
}