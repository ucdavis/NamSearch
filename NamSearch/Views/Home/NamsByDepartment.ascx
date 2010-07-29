<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<System.Collections.Generic.List<NamSearch.Core.Domain.DataNam>>" %>

<div id="nams-by-department">
    <% Html.RenderPartial("ToolbarWithBack"); %>

    <h2 class="info">Showing All Nams in <%: Model.First().Department %></h2>
    <ul class="metal">
        <% foreach (var nam in Model) { %>
            <li class="arrow"><a href="#"><small><%: nam.Status %></small> <%: nam.NamNumber %><em><%: string.Format("Room {0} in {1}", nam.Room, nam.Building) %></em><em><%: nam.Department %></em></a></li>
        <% } %>
    </ul>
</div>