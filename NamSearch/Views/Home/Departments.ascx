<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<System.Collections.Generic.List<System.String>>" %>

<div id="departments">
    <% Html.RenderPartial("ToolbarWithBack"); %>
    
    <ul class="edgetoedge">
        <% var oldLetter = string.Empty; %>
        
        <% foreach (string department in Model) { %>
                   
           <% var currentLetter = string.IsNullOrEmpty(department) ? string.Empty : department.Substring(0,1); 
                
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
            <a href="<%: Url.Action("NamsByDepartment", "Home", new { name = department }) %>"><%: department ?? "[Empty]" %></a>
           </li>

        <% } %>
    </ul>
    
    <h2 class="info">This application was developed by the awesome Scott Kirkland</h2>

</div>