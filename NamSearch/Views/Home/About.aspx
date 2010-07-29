﻿<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    About Us
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="get">
    <div class="toolbar">
        <h1>GET Example</h1>
        <a class="back" href="#">AJAX</a>
    </div>
    <div class="info">
        This page was loaded via AJAX.
    </div>
    <ul class="rounded">
        <li><a href="#livetest">Test live events</a></li>
    </ul>
</div>
<div id="livetest">
    <div class="toolbar">
        <h1>Events test</h1>
        <a class="back" href="#">AJAX</a>
        <a class="button goback" href="#home">Home</a>
    </div>
    <div class="info">
        This is a test of live events.
    </div>
</div>
</asp:Content>
