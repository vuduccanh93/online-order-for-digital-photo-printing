<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Album.aspx.cs" Inherits="Album" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">    
    <title></title>
    <script type="text/javascript" src="Scripts/jquery-1.4.1.min.js"></script>    	
    <script type="text/javascript" src="Scripts/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
    <link rel="stylesheet" type="text/css" href="Scripts/fancybox/jquery.fancybox-1.3.4.css" media="screen" />
    
 	
    <script type="text/javascript">
        $(document).ready(function () {
            
            $("a#image").fancybox();

        });
	</script>
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
                <asp:TemplateField HeaderText="Image">
                    <ItemTemplate>
                        <a id="image" href='<%# Eval("FileName")%>'>
                    <img alt="image" src='<%# Eval("FileName")%>?width=200' />
                </a>            
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server">
                           
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Preview">
                    <ItemTemplate>
                        <asp:Button ID="Button1" runat="server" CommandName="Preview" CommandArgument='<%# Container.DataItemIndex %>' Text="Preview" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:ButtonField ButtonType="Button" Text="Add To Cart" CommandName="AddCart" />
            </Columns>
            
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
