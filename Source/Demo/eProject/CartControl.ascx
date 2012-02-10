<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CartControl.ascx.cs" Inherits="CartControl" %>
<asp:GridView ID="grdCart" runat="server" 
              AutoGenerateColumns="False" 
              DataKeyNames="ImageUrl" 
              >
<Columns>
<asp:TemplateField>
    <ItemTemplate>
    <asp:Image ID="Image1" runat="server" 
    ImageUrl='<%#Eval("ImageUrl")%>'/>
    </ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="ImageUrl" 
                HeaderText="ImageUrl" ReadOnly="True"/>
<asp:BoundField DataField="Quantity" HeaderText="Quantity"/>
<asp:BoundField DataField="Res" DataFormatString="{0:c}" 
                HeaderText="Res" ReadOnly="True" />
<asp:BoundField DataField="Price" DataFormatString="{0:c}" 
                HeaderText="Price" ReadOnly="True" />
<asp:CommandField ShowDeleteButton="True" 
                  ShowEditButton="True"/>
</Columns>
<EmptyDataTemplate>
Your Shopping Cart is empty, add items
<a href="Album.aspx">Add Products</a>
</EmptyDataTemplate>
</asp:GridView>
<asp:Label ID="TotalLabel" runat="server"></asp:Label>