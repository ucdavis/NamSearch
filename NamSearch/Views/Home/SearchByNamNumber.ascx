<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<div id="searchNAM">
    <% Html.RenderPartial("ToolbarWithBack"); %>
    <h2 class="info">Search by NAM Number</h2>
    <form id="searchByNam" class="form current" method="get" action="<%: Url.Action("NamsByNumber", "Home") %>">
        <ul class="edit rounded">
            <li>
                <input type="text" id="number" placeholder="NAM Number" name="number" />
            </li>
        </ul>
        <a class="submit whiteButton" href="#">Search!</a>
    </form>
</div>