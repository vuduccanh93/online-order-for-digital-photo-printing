<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin/Admin.master" CodeFile="PriceMan.aspx.cs" Inherits="admin_PriceMan" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div id="header">
        	<h2>Admin Area</h2>
    <div id="topmenu">
            	<ul>
                	
                    <li><a href="OrderManagement.aspx">Orders</a></li>                	
                    <li><a href="OrderSearch.aspx">Search Orders</a></li>                    
                    <li><a href="CustomerList.aspx">Customers</a></li>
                    <li><a href="CustomerSearch.aspx">Search Customers</a></li>
                    <li class="current"><a href="PriceMan.aspx">Price Manager</a></li>
                    
              </ul>
          </div>
      </div>
      
        
        <div id="wrapper">
            <div id="content">
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
    ConnectionString="<%$ ConnectionStrings:myCon %>" 
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
           		</div>	
        </div>
</asp:Content>
