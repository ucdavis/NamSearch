<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<NamSearch.Core.Domain.DataNam>" MasterPageFile="~/Views/Shared/Site.Master" %>
<asp:Content runat="server" ID="Title" ContentPlaceHolderID="TitleContent">
	Display Nam
</asp:Content>
<asp:Content runat="server" ID="Main" ContentPlaceHolderID="MainContent">
<div data-role="page">

	<div data-role="header">
		<h1>Nam: <%: Model.NamNumber %></h1>

	</div><!-- /header -->

	<div data-role="content">
		
        <h3 class="info"><strong>NAM Number: </strong><span><%: Model.NamNumber %></span></h3>
        <h3 class="info"><strong>Room: </strong><span><%: Model.Room %></span></h3>
        <h3 class="info"><strong>Building: </strong><span><%: Model.Building %></span></h3>
        <h3 class="info"><strong>Department: </strong><span><%: Model.Department %></span></h3>
        <h3 class="info"><strong>Vlan: </strong><span><%: Model.Vlan %></span></h3>
        <h3 class="info"><strong>Status: </strong><span><%: Model.Status %></span></h3>
		
	</div><!-- /content -->
	
</div><!-- /page -->
</asp:Content>
