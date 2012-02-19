<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CartControl.ascx.cs" Inherits="CartControl" %>
<asp:GridView runat="server" ID="gvShoppingCart" AutoGenerateColumns="False" 
    GridLines="None" Width="100%" CellPadding="5" ShowFooter="True" 
    DataKeyNames="ImageUrl" OnRowDataBound="gvShoppingCart_RowDataBound" 
    OnRowCommand="gvShoppingCart_RowCommand">  
                <HeaderStyle HorizontalAlign="Left" BackColor="#3D7169" ForeColor="#FFFFFF" />  
                <FooterStyle HorizontalAlign="Right" BackColor="#6C6B66" ForeColor="#FFFFFF" />  
                <AlternatingRowStyle BackColor="#F8F8F8" /> 
<Columns>
<asp:TemplateField>
    <ItemTemplate>
     <a id="image" href='<%# Eval("ImageUrl")%>'>
                    <img alt="image" src='<%# Eval("ImageUrl")%>?width=200' />
                </a>        
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="ImageUrl" 
                HeaderText="ImageUrl" ReadOnly="True" />
<asp:BoundField DataField="Res" DataFormatString="{0:c}" 
                HeaderText="Res" ReadOnly="True" />
    <asp:TemplateField HeaderText="Quantity"><ItemTemplate>  
                            <asp:TextBox runat="server" ID="txtQuantity" Columns="5" Text='<%# Eval("Quantity") %>'></asp:TextBox>
                             
                            <asp:LinkButton runat="server" ID="btnRemove" Text="Remove" CommandName="Remove" CommandArgument='<%# Eval("ImageUrl")+","+Eval("Res") %>' style="font-size:12px;"></asp:LinkButton>  
  
                        </ItemTemplate></asp:TemplateField>
<asp:BoundField DataField="Price" 
                HeaderText="UnitPrice" />
    <asp:BoundField DataField="TotalPrice" HeaderText="TotalPrice" 
        ReadOnly="True" />
</Columns>
<EmptyDataTemplate>
Your Shopping Cart is empty, add items
<a href="Album.aspx">Add Products</a>
</EmptyDataTemplate>
</asp:GridView>
<br />
            <asp:Button runat="server" ID="btnUpdateCart" Text="Update Cart" 
    onclick="btnUpdateCart_Click"/>  
