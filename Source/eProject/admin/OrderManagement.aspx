<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderManagement.aspx.cs" Inherits="admin_OrderManagement" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
function ChangeCalendarView(sender,args)
{
   sender._switchMode("years", true);           
}
</script>
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
            <br />
        <asp:TextBox ID="txtDate1" runat="server"></asp:TextBox>  &nbsp;&nbsp;&nbsp;&nbsp;  <asp:TextBox ID="txtDate2" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp; <asp:Button
            ID="Button5" runat="server" Text="Filter By Date" 
            onclick="Button5_Click" />
        
        <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </ajaxToolkit:ToolkitScriptManager>
         <ajaxToolkit:CalendarExtender ID="CalendarExtender1" TargetControlID="txtDate1" OnClientShown="ChangeCalendarView" runat="server">
        </ajaxToolkit:CalendarExtender>
        <ajaxToolkit:CalendarExtender ID="CalendarExtender2" TargetControlID="txtDate2" OnClientShown="ChangeCalendarView" runat="server">
        </ajaxToolkit:CalendarExtender>
    </div>
    </form>
</body>
</html>
