<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderDetail.aspx.cs" Inherits="admin_OrderDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px">
        </asp:DetailsView>
        <br />
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <br />
        <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="125px">
        </asp:DetailsView>
        <br />
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        <br />
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            Text="Set as Shipped" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
            Text="Set as Declined" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
    </div>
    </form>
</body>
</html>
