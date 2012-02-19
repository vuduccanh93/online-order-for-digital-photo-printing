<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserCart.aspx.cs" Inherits="UserCart" %>

<%@ Register src="CartControl.ascx" tagname="CartControl" tagprefix="uc1" %>

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
    
        <uc1:CartControl ID="CartControl1" runat="server" />
    
    </div>
    </form>
</body>
</html>
