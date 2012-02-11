using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for ImageFileInfo
/// </summary>
public class ImageFileInfo
{
	public ImageFileInfo(string strfn)
	{
        FileName = strfn;
	}
    private string fileName;

    public string FileName
    {
        get { return fileName; }
        set { fileName = value; }
    }
    
}