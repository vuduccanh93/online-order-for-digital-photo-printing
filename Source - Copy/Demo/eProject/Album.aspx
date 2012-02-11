<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Album.aspx.cs" Inherits="Album" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" 
            AutoGenerateColumns="False" DataKeyNames="FileName" 
            onrowcommand="GridView1_RowCommand">
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:ImageField DataImageUrlField="FileName">
                </asp:ImageField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem>3x4</asp:ListItem>
                            <asp:ListItem>4x6</asp:ListItem>
                            <asp:ListItem>2x3</asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:ButtonField ButtonType="Button" Text="Add To Cart" CommandName="AddCart" />
            </Columns>
            
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
