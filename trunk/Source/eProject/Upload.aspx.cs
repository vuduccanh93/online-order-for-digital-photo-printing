using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        if (Request.Cookies["UserName"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            // Get the HttpFileCollection
            HttpFileCollection hfc = Request.Files;
            string imgdir = Server.MapPath("Images");
            System.IO.Directory.CreateDirectory(imgdir + "\\" + Request.Cookies["UserName"].Value);
            imgdir = imgdir + "\\" + Request.Cookies["UserName"].Value;
            for (int i = 0; i < hfc.Count; i++)
            {
                HttpPostedFile hpf = hfc[i];
                if (hpf.ContentLength > 0)
                {

                    hpf.SaveAs(imgdir + "\\" + DateTime.Now.ToString("HHmmss_") +
                      System.IO.Path.GetFileName(hpf.FileName));
                    Label lblabc = new Label();
                    lblabc.Text = "<b>File: </b>" + hpf.FileName + " <b>Size:</b> " +
                        hpf.ContentLength + " <b>Type:</b> " + hpf.ContentType + " Uploaded Successfully <br/>";
                    Panel1.Controls.Add(lblabc);
                    Panel1.Controls.Add(new LiteralControl("<br />"));

                }
            }
            Panel1.Visible = true;
        }
        catch (Exception ex)
        {

        }

    }
    
}