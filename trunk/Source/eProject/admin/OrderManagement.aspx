<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderManagement.aspx.cs" Inherits="admin_OrderManagement" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" DataKeyNames="OrderID">
            <Columns>
                <asp:HyperLinkField Text="View" DataNavigateUrlFields="OrderID" 
                    DataNavigateUrlFormatString="OrderDetail.aspx?id={0}" />
            </Columns>
            <EmptyDataTemplate>
                Not Found !
            </EmptyDataTemplate>
        </asp:GridView>
    
        <br />
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            Text="Filter Pending" />
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
            Text="Filter Shipped" />
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button3" runat="server" onclick="Button3_Click" 
            Text="Filter Declined" />
        <br />
        <br />
        <asp:Button ID="Button4" runat="server" onclick="Button4_Click" 
            Text="All Order" />
    
    </div>
    </form>
</body>
</html>
