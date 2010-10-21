<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="NamSearch.Controllers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Home Page
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div data-role="page">
		<div data-role="header">
			<h1>Welcome To Nam Search</h1>
		</div>
        <div data-role="content">
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
        </div> 
		<div data-role="footer">
            <h4>Footer</h4>
        </div> 
	</div>
</asp:Content>
