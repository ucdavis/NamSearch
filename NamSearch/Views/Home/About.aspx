<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    About Us
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
<div data-role="page">

	<div data-role="header">
		<h1>About Us</h1>

	</div><!-- /header -->

	<div data-role="content">
		
        <h2 class="info">This application was developed by the awesome Scott Kirkland.</h2>					

	</div><!-- /content -->
	
</div><!-- /page -->

</asp:Content>
