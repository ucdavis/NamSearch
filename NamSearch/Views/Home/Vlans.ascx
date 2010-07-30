<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<System.Collections.Generic.List<System.String>>" %>

<div id="vlans">
    <% Html.RenderPartial("ToolbarWithBack"); %>
    
    <ul class="edgetoedge">
        <% var oldLetter = string.Empty; %>
        
        <% foreach (string vlan in Model) { %>
                   
           <% var currentLetter = string.IsNullOrEmpty(vlan) ? string.Empty : vlan.Substring(0,1); 
                
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
            <a href="<%: Url.Action("NamsByVlan", "Home", new { name = vlan }) %>"><%: vlan ?? "[Empty]" %></a>
           </li>

        <% } %>
    </ul>
</div>