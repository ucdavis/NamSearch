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
                <strong>Room: </strong><span>
                    <%: Model.Room %></span></h3>
            <h3 class="info">
                <strong>Building: </strong><span>
                    <%: Model.Building %></span></h3>
            <h3 class="info">
                <strong>Department: </strong><span>
                    <%: Model.Department %></span>
                <%if (Model.Vlan != null)
                  { %>
                <% if (Model.Vlan.Contacts.Any())
                   {%>
                <p class="ui-li-aside">
                    <span><a href="<%: Url.Action("DisplayContact", new {id = Model.Vlan.Name}) %>"><i>(View
                        contacts)</i></a></span>
                </p>
                <% } %>
                <% } %>
            </h3>
            <h3 class="info">
                <strong>Vlan: </strong><span>
                    <%if (Model.Vlan != null)
                      { %>
                    <%: Model.Vlan.Name %>
                </span>
                <%-- <p class="ui-li-aside">
                    <% if (Model.Vlan.Contacts.Any())
                       {%>
                    <a href="<%: Url.Action("DisplayContact", new {id = Model.Vlan.Name}) %>"><i>(View contacts)</i></a>
                    <% } %>

                    </span>
                </p>--%>
                <% }%>
            </h3>
            <h3 class="info">
                <strong>Status: </strong><span>
                    <%: Model.Status %></span></h3>
        </li>
    </ul>
</asp:Content>