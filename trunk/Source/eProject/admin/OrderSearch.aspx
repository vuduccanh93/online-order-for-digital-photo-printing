<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin/Admin.master" CodeFile="OrderSearch.aspx.cs" Inherits="admin_OrderSearch" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div id="header">
        	<h2>Admin Area</h2>
    <div id="topmenu">
            	<ul>
                	
                    <li><a href="OrderManagement.aspx">Orders</a></li>                	
                    <li class="current"><a href="OrderSearch.aspx">Search Orders</a></li>                    
                    <li><a href="CustomerList.aspx">Customers</a></li>
                    <li><a href="CustomerSearch.aspx">Search Customers</a></li>
                    <li><a href="PriceMan.aspx">Price Manager</a></li>
                    
              </ul>
          </div>
      </div>
      
        
        <div id="wrapper">
            <div id="content">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" DataKeyNames="OrderID" 
            Visible="False">
            <Columns>
                <asp:HyperLinkField Text="View" DataNavigateUrlFields="OrderID" 
                    DataNavigateUrlFormatString="OrderDetail.aspx?id={0}" />
            </Columns>
            <EmptyDataTemplate>
                Not Found !
            </EmptyDataTemplate>
        </asp:GridView>
    
        <br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            Text="Search by ID" ValidationGroup="1" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="TextBox1" ErrorMessage="ID not null" ValidationGroup="1"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
            Text="Search by Shipping Add" ValidationGroup="2" />
    
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="TextBox2" ErrorMessage="Address not null" 
            ValidationGroup="2"></asp:RequiredFieldValidator>
    
    </div>
           		</div>	
        </div>
</asp:Content>