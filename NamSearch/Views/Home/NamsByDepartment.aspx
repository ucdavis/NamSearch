<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<System.Collections.Generic.List<NamSearch.Core.Domain.DataNam>>" MasterPageFile="~/Views/Shared/Site.Master" %>
<asp:Content runat="server" ID="Title" ContentPlaceHolderID="TitleContent">
Nams For: <%: Request.Params["name"] %>
</asp:Content>
<asp:Content runat="server" ID="Main" ContentPlaceHolderID="MainContent">

	<% Html.RenderPartial("ListNams"); %>

</asp:Content>
