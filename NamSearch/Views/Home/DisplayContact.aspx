<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<NamSearch.Core.Domain.Vlan>"
    MasterPageFile="~/Views/Shared/Site.Master" %>

<%@ Import Namespace="NamSearch.Helpers" %>
<asp:Content runat="server" ID="Title" ContentPlaceHolderID="TitleContent">
    <%: Model.Name %> Contacts:
</asp:Content>
<asp:Content runat="server" ID="Main" ContentPlaceHolderID="MainContent">
    <%if (Model != null)
      {
    %>
    <%if (Model.Contacts.Any())
      {%>
    <ul data-role="listview">
        <% foreach (var contact in Model.Contacts)
           { %>
        <li>
            <h4 class="info">
                <strong>Contact: </strong><span>
                    <%:(String.IsNullOrEmpty(contact.Name) ? String.Empty : contact.Name)%></span></h4>
            <h4 class="info">
                <strong>Phone: </strong><span>
                    <%:(String.IsNullOrEmpty(contact.Phone) ? String.Empty : String.Format(new PhoneFormatter(), "{0:(###) ###-####}", contact.Phone))%></span><% if (!String.IsNullOrEmpty(contact.Email))
                                                                                                                                                                  {%>
                <p class="ui-li-aside">
                    <span><i>(Write e-mail)</i></span>
                </p>
                <% } %></h4>
            <h4 class="info">
                <strong>Email: </strong>
                <% if (!String.IsNullOrEmpty(contact.Email))
                   {%>
                <span><a href="mailto: <%:contact.Email %>">
                    <%: contact.Email%></a></span>
                <% } %>
            </h4>
        </li>
        <% } %>
    </ul>
    <% } %>
    <% } %>
</asp:Content>