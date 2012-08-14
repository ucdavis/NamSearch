<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
	About Us
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
	<h2 style="text-align: center;" class="info">This application was developed by the awesome Scott Kirkland, with modifications by Ken Taylor for the addition of the "Find a NAM" search feature and VLAN contacts information page.</h2>
</asp:Content>
