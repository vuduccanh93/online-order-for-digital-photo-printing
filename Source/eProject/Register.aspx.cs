using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["UserName"] != null)
        {
            if (!Request.Cookies["UserName"].Value.Equals(""))
            {
                Response.Redirect("CustomerPanel.aspx");
            }
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        SqlConnection con1 = DBConnection.getConnection();
        SqlCommand cmd1 = new SqlCommand("SELECT UserName,Email FROM Customer WHERE UserName = @username OR Email = @email", con1);
        cmd1.Parameters.Add("@username", txtUserName.Text);
        cmd1.Parameters.Add("@email", txtEmailID.Text);
        SqlDataReader reader = cmd1.ExecuteReader();
        if (reader.HasRows)
        {
            lblMsg.Text = "Username or Email already had in our database";
        }
        else
        {
        string connectionString = ConfigurationManager.ConnectionStrings["Mycon"].ConnectionString;
        string insertSql = "INSERT INTO Customer (UserName,Password,CustomerName,Gender,Email,PhoneNumber,Address,DoB) values (@UserName,@Password,@CustomerName,@Gender,@Email,@PhoneNumber,@Address,@dob)";
        SqlConnection con = new SqlConnection(connectionString);


        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = insertSql;

        SqlParameter userName = new SqlParameter("@UserName", SqlDbType.VarChar, 50);
        userName.Value = txtUserName.Text.ToString();
        cmd.Parameters.Add(userName);

        SqlParameter pwd = new SqlParameter("@Password", SqlDbType.VarChar, 50);
        pwd.Value = txtPwd.Text.ToString();
        cmd.Parameters.Add(pwd);

        SqlParameter customerName = new SqlParameter("@CustomerName", SqlDbType.VarChar, 50);
        customerName.Value = txtCustomerName.Text.ToString();
        cmd.Parameters.Add(customerName);

        SqlParameter gender = new SqlParameter("@Gender", SqlDbType.VarChar, 10);
        gender.Value = rdoGender.SelectedItem.ToString();
        cmd.Parameters.Add(gender);

        SqlParameter email = new SqlParameter("@Email", SqlDbType.VarChar, 50);
        email.Value = txtEmailID.Text.ToString();
        cmd.Parameters.Add(email);

        SqlParameter phoneNumber = new SqlParameter("@PhoneNumber", SqlDbType.VarChar, 50);
        phoneNumber.Value = txtPhoneNumber.Text.ToString();
        cmd.Parameters.Add(phoneNumber);

        SqlParameter address = new SqlParameter("@Address", SqlDbType.VarChar, 50);
        address.Value = txtAdress.Text.ToString();
        cmd.Parameters.Add(address);


        cmd.Parameters.Add("@dob",txtDate.Text);

        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            lblMsg.Text = "User Registration successful";
            ClearControls(Page);
        }
        catch (SqlException ex)
        {
            string errorMessage = "Error in registring user";
            errorMessage += ex.Message;
            throw new Exception(errorMessage);

        }
        finally
        {
            con.Close();
        }
        
        }
    }
    public static void ClearControls(Control Parent)
    {
        foreach (Control c in Parent.Controls)
            ClearControls(c);
    }
}