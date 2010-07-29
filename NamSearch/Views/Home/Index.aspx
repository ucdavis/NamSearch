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
            <li class="arrow"><a href="#searchNAM">Search By NAM Number (TODO)</a></li>
            <li class="arrow"><a href="#searchDepartment">Search By Department (TODO)</a></li>
            <li class="arrow"><a href="#searchVLAN">Search By VLAN (TODO)</a></li>
            <li class="arrow"><%: Html.ActionLink<HomeController>(x=>x.Info(), "About") %></li>
        </ul>    
    </div>

</asp:Content>
