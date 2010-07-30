<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<System.Collections.Generic.List<NamSearch.Core.Domain.DataNam>>" %>

<div id="nams-by-vlan">
    <% Html.RenderPartial("ToolbarWithBack"); %>

    <h2 class="info">Showing All Nams in <%: Model.First().Vlan %></h2>
    <% Html.RenderPartial("ListNams"); %>
</div>