<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<NamSearch.Models.NamSearchModel>" %>

<%@ Import Namespace="NamSearch.Controllers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Nam Search
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul data-role="listview" data-inset="true" data-theme="c" data-dividertheme="b">
        <li data-role="list-divider">Actions</li>
        <li>
            <%: Html.ActionLink<HomeController>(x=>x.Buildings(), "Search By Building") %>
        </li>
        <li>
            <%: Html.ActionLink<HomeController>(x=>x.Departments(), "Search By Department") %>
        </li>
        <li>
            <%: Html.ActionLink<HomeController>(x=>x.Vlans(), "Search By Vlan") %>
        </li>
        <li>
            <%: Html.ActionLink<HomeController>(x=>x.SearchByNamNumber(), "Search By NAM Number") %>
        </li>
        <li>
            <%: Html.ActionLink<HomeController>(x=>x.About(), "About") %>
        </li>
    </ul>
    <ul data-role="listview" data-inset="true">
        <li data-role="list-divider">Find a NAM</li>
        <li>
            <% using (Html.BeginForm("NamsBySearchParams", "Home", FormMethod.Get)) %>
            <% { %>
            <fieldset>
                <div>
                    <label for="namNumber" style="font-weight: bold;">
                        NAM Number:</label>
                    <input id="namNumber" name="namNumber" type="text" placeholder="Enter NAM number"
                        autofocus="true"></input>
                </div>
                <div>
                    <label for="roomNumber" style="font-weight: bold;">
                        Room:</label>
                    <input id="roomNumber" name="roomNumber" type="text" placeholder="Enter room number"></input>
                </div>
                <div>
                    <label for="vlan" style="font-weight: bold;">
                        VLAN:</label>
                    <%: Html.DropDownListFor(x => x.Vlan, new SelectList(Model.Vlans, "Name", "Name", String.Empty),
                    "-- Select a VLAN --", new { id = "ddlVlans" })%>
                </div>
                <div>
                    <label for="building" style="font-weight: bold;">
                        Building:</label>
                    <%: Html.DropDownListFor(x => x.Building, new SelectList(Model.Buildings, "key", "value",
                    String.Empty), "-- Select a Building --", new { id = "ddlBuildings" }) %>
                </div>
                <div>
                    <label for="department" style="font-weight: bold;">
                        Department:</label>
                    <%: Html.DropDownListFor(x => x.Department, new SelectList(Model.Departments, "key", "value",String.Empty), "-- Select a Department --", new { id = "ddlDepartments"
                    }) %>
                </div>
            </fieldset>
            <div>
                <input type="submit" value="Search*" onclick="javascript: submitForm();" />
                <i>*Note: Only NAMs matching ALL search parameters will be returned!</i><input type="reset"
                    value="Reset Form" onclick="javascript: resetForm(this);" />
            </div>
            <% } %>
        </li>
    </ul>
    <script type="text/javascript">
        function submitForm() {
            // For some wacked reason the built-in form submit was not firing, so I needed to
            // add this javascript/jQuery submit to get it to happen.

            $('form').submit();
        }
        function resetForm(e) {
            // This jQuery handles resetting/clearing out all of the form fields:
            //debugger;
            // reset all text fields in the form:
            $('form input[type="text"]').val("");

            // reset ALL the select lists on the form:
            var select = $('form select');
            select.val($('option:first', select).val());

            // Need this line in order to avoid
            //"uncaught exception: cannot call methods on selectmenu prior to initialization; attempted to call method 'refresh'" exception.
            select.selectmenu();  // Need to initialize selectmenu before calling refresh.  See above.

            // This is the key: We have to do a refresh to get  jQuery mobile's text button text to sync up with the same value
            // as the hidden select lists'.
            select.selectmenu("refresh");
        }
    </script>
</asp:Content>