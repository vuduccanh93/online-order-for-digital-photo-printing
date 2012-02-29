<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
                                <asp:TextBox ID="txtPwd1" runat="server" MaxLength="15" TextMode="Password"></asp:TextBox></td>
                            <td align="left">
                                <asp:RequiredFieldValidator ID="rfvPwd" runat="server" ControlToValidate="txtPwd1"
                                    ErrorMessage="Password can't be left blank" SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
             </tr>
               <tr>
                    <td colspan="2">
                                <asp:Label ID="lblMsg1" runat="server" Font-Bold="True" 
                                    ForeColor="Red"></asp:Label></td>
                    <td>
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                                    ShowSummary="False" /></td>
               </tr>
               <tr>
                            <td align="right" colspan="2">
                                <asp:Button ID="btnLogin" runat="server" Text="Login" 
                                    onclick="btnLogin_Click" /></td>
               </tr>
         </table>
    </div>
    </form>
</body>
</html>
