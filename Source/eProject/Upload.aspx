<%@ Page Title="Upload Image" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master"  CodeFile="Upload.aspx.cs" Inherits="_Default" %>

<asp:Content  ID="BodyContent"  runat="server"  ContentPlaceHolderID="MainContent">
    <script src="Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="Scripts/jquery.MultiFile.js" type="text/javascript"></script>

    <div>
        <asp:FileUpload ID="FileUpload1" runat="server"  class="multi" accept="png|jpg|jpeg|gif"/>
        <asp:Button ID="Button1" runat="server" Text="Upload" onclick="Button1_Click" />
    
        <br />
        <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Left" Visible="False">
        </asp:Panel>
    
    </div>
</asp:Content>
