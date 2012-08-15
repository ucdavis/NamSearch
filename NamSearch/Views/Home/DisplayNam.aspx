<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<NamSearch.Core.Domain.DataNam>"
    MasterPageFile="~/Views/Shared/Site.Master" %>

<%@ Import Namespace="NamSearch.Core.Domain" %>
<asp:Content runat="server" ID="Title" ContentPlaceHolderID="TitleContent">
    Nam:
    <%: Model.NamNumber %>
</asp:Content>
<asp:Content runat="server" ID="Main" ContentPlaceHolderID="MainContent">
    <ul data-role="listview" data-theme="c">
        <li>
            <h3 class="info">
                <strong>NAM Number: </strong><span>
                    <%: Model.NamNumber %></span></h3>
            <h3 class="info">
                <strong>Building: </strong><span>
                    <%: Model.Building %></span></h3>
            <h3 class="info">
                <strong>Room: </strong><span>
                    <%: Model.Room %></span></h3> 
            <% if (Model.Department != null) {%>
            <h3 class="info">
                <strong>Department: </strong><span>
                    <%: Model.Department %></span>
            </h3>
            <% } %>
           
            <h3 class="info">
                <% if (Model.BillingId != null)
               {%>
                <strong>Billing Id: </strong><span>
                    <%: Model.BillingId %></span> 
                <% } %>
                <% if (Model.Vlan != null && Model.Vlan.Contacts.Any())
                   { %>
                <p class="ui-li-aside">
                    <span><a href="<%: Url.Action("DisplayContact", new {id = Model.Vlan.Name}) %>"><i>(View
                        contacts)</i></a></span>
                </p>
                <% } %>
            </h3>
            
            <% if (Model.Vlan != null)
            { %>
            <h3 class="info">
                <strong>Vlan: </strong><span>
                    
                    <%: Model.Vlan.Name %>
                </span>
               
            </h3>
             <% }%>
            <% if (Model.PortNumber != null)
            { %>
            <h3 class="info">
                <strong>Port Number: </strong><span>
                    <%: Model.PortNumber %></span></h3>    
            <% }%>

            <h3 class="info">
                <strong>Status: </strong><span>
                    <%: Model.Status %></span></h3>
        </li>
    </ul>
</asp:Content>