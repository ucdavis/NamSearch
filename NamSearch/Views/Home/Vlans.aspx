<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<System.Collections.Generic.List<System.String>>"
    MasterPageFile="~/Views/Shared/Site.Master" %>

<asp:Content runat="server" ID="Title" ContentPlaceHolderID="TitleContent">
    VLANs
</asp:Content>
<asp:Content runat="server" ID="Main" ContentPlaceHolderID="MainContent">
    <ul data-role="listview" data-filter="true" data-theme="c">
        <% var oldLetter = string.Empty; %>
        <% foreach (var vlans in Model)
           { %>
        <% var currentLetter = string.IsNullOrEmpty(vlans) ? string.Empty : vlans.Substring(0, 1);

           if (currentLetter != oldLetter)
           {
                    //write out the new letter as a header
        %>
        <li data-role="list-divider">
            <%: currentLetter %></li>
        <%
               //replace the old letter
               oldLetter = currentLetter;
           }
        %>
        <li><a href="<%: Url.Action("NamsByVlan", "Home", new { name = vlans }) %>">
            <%: vlans ?? "[Empty]" %></a> </li>
        <% } %>
    </ul>
</asp:Content>