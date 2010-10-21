<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage" MasterPageFile="~/Views/Shared/Site.Master" %>
<asp:Content runat="server" ID="Title" ContentPlaceHolderID="TitleContent">
Search By NAM Number
</asp:Content>
<asp:Content runat="server" ID="Main" ContentPlaceHolderID="MainContent">
		
	<form id="searchByNam" method="get" action="<%: Url.Action("NamsByNumber", "Home") %>">
				
		<label for="search">Search by NAM Number:</label>
		<input type="search" name="number" id="number" placeholder="NAM Number"  />
	
		<input type="submit" value="Search!" />
	</form>
	
</asp:Content>
