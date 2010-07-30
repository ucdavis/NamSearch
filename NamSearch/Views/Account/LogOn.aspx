<%--<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>--%>
<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<%--<asp:Content Id="Content1" ContentPlaceHolderId="TitleContent" runat="server">
	Access Denied
</asp:Content>

<asp:Content Id="Content2" ContentPlaceHolderId="MainContent" runat="server">

    <h2>Access Denied</h2>

    <p>
        You do not have access to view this page: <%= Html.Encode(TempData["URL"]) %>
    </p>
    
</asp:Content>--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>Log On</title></head>

<body>

    <h2>Enter your password</h2>

    <% using(Html.BeginForm()) { %>

        <%= this.TextBox("pass").Label("Password: ") %>
        <input type="submit" value="Login!" />

    <% } %>

    <h3 style="color:red;"><%: TempData["message"] %></h3>
    
</body>
</html>