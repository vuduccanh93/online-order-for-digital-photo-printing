<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="UserCart.aspx.cs" Inherits="UserCart" %>

<%@ Register src="CartControl.ascx" tagname="CartControl" tagprefix="uc1" %>

<asp:Content  ID="BodyContent"  runat="server"  ContentPlaceHolderID="MainContent">
    
    <script type="text/javascript" src="Scripts/jquery-1.4.1.min.js"></script>    	
    <script type="text/javascript" src="Scripts/fancybox/jquery.fancybox-1.3.4.pack.js"></script>
     
 	
    <script type="text/javascript">
        $(document).ready(function () {

            $("a#image").fancybox();

        });
	</script>

    <div>
    
        <uc1:CartControl ID="CartControl1" runat="server" />
    
    </div>
</asp:Content>
