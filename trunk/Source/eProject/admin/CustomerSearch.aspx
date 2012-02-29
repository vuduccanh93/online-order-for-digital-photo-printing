<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin/Admin.master" CodeFile="CustomerSearch.aspx.cs" Inherits="admin_CustomerSearch" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div id="header">
        	<h2>Admin Area</h2>
    <div id="topmenu">
            	<ul>
                	
                    <li><a href="OrderManagement.aspx">Orders</a></li>                	
                    <li><a href="OrderSearch.aspx">Search Orders</a></li>                    
                    <li><a href="CustomerList.aspx">Customers</a></li>
                    <li class="current"><a href="CustomerSearch.aspx">Search Customers</a></li>
                    <li><a href="PriceMan.aspx">Price Manager</a></li>
                    
              </ul>
          </div>
      </div>
      
        
        <div id="wrapper">
            <div id="content">
    <div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="CustomerID" DataSourceID="SqlDataSource1" Visible="False">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" />
                <asp:BoundField DataField="UserName" HeaderText="UserName" 
                    SortExpression="UserName" />
                <asp:BoundField DataField="Password" HeaderText="Password" 
                    SortExpression="Password" />
                <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" 
                    SortExpression="CustomerName" />
                <asp:BoundField DataField="DoB" HeaderText="DoB" SortExpression="DoB" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" 
                    SortExpression="Gender" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" 
                    SortExpression="PhoneNumber" />
                <asp:BoundField DataField="Address" HeaderText="Address" 
                    SortExpression="Address" />
                <asp:HyperLinkField DataNavigateUrlFields="CustomerID" 
                    DataNavigateUrlFormatString="CusOrders.aspx?id={0}" Text="View Orders" />
            </Columns>
            <EmptyDataTemplate>
                Not Found !
            </EmptyDataTemplate>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:myCon %>" 
            ProviderName="System.Data.SqlClient" 
            SelectCommand="SELECT * FROM [Customer]" 
            DeleteCommand="DELETE FROM [Customer] WHERE [CustomerID] = @CustomerID" 
            InsertCommand="INSERT INTO [Customer] ([UserName], [Password], [CustomerName], [DoB], [Gender], [Email], [PhoneNumber], [Address]) VALUES (@UserName, @Password, @CustomerName, @DoB, @Gender, @Email, @PhoneNumber, @Address)" 
            
            UpdateCommand="UPDATE [Customer] SET [UserName] = @UserName, [Password] = @Password, [CustomerName] = @CustomerName, [DoB] = @DoB, [Gender] = @Gender, [Email] = @Email, [PhoneNumber] = @PhoneNumber, [Address] = @Address WHERE [CustomerID] = @CustomerID">
            <DeleteParameters>
                <asp:Parameter Name="CustomerID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="CustomerName" Type="String" />
                <asp:Parameter Name="DoB" Type="DateTime" />
                <asp:Parameter Name="Gender" Type="Int32" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="PhoneNumber" Type="Decimal" />
                <asp:Parameter Name="Address" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="search" PropertyName="Text" 
                    Type="String" />
                
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="CustomerName" Type="String" />
                <asp:Parameter Name="DoB" Type="DateTime" />
                <asp:Parameter Name="Gender" Type="Int32" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="PhoneNumber" Type="Decimal" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="CustomerID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Search" />

        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="TextBox1" ErrorMessage="Not null"></asp:RequiredFieldValidator>

    </div>
 </div>	
        </div>
</asp:Content>
