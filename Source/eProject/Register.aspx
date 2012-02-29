<%@ Page Title="Register" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="Register.aspx.cs" Inherits="Default2" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>
<asp:Content  ID="BodyContent"  runat="server"  ContentPlaceHolderID="MainContent">
    <title></title>
    <script type="text/javascript">
        function ChangeCalendarView(sender, args) {
            sender._switchMode("years", true);
        }
</script>

    <div>
        <table>
            <tr>
                            <td align="left">
                                UserName:</td>
                            <td align="left">
                                <asp:TextBox ID="txtUserName" runat="server" MaxLength="12" 
                                    ValidationGroup="ValidateRegister"></asp:TextBox></td>
                            <td align="left">
                                <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txtUserName"
                                    ErrorMessage="UserName can't be left blank" SetFocusOnError="True" 
                                    ValidationGroup="ValidateRegister">*</asp:RequiredFieldValidator></td>
             </tr>
             <tr>
                            <td align="left">
                                Password:</td>
                            <td align="left">
                                <asp:TextBox ID="txtPwd" runat="server" MaxLength="15" TextMode="Password" 
                                    ValidationGroup="ValidateRegister"></asp:TextBox></td>
                            <td align="left">
                                <asp:RequiredFieldValidator ID="rfvPwd" runat="server" ControlToValidate="txtPwd"
                                    ErrorMessage="Password can't be left blank" SetFocusOnError="True" 
                                    ValidationGroup="ValidateRegister">*</asp:RequiredFieldValidator></td>
             </tr>
             <tr>
                            <td align="left">
                                Confirm Password:</td>
                            <td align="left">
                                <asp:TextBox ID="txtRePwd" runat="server" MaxLength="15" TextMode="Password" 
                                    ValidationGroup="ValidateRegister"></asp:TextBox></td>
                            <td align="left">
                                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                    ControlToCompare="txtRePwd" ControlToValidate="txtPwd" 
                                    Operator="Equal" ErrorMessage="Password and confirm password do not match" 
                                    SetFocusOnError="True" ValidationGroup="ValidateRegister"></asp:CompareValidator>
                            </td>
              </tr>
              <tr>
                            <td align="left">
                                Customer Name:</td>
                            <td align="left">
                                <asp:TextBox ID="txtCustomerName" runat="server" MaxLength="50" 
                                    ValidationGroup="ValidateRegister"></asp:TextBox></td>
                            <td align="left" >
                                <asp:RequiredFieldValidator ID="rfvCustomerName" runat="server" ControlToValidate="txtCustomerName"
                                    ErrorMessage="Customer Name can't be left blank" SetFocusOnError="True" 
                                    ValidationGroup="ValidateRegister">*</asp:RequiredFieldValidator></td>
              </tr>
              <tr>
                            <td align="left">
                                Gender:</td>
                            <td align="left">
                                <asp:RadioButtonList ID="rdoGender" runat="server" 
                                    ValidationGroup="ValidateRegister">
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                                </asp:RadioButtonList></td>
                            <td align="left">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="rdoGender"
                                    ErrorMessage="Gender can't be left blank" SetFocusOnError="True" 
                                    ValidationGroup="ValidateRegister">*</asp:RequiredFieldValidator></td>
               </tr>
                <tr>
                            <td align="left">
                                Address:</td>
                            <td align="left">
                                <asp:TextBox ID="txtAdress" runat="server" TextMode="MultiLine" 
                                    ValidationGroup="ValidateRegister"></asp:TextBox></td>
                            <td align="left">
                                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAdress"
                                    ErrorMessage="Address can't be left blank" SetFocusOnError="True" 
                                    ValidationGroup="ValidateRegister">*</asp:RequiredFieldValidator></td>
              </tr>
              <tr>
                            <td align="left">
                                Email ID:</td>
                            <td align="left">
                                <asp:TextBox ID="txtEmailID" runat="server" MaxLength="70" 
                                    CssClass="TextinputText" ValidationGroup="ValidateRegister"></asp:TextBox></td>
                            <td align="left">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmailID"
                                    ErrorMessage="Email can't be left blank" SetFocusOnError="True" 
                                    ValidationGroup="ValidateRegister">*</asp:RequiredFieldValidator></td>
              </tr>
              <tr>
                            <td align="left">
                                Phone Number:</td>
                            <td align="left">
                                <asp:TextBox ID="txtPhoneNumber" runat="server" MaxLength="15" 
                                    CssClass="TextinputText" ValidationGroup="ValidateRegister"></asp:TextBox></td>
                            <td align="left">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPhoneNumber"
                                    ErrorMessage="Phone Number can't be left blank" SetFocusOnError="True" 
                                    ValidationGroup="ValidateRegister">*</asp:RequiredFieldValidator></td>
              </tr>
              <tr>
                            <td align="left">
                                Date Of Birth:</td>
                            <td align="left">
                                <asp:TextBox ID="txtDate" runat="server" MaxLength="15" 
                                    CssClass="TextinputText" ValidationGroup="ValidateRegister"></asp:TextBox></td>
                                <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </ajaxToolkit:ToolkitScriptManager>
         <ajaxToolkit:CalendarExtender ID="CalendarExtender1" TargetControlID="txtDate" OnClientShown="ChangeCalendarView" runat="server">
        </ajaxToolkit:CalendarExtender>
                            <td align="left">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDate"
                                    ErrorMessage="DoB can't be left blank" SetFocusOnError="True" 
                                    ValidationGroup="ValidateRegister">*</asp:RequiredFieldValidator></td>
              </tr>
              <tr>
                <td colspan="2">
                                <asp:Label ID="lblMsg" runat="server" Font-Bold="True" 
                                    ForeColor="Red"></asp:Label></td>
                <td>
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                                    ShowSummary="False" ValidationGroup="ValidateRegister" /></td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2">
                                <asp:Button ID="btnSave" runat="server" Text="Sign Up" 
                                    onclick="btnSave_Click" ValidationGroup="ValidateRegister" /></td>
                        </tr>
                 
        </table>
    </div>
</asp:Content>
