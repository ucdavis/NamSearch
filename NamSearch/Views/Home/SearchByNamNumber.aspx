<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage" MasterPageFile="~/Views/Shared/Site.Master" %>
<asp:Content runat="server" ID="Title" ContentPlaceHolderID="TitleContent"></asp:Content>
<asp:Content runat="server" ID="Main" ContentPlaceHolderID="MainContent">
<div data-role="page">

	<div data-role="header">

		<h1>Search By NAM Number</h1>
	</div><!-- /header -->

	<div data-role="content">
		
		<form id="searchByNam" method="get" action="<%: Url.Action("NamsByNumber", "Home") %>">
				
			<div data-role="fieldcontain">
				<label for="search">Search by NAM Number:</label>
				<input type="search" name="number" id="number" placeholder="NAM Number"  />
			</div>

		<input type="submit" value="Search!" />
	</form>
	
	</div><!-- /content -->
</div><!-- /page -->

</asp:Content>
