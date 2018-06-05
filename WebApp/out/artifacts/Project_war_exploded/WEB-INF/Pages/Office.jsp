<%@ page contentType="text/html;charset=UTF-8"
language="java"
import="DAO.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.User" %>
<style>
    <%@ include file="CSS/index.css" %>
</style>
<!DOCTYPE html>
<html lang="ru">
    <head>
        <meta charset="utf-8">
<title>Cabinet</title>
<link rel="stylesheet" href="CSS/index.css">

    </head>
    <body>
<header>
    <div class="Navigator">

        <ul class="nonst">
            <li class="menu"><input type="search" placeholder="Search" class="textbox" style="margin-left: 1em; font-size: 1.1em;"></li>
            <a href="/"><li class="menu">Main</li></a>
            <a href="/shop"><li class="menu">Catalog</li></a>
            <a href="/shop/basket"> <li class="menu">Cart</li></a>
            <a href="/about"><li class="menu">About us</li></a>
            <form method="get" action="/entrance">
            <li><input type="submit" value="Log out" name="Out" style="padding: 0.2em; display: inline-block; border-radius: 30px 30px 30px 30px; color:#555555; background-color: #b1b1b1; font-size: 1.1em; margin-right: 10px; float: right"></li>
            </form>
        </ul>
    </div>
    <div class="Container" style="float: bottom;">

		<div class="user_info">
            <%
                User U = (User) request.getAttribute("User");

                out.print("<img src=\"IMG/user_image.png\" style=\"size: 5em 5em;\">\n" +
                        "<p>Login: "+ U.getLogin() +"</p>\n" +
                        "<p>Name: "+ U.getName() +"</p>\n" +
                        "<p>Surname: "+ U.getSurname() +"</p>\n" +
                        "<p>Email: "+ U.getEmail() +"</p>\n" +
                        "<p>Country: "+ U.getCountry() +"</p>\n" +
                        "<p>City: "+ U.getCity() +"</p>\n" +
                        "<p>Street: "+ U.getStreet() +"</p>\n" +
                        "<p>House: "+ U.getHouse() +"</p>");
            %>
		</div>

    </div>
</header>
<footer style="float: bottom;">
    <div class="Container">
        <p class="pictx" style="font-size: 120%; color:rgb(145, 100, 100); padding-top: 1%; margin-top: 0">Created by students of KPI with the support of<br/> power engineers and lack of sleep.</p>
        <p class="pictx" style="font-size: 100%; color:rgb(145, 100, 100);">Copyright ©2018</p>
    </div>
</footer>
    </body>
</html>