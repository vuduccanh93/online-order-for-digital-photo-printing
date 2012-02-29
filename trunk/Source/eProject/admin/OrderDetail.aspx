<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin/Admin.master" CodeFile="OrderDetail.aspx.cs" Inherits="admin_OrderDetail" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div id="header">
        	<h2>Admin Area</h2>
    <div id="topmenu">
            	<ul>
                	
                    <li><a href="OrderManagement.aspx">Orders</a></li>                	
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
           		</div>	
        </div>
</asp:Content>
