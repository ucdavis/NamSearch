<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="NamSearch.Controllers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="home">
        <% Html.RenderPartial("ToolbarWithBack"); %>
        <ul class="edgetoedge">
            <li class="arrow">
                <%: Html.ActionLink<HomeController>(x=>x.Buildings(), "Search By Building") %>
            </li>
            <li class="arrow">
                <%: Html.ActionLink<HomeController>(x=>x.Departments(), "Search By Department") %>
            </li>            
            <li class="arrow">
                <%: Html.ActionLink<HomeController>(x=>x.Vlans(), "Search By Vlan") %>
            </li>
            <li class="arrow">
                <%: Html.ActionLink<HomeController>(x=>x.SearchByNamNumber(), "Search By NAM Number") %>
            </li>
            <li class="arrow slideup">
                <%: Html.ActionLink<HomeController>(x=>x.Info(), "About") %>
            </li>
        </ul>    
    </div>

</asp:Content>
