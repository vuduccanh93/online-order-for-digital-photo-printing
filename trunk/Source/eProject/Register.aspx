<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Default2" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function ChangeCalendarView(sender, args) {
            sender._switchMode("years", true);
        }
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                            <td align="left">
                                UserName:</td>
                            <td align="left">
                                <asp:TextBox ID="txtUserName" runat="server" MaxLength="12"></asp:TextBox></td>
                            <td align="left">
                                <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txtUserName"
                                    ErrorMessage="UserName can't be left blank" SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
             </tr>
             <tr>
                            <td align="left">
                                Password:</td>
                            <td align="left">
                                <asp:TextBox ID="txtPwd" runat="server" MaxLength="15" TextMode="Password"></asp:TextBox></td>
                            <td align="left">
                                <asp:RequiredFieldValidator ID="rfvPwd" runat="server" ControlToValidate="txtPwd"
                                    ErrorMessage="Password can't be left blank" SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
             </tr>
             <tr>
                            <td align="left">
                                Confirm Password:</td>
                            <td align="left">
                                <asp:TextBox ID="txtRePwd" runat="server" MaxLength="15" TextMode="Password"></asp:TextBox></td>
                            <td align="left">
                                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                    ControlToCompare="txtRePwd" ControlToValidate="txtPwd" 
                                    Operator="Equal" ErrorMessage="Password and confirm password do not match" 
                                    SetFocusOnError="True"></asp:CompareValidator>
                            </td>
              </tr>
              <tr>
                            <td align="left">
                                Customer Name:</td>
                            <td align="left">
                                <asp:TextBox ID="txtCustomerName" runat="server" MaxLength="50"></asp:TextBox></td>
                            <td align="left" >
                                <asp:RequiredFieldValidator ID="rfvCustomerName" runat="server" ControlToValidate="txtCustomerName"
                                    ErrorMessage="Customer Name can't be left blank" SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
              </tr>
              <tr>
                            <td align="left">
                                Gender:</td>
                            <td align="left">
                                <asp:RadioButtonList ID="rdoGender" runat="server">
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                                </asp:RadioButtonList></td>
                            <td align="left">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="rdoGender"
                                    ErrorMessage="Gender can't be left blank" SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
               </tr>
                <tr>
                            <td align="left">
                                Address:</td>
                            <td align="left">
                                <asp:TextBox ID="txtAdress" runat="server" TextMode="MultiLine"></asp:TextBox></td>
                            <td align="left">
                                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAdress"
                                    ErrorMessage="Address can't be left blank" SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
              </tr>
              <tr>
                            <td align="left">
                                Email ID:</td>
                            <td align="left">
                                <asp:TextBox ID="txtEmailID" runat="server" MaxLength="70" CssClass="TextinputText"></asp:TextBox></td>
                            <td align="left">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmailID"
                                    ErrorMessage="Email can't be left blank" SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
              </tr>
              <tr>
                            <td align="left">
                                Phone Number:</td>
                            <td align="left">
                                <asp:TextBox ID="txtPhoneNumber" runat="server" MaxLength="15" CssClass="TextinputText"></asp:TextBox></td>
                            <td align="left">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPhoneNumber"
                                    ErrorMessage="Phone Number can't be left blank" SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
              </tr>
              <tr>
                            <td align="left">
                                Date Of Birth:</td>
                            <td align="left">
                                <asp:TextBox ID="txtDate" runat="server" MaxLength="15" CssClass="TextinputText"></asp:TextBox></td>
                                <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </ajaxToolkit:ToolkitScriptManager>
         <ajaxToolkit:CalendarExtender ID="CalendarExtender1" TargetControlID="txtDate" OnClientShown="ChangeCalendarView" runat="server">
        </ajaxToolkit:CalendarExtender>
                            <td align="left">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDate"
                                    ErrorMessage="DoB can't be left blank" SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
              </tr>
              <tr>
                <td colspan="2">
                                <asp:Label ID="lblMsg" runat="server" Font-Bold="True" 
                                    ForeColor="Red"></asp:Label></td>
                <td>
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                                    ShowSummary="False" /></td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2">
                                <asp:Button ID="btnSave" runat="server" Text="Sign Up" 
                                    onclick="btnSave_Click" /></td>
                        </tr>
                 
        </table>
    </div>
    </form>
</body>
</html>
