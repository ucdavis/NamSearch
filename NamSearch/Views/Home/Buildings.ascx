<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<System.Collections.Generic.List<System.String>>" %>

<div id="buildings">
    <% Html.RenderPartial("ToolbarWithBack"); %>
    
    <ul class="edgetoedge">
        <% var oldLetter = string.Empty; %>
        
        <% foreach (string building in Model) { %>
                   
           <% var currentLetter = string.IsNullOrEmpty(building) ? string.Empty : building.Substring(0,1); 
                
              if (currentLetter != oldLetter)
              {
                  //write out the new letter as a header
                  %>
                   <li class="sep"><%: currentLetter %></li>
                  <%
                  //replace the old letter
                  oldLetter = currentLetter;
              }
            %>

           <li class="arrow">
            <a href="<%: Url.Action("NamsByBuilding", "Home", new { name = building }) %>"><%: building ?? "[Empty]" %></a>
           </li>

        <% } %>
    </ul>
    
    <h2 class="info">This application was developed by the awesome Scott Kirkland</h2>

</div>