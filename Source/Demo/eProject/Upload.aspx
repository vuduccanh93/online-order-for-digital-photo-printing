<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Upload.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="Scripts/jquery.MultiFile.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:FileUpload ID="FileUpload1" runat="server"  class="multi" accept="png|jpg|jpeg|gif"/>
        <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
    
    </div>
    </form>
</body>
</html>
