<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<NamSearch.Core.Domain.DataNam>>" %>

<ul class="metal">
    <% foreach (var nam in Model) { %>
        <li class="arrow"><a href="<%: Url.Action("DisplayNam", new { id = nam.Id } ) %>"><small><%: nam.Status %></small> <%: nam.NamNumber %><em><%: string.Format("Room {0} in {1}", nam.Room, nam.Building) %></em><em><%: nam.Department %></em></a></li>
    <% } %>
</ul>