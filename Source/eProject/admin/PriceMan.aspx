<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PriceMan.aspx.cs" Inherits="admin_PriceMan" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataKeyNames="RES" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        <asp:BoundField DataField="RES" HeaderText="RES" ReadOnly="True" 
            SortExpression="RES" />
        <asp:BoundField DataField="Money" HeaderText="Money" SortExpression="Money" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:Online_Order_For_Digital_Photo_PrintingConnectionString %>" 
    DeleteCommand="DELETE FROM [Price] WHERE [RES] = @RES" 
    InsertCommand="INSERT INTO [Price] ([RES], [Money]) VALUES (@RES, @Money)" 
    SelectCommand="SELECT [RES], [Money] FROM [Price]" 
    UpdateCommand="UPDATE [Price] SET [Money] = @Money WHERE [RES] = @RES">
    <DeleteParameters>
        <asp:Parameter Name="RES" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="RES" Type="String" />
        <asp:Parameter Name="Money" Type="Decimal" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Money" Type="Decimal" />
        <asp:Parameter Name="RES" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
