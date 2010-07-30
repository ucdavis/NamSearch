<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<System.Collections.Generic.List<NamSearch.Core.Domain.DataNam>>" %>
<div id="nams-by-number">
    <% Html.RenderPartial("ToolbarWithBack"); %>
    <h2 class="info">
        Showing All Nams Which Match Your Search</h2>
    
    <% Html.RenderPartial("ListNams"); %>
</div>
