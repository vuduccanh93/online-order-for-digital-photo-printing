using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Album : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Response.Cookies["username"].Value = "abc";
            string path = HttpContext.Current.Request.PhysicalApplicationPath + @"\Images\" + Request.Cookies["username"].Value;
            // string path = @"D:\Blog\Previous\ImageShow\Images\Temple"; // This statement also valid

            string[] extensions = { "*.jpg", "*.png", "*.bmp" };

            List<string> files = new List<string>();
            foreach (string filter in extensions)
            {
                files.AddRange(System.IO.Directory.GetFiles(path, filter));
            }

            IList<ImageFileInfo> imageFileList = new List<ImageFileInfo>();
            foreach (string strFileName in files)
            {
                string url = ResolveUrl(strFileName.Replace(Server.MapPath(""), "~/"));
                
                imageFileList.Add(new ImageFileInfo(url));
            }

            GridView1.DataSource = imageFileList;
            SqlDataReader dr;
            SqlConnection con = DBConnection.getConnection();
            SqlCommand cmd = new SqlCommand("SELECT RES FROM Price", con);
            
            GridView1.DataBind();
            foreach (GridViewRow row in GridView1.Rows)
            {

                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    string s = dr["RES"].ToString();
                    
                    ((DropDownList)row.Cells[2].FindControl("DropDownList1")).Items.Add(s);

                }
                dr.Close();
            }
            con.Close();
        }
    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int currentRowIndex = Int32.Parse(e.CommandArgument.ToString());
        GridViewRow gvr = GridView1.Rows[currentRowIndex];
        string currentCommand = e.CommandName;
        string url = GridView1.DataKeys[currentRowIndex].Value.ToString();
        DropDownList ddl = (DropDownList)gvr.Cells[3].FindControl("DropDownList1");
        string res = ddl.SelectedValue;
        if (currentCommand == "AddCart")
        {
            int money = 0;
            SqlDataReader dr;
            SqlConnection con = DBConnection.getConnection();
            SqlCommand cmd = new SqlCommand("SELECT Money FROM Price WHERE Res like @RES", con);
            cmd.Parameters.Add(new SqlParameter("@RES", res));
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                money = Int32.Parse(dr["Money"].ToString());
            }
            dr.Close();
            con.Close();
            Cart.Instance.AddItem(url, res, money);
            Response.Redirect("UserCart.aspx");
        }
        if (currentCommand == "Preview")
        {
            string[] reso = res.Split(new char[] { 'x' });
            string width = reso[0];
            string height = reso[1];
            string oriimg = url + "?width=" + width + "&height=" + height + "&&scale=both";
            
            Response.Write( "<script>window.open('"+ oriimg +"');</script>");
        }
    }

}