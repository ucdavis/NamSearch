<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<System.Collections.Generic.List<NamSearch.Core.Domain.DataNam>>" MasterPageFile="~/Views/Shared/Site.Master" %>
<asp:Content runat="server" ID="Title" ContentPlaceHolderID="TitleContent">
	Nams By Building
</asp:Content>
<asp:Content runat="server" ID="Main" ContentPlaceHolderID="MainContent">
<div data-role="page">

	<div data-role="header">
		<h1>Nams For <%: Request.Params["name"] %></h1>

	</div><!-- /header -->

	<div data-role="content">
		
		<% Html.RenderPartial("ListNams"); %>
		
	</div><!-- /content -->
	
</div><!-- /page -->

</asp:Content>
