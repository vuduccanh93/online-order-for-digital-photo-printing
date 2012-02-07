using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Album : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
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
            // Change the Absolute path to relative path of File Name and add to the List
            imageFileList.Add(new ImageFileInfo(url));
        }
        
        GridView1.DataSource = imageFileList;
        GridView1.DataBind();
    }
    
    
}