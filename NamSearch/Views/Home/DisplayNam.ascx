<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<NamSearch.Core.Domain.DataNam>" %>

<div id="nam-info">
    <% Html.RenderPartial("ToolbarWithBack"); %>
    
    <h3 class="info"><strong>NAM Number: </strong><span><%: Model.NamNumber %></span></h3>
    <h3 class="info"><strong>Room: </strong><span><%: Model.Room %></span></h3>
    <h3 class="info"><strong>Building: </strong><span><%: Model.Building %></span></h3>
    <h3 class="info"><strong>Department: </strong><span><%: Model.Department %></span></h3>
    <h3 class="info"><strong>Vlan: </strong><span><%: Model.Vlan %></span></h3>
    <h3 class="info"><strong>Status: </strong><span><%: Model.Status %></span></h3>
</div>