<%@ Page Title="Profile" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="CustomerPanel.aspx.cs" Inherits="CustomerPanel" %>

<asp:Content  ID="BodyContent"  runat="server"  ContentPlaceHolderID="MainContent">
    <style type="text/css">

        .style1
        {
            height: 27px;
        }
        </style>

    <div>
    
        <asp:Panel ID="Panel6" runat="server" HorizontalAlign="Center">
            <asp:Button ID="btnProfile" runat="server" Text="Your Profile" 
                onclick="btnProfile_Click" />
            &nbsp;
            <asp:Button ID="btnOrder" runat="server" onclick="btnOrder_Click" 
                Text="Your Order" />
        </asp:Panel>
    
        <asp:MultiView ID="mtvProfile" runat="server">
            <asp:View ID="vOrderDetails" runat="server">
                <asp:Panel ID="Panel5" runat="server" HorizontalAlign="Center">
                    <asp:GridView ID="GridView2" runat="server">
                    </asp:GridView>
                    <br />
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Back" />
                </asp:Panel>
            </asp:View>
            <asp:View ID="vOrder" runat="server">
                <asp:Panel ID="Panel4" runat="server" HorizontalAlign="Center">
                    <asp:GridView ID="GridView1" runat="server" onrowcommand="GridView1_RowCommand" 
                        onrowdatabound="GridView1_RowDataBound">
                        <Columns>
                            <asp:ButtonField CommandName="btnViewDetail" Text="View detail" />
                        </Columns>
                    </asp:GridView>
                    <br />
                </asp:Panel>
            </asp:View>
            <asp:View ID="vProfile" runat="server">
                <asp:Panel ID="Panel3" runat="server">
                    <table style="width: 100%; margin-top: 15px;">
                        <tr>
                            <td align="center" class="style1" colspan="2">
                                <asp:Label ID="Label3" runat="server" Text="Change your password"></asp:Label>
                                <br />
                                <asp:Label ID="lblMess1" runat="server" ForeColor="Red" 
                                    Text="Password is changed!" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style1" width="50%">
                                <asp:Label ID="lblFullName1" runat="server" Text="Old Password:"></asp:Label>
                            </td>
                            <td align="left" class="style1" width="50%">
                                <asp:TextBox ID="txtOldPass" runat="server" Width="200px" 
                                    ValidationGroup="pass"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="txtOldPass" ErrorMessage="Must not Empty!" ForeColor="Red" 
                                    ValidationGroup="pass"></asp:RequiredFieldValidator>
                                &nbsp;<asp:Label ID="lblPassword" runat="server" ForeColor="Red" 
                                    Text="Old Password not correct!" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="50%">
                                <asp:Label ID="lblAddress1" runat="server" Text="New Password:"></asp:Label>
                            </td>
                            <td align="left" width="50%">
                                <asp:TextBox ID="txtNewPass" runat="server" Width="200px" 
                                    ValidationGroup="pass"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="txtNewPass" ErrorMessage="Must not Empty!" ForeColor="Red" 
                                    ValidationGroup="pass"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="50%">
                                <asp:Label ID="lblEmail1" runat="server" Text="Re-type new Password:"></asp:Label>
                            </td>
                            <td align="left" width="50%">
                                <asp:TextBox ID="txtRePass" runat="server" Width="200px" ValidationGroup="pass"></asp:TextBox>
                                <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                    ControlToCompare="txtNewPass" ControlToValidate="txtRePass" 
                                    ErrorMessage="Not correct with your new Password!" ForeColor="Red" 
                                    Display="Dynamic" ValidationGroup="pass"></asp:CompareValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="txtRePass" Display="Dynamic" ErrorMessage="Must not Empty!" 
                                    ForeColor="Red" ValidationGroup="pass"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="50%">
                                <asp:Button ID="btnChange1" runat="server" onclick="btnChange1_Click" 
                                    Text="Change" ValidationGroup="pass" />
                            </td>
                            <td align="left" width="50%">
                                <asp:Button ID="btnClear1" runat="server" Text="Clear" 
                                    onclick="btnClear1_Click" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <asp:Panel ID="Panel2" runat="server">
                    <table style="width: 100%; margin-top: 15px;">
                        <tr>
                            <td align="center" class="style1" colspan="2">
                                <asp:Label ID="Label2" runat="server" Text="Profile"></asp:Label>
                                <br />
                                <asp:Label ID="lblMess2" runat="server" ForeColor="Red" 
                                    Text="Profile is changed!" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style1" width="50%">
                                <asp:Label ID="Label4" runat="server" Text="Username:"></asp:Label>
                            </td>
                            <td align="left" class="style1" width="50%">
                                <asp:TextBox ID="txtUserName" runat="server" Width="200px" Enabled="False" 
                                    ValidationGroup="ValidateProfile"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style1" width="50%">
                                <asp:Label ID="lblFullName0" runat="server" Text="Full Name:"></asp:Label>
                            </td>
                            <td align="left" class="style1" width="50%">
                                <asp:TextBox ID="txtFullName" runat="server" Width="200px" 
                                    ValidationGroup="ValidateProfile"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                    ControlToValidate="txtFullName" ErrorMessage="Must not Empty!" ForeColor="Red" 
                                    ValidationGroup="ValidateProfile"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="50%">
                                <asp:Label ID="lblAddress0" runat="server" Text="Address:"></asp:Label>
                            </td>
                            <td align="left" width="50%">
                                <asp:TextBox ID="txtAddress" runat="server" Width="200px" 
                                    ValidationGroup="ValidateProfile"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                    ControlToValidate="txtAddress" ErrorMessage="Must not Empty!" ForeColor="Red" 
                                    ValidationGroup="ValidateProfile"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="50%">
                                <asp:Label ID="lblEmail0" runat="server" Text="Email:"></asp:Label>
                            </td>
                            <td align="left" width="50%">
                                <asp:TextBox ID="txtEmail" runat="server" Width="200px" 
                                    ValidationGroup="ValidateProfile"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                    ControlToValidate="txtEmail" ErrorMessage="Email not correct!" ForeColor="Red" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                    ValidationGroup="ValidateProfile"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                    ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Must not Empty!" 
                                    ForeColor="Red" ValidationGroup="ValidateProfile"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="50%">
                                <asp:Label ID="lblPhoneNumber0" runat="server" Text="Gender:"></asp:Label>
                            </td>
                            <td align="left" width="50%">
                                <asp:Label ID="lblGender" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="50%">
                                <asp:Label ID="Label5" runat="server" Text="Date of Birth:"></asp:Label>
                            </td>
                            <td align="left" width="50%">
                                <asp:TextBox ID="txtDoB" runat="server" Width="200px" 
                                    ValidationGroup="ValidateProfile"></asp:TextBox>
                                &nbsp;<asp:Label ID="Label6" runat="server" Text="(dd/mm/yyyy)"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                    ControlToValidate="txtDoB" ErrorMessage="Must not Empty!" ForeColor="Red" 
                                    ValidationGroup="ValidateProfile"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                         <tr>
                            <td align="right" width="50%">
                                <asp:Label ID="Label1" runat="server" Text="Phone Number:"></asp:Label>
                            </td>
                            <td align="left" width="50%">
                                <asp:TextBox ID="txtPhoneNumber" runat="server" Width="200px" 
                                    ValidationGroup="ValidateProfile"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                    ControlToValidate="txtPhoneNumber" ErrorMessage="Must not Empty!" 
                                    ForeColor="Red" ValidationGroup="ValidateProfile"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" width="100%">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="50%">
                                <asp:Button ID="btnChange2" runat="server" 
                                    Text="Change" onclick="btnChange2_Click" 
                                    ValidationGroup="ValidateProfile" />
                            </td>
                            <td align="left" width="50%">
                                <asp:Button ID="btnClear2" runat="server" Text="Clear" 
                                    onclick="btnClear2_Click" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>

            </asp:View>
        </asp:MultiView>
    
    </div>
</asp:Content>
