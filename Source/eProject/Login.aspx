<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" MasterPageFile="~/Site.master" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <title></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div>
        <table>
            <tr>
                            <td align="left">
                                UserName:</td>
                            <td align="left">
                                <asp:TextBox ID="txtUserName" runat="server" MaxLength="12" 
                                    ValidationGroup="ValidateLogin"></asp:TextBox></td>
                            <td align="left">
                                <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txtUserName"
                                    ErrorMessage="UserName can't be left blank" SetFocusOnError="True" 
                                    ValidationGroup="ValidateLogin">*</asp:RequiredFieldValidator></td>
             </tr>
             <tr>
                            <td align="left">
                                Password:</td>
                            <td align="left">
                                <asp:TextBox ID="txtPwd1" runat="server" MaxLength="15" TextMode="Password" 
                                    ValidationGroup="ValidateLogin"></asp:TextBox></td>
                            <td align="left">
                                <asp:RequiredFieldValidator ID="rfvPwd" runat="server" ControlToValidate="txtPwd1"
                                    ErrorMessage="Password can't be left blank" SetFocusOnError="True" 
                                    ValidationGroup="ValidateLogin">*</asp:RequiredFieldValidator></td>
             </tr>
               <tr>
                    <td colspan="2">
                                <asp:Label ID="lblMsg1" runat="server" Font-Bold="True" 
                                    ForeColor="Red"></asp:Label></td>
                    <td>
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                                    ShowSummary="False" ValidationGroup="ValidateLogin" /></td>
               </tr>
               <tr>
                            <td align="right" colspan="2">
                                <asp:Button ID="btnLogin" runat="server" Text="Login" 
                                    onclick="btnLogin_Click" ValidationGroup="ValidateLogin" /></td>
               </tr>
         </table>
    </div>
</asp:Content>
