<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<div id="about">
    <% Html.RenderPartial("ToolbarWithBack"); %>
    <h2 class="info">This application was developed by the awesome Scott Kirkland.</h2>
</div>