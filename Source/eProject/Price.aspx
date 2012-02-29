<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Price.aspx.cs" Inherits="Price" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="RES" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="RES" HeaderText="Resolution" ReadOnly="True" 
                    SortExpression="RES" />
                <asp:BoundField DataField="Money" HeaderText="Unit Price" 
                    SortExpression="Money" DataFormatString="{0} $" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:myCon %>" 
            ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Price]">
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>

