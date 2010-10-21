<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="NamSearch.Controllers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Welcome To Nam Search
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
</asp:Content>
