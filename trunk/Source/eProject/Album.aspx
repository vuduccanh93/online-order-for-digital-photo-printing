<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="Album.aspx.cs" Inherits="Album" %>

<asp:Content  ID="BodyContent"  runat="server"  ContentPlaceHolderID="MainContent">
    <script type="text/javascript" src="Scripts/jquery-1.4.1.min.js"></script>    	
    <script type="text/javascript" src="Scripts/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
    
    
 	
    <script type="text/javascript">
        $(document).ready(function () {
            
            $("a#image").fancybox();

        });
	</script>

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
            
            <EmptyDataTemplate>
                Your Album is Empty. Click
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Upload.aspx">here</asp:HyperLink>
                &nbsp;to upload new images
            </EmptyDataTemplate>
            
        </asp:GridView>
    
    </div>
 </asp:Content>
