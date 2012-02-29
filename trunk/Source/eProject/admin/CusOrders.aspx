<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin/Admin.master" CodeFile="CusOrders.aspx.cs" Inherits="CusOrders" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div id="header">
        	<h2>Admin Area</h2>
    <div id="topmenu">
            	<ul>
                	
                    <li class="current"><a href="OrderManagement.aspx">Orders</a></li>                	
                    <li><a href="OrderSearch.aspx">Search Orders</a></li>                    
                    <li><a href="CustomerList.aspx">Customers</a></li>
                    <li><a href="CustomerSearch.aspx">Search Customers</a></li>
                    <li><a href="PriceMan.aspx">Price Manager</a></li>
                    
              </ul>
          </div>
      </div>
      
        
        <div id="wrapper">
            <div id="content">
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
    
    </div>
</div>	
        </div>
</asp:Content>
