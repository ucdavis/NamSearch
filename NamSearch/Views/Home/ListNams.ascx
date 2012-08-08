<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<NamSearch.Core.Domain.DataNam>>" %>
<%if (Model.Any())
  {%>
<ul data-role="listview">
    <% foreach (var nam in Model)
       { %>
    <li>
        <h3>
            <a href="<%: Url.Action("DisplayNam", new {id = nam.Id}) %>">
                <%: nam.NamNumber%></a></h3>
        <p>
            <strong>
                <%: nam.Department%></strong></p>
        <p>
            <%: string.Format("Room {0} in {1}", nam.Room, nam.Building)%></p>
        <p class="ui-li-aside">
            <strong>
                <%: nam.Status%></strong></p>
    </li>
    <% } %>
    <% }
  else
  {%>
    <h3 align="center">
        <span>No Matches Found </span>
    </h3>
    <p align="center">
        <span><i>Please modify your search criteria and try again.</i></span></p>
    <% } %>
</ul>