<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="login-box.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="padding: 100px 0 0 250px;">
    <div id="login-box">
    <H2>Login</H2>
    <br />
    <br />
    <br />
    <div id="login-box-name" style="margin-top:20px;">User Name:</div><div id="login-box-field" style="margin-top:20px;"><asp:TextBox ID="txtUserName" runat="server" name="q" class="form-login" title="Username" value="" size="30" maxlength="2048"></asp:TextBox></div>
    <div id="login-box-name">Password:</div><div id="login-box-field"><asp:TextBox ID="txtPwd1" runat="server" name="q" class="form-login" title="Username" value="" size="30" maxlength="2048" TextMode="Password"></asp:TextBox></div>
    <br />
<span class="login-box-options"><asp:Label ID="lblMsg1" runat="server" Font-Bold="True" 
                                    ForeColor="Red"></asp:Label></span><br />
            <span class="login-box-options">
        <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txtUserName"
                                    ErrorMessage="UserName can't be left blank" 
            SetFocusOnError="True" Visible="True" ForeColor="Red"></asp:RequiredFieldValidator></span><br /><span class="login-box-options">
        <asp:RequiredFieldValidator ID="rfvPwd" 
            runat="server" ControlToValidate="txtPwd1"
                                    ErrorMessage="Password can't be left blank"                                    
                                    
            SetFocusOnError="True" Visible="True" ForeColor="Red"></asp:RequiredFieldValidator>
                                    
        </span>
<br />
<br />
        <asp:ImageButton ID="ImageButton1" runat="server" 
            ImageUrl="~/admin/img/login-btn.png" width="103" height="42" 
            style="margin-left:90px;" onclick="ImageButton1_Click" />
            <br />
                                    <br />
                                    
    </div>
    </div>
    </form>
</body>
</html>
