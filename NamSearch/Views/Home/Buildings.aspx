<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<System.Collections.Generic.List<System.String>>" MasterPageFile="~/Views/Shared/Site.Master" %>
<asp:Content runat="server" ID="Title" ContentPlaceHolderID="TitleContent">Buildings</asp:Content>
<asp:Content runat="server" ID="Main" ContentPlaceHolderID="MainContent">
<div data-role="page">

	<div data-role="header">
		<h1>Buildings</h1>

	</div><!-- /header -->

	<div data-role="content">
 		
		<ul data-role="listview" data-filter="true" data-theme="c">
            <% var oldLetter = string.Empty; %>
        
            <% foreach (string building in Model) { %>
                   
               <% var currentLetter = string.IsNullOrEmpty(building) ? string.Empty : building.Substring(0,1); 
                
                  if (currentLetter != oldLetter)
                  {
                      //write out the new letter as a header
                      %>
                       <li data-role="list-divider"><%: currentLetter %></li>
                      <%
                      //replace the old letter
                      oldLetter = currentLetter;
                  }
                %>

               <li>
                <a href="<%: Url.Action("NamsByBuilding", "Home", new { name = building }) %>"><%: building ?? "[Empty]" %></a>
               </li>

            <% } %>
		</ul>

	</div><!-- /content -->
	
</div><!-- /page -->
</asp:Content>