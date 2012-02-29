<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin/Admin.master" CodeFile="OrderManagement.aspx.cs" Inherits="admin_OrderManagement" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>

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
            <br />
        <asp:TextBox ID="txtDate1" runat="server"></asp:TextBox>  &nbsp;&nbsp;&nbsp;&nbsp;  <asp:TextBox ID="txtDate2" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp; 
        <asp:Button
            ID="Button5" runat="server" Text="Filter By Date" 
            onclick="Button5_Click" ValidationGroup="1" />
        
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="txtDate1" ErrorMessage="Must choose Date" 
            ValidationGroup="1"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="txtDate2" ErrorMessage="Must choose Date" 
            ValidationGroup="1"></asp:RequiredFieldValidator>
        
        <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </ajaxToolkit:ToolkitScriptManager>
         <ajaxToolkit:CalendarExtender ID="CalendarExtender1" TargetControlID="txtDate1" OnClientShown="ChangeCalendarView" runat="server">
        </ajaxToolkit:CalendarExtender>
        <ajaxToolkit:CalendarExtender ID="CalendarExtender2" TargetControlID="txtDate2" OnClientShown="ChangeCalendarView" runat="server">
        </ajaxToolkit:CalendarExtender>
    </div>
           		</div>	
        </div>
</asp:Content>
