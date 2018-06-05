<%@ page contentType="text/html;charset=UTF-8"
         language="java"
         import="DAO.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.DecimalFormat" %>
<style>
    <%@ include file="CSS/index.css" %>
</style>
    
<!DOCTYPE html>
<html lang="ru">
    <head>
        <meta charset="utf-8">
        <title>Whiskey Shop</title>
        <link rel="stylesheet" href="CSS/index.css">
    </head>
    
    <body>
        <header style="background: none;">
            <!-- Блок навигатора -->
            <div class="Navigator" style="display: inline-block; background-color: black;">
                
                <ul class="nonst">
                    <li class="menu"><input type="search" placeholder="Search" class="textbox" style="margin-left: 1em; font-size: 1.1em;"></li>
                    <a href="/"><li class="menu">Main</li></a>
                    <a href="/shop"><li class="menu">Catalog</li></a>
                    <a href="/shop/basket"> <li class="menu">Cart</li></a>
                    <a href="/about"><li class="menu">About us</li></a>
                    <li class="button" style="padding: 0.2em; display: inline-block; border-radius: 30px 30px 30px 30px; color:#555555; background-color: #b1b1b1; font-size: 1.1em; margin-left: 35em"><a href="/entrance">Log in</a> | <a href="/registration">Sign up</a></li>
        </ul>
            </div>
            <div class="Container">
                <%
                    Product P = (Product) request.getAttribute("Product");
                    String Stars = "";
                    for(int i = 0; i < P.getStars(); i++)
                    {
                        Stars += "★";
                    }
                    out.print("");
                    out.print("<h1>"+P.getName()+"</h1>\n" +
                            "<img src=\"../ProductIMG/"+P.getID()+".jpg\" class=\"product\" style=\"margin-top: 2em; height: 25em;\">\n" +
                            "<div style=\"display: inline-block; margin-left: 30em; margin-top: -10em;\">\n" +
                            "<b><h2>Price </h2>"+new DecimalFormat("#0.00").format(P.getPrice()/26)+"$</b>\n" +
                            "<h2>Stars</h2>"+Stars+"\n" +
                            "<h2>Aging</h2>"+ (2018 - P.getYear()) +" years\n" +
                            "<h2>Country</h2>"+P.getCountry()+"\n" +
                            "<h2>Volume</h2>"+P.getScope()+" L\n" +
                            "<h2>Strength</h2>"+P.getVoL()+"%\n" +
                            "</div>\n" +
                            "<h2>Description</h2>\n" +
                            "<p>"+P.getDescription()+"</p>");

                    out.print("<form method=\"post\" action=\"/shop/basket\">\n" +
                            "<input class=\"button\" type=\"submit\" value=\"Add to cart\" style=\"background-color: #42e042; font-size: 2em; display: block; margin-left: auto; margin-right: auto; margin-top: 5%;\">\n" +
                            "<input type=\"hidden\" value=\"1\" name=\"SetDel\">\n" +
                            "<input type=\"hidden\" value=\""+ P.getID() +"\" name=\"ProductID\">\n" +
                            "</form>");
                %>
	</div>
        </header>
        
        <footer>
            <div class="Container">
                <p class="pictx" style="font-size: 120%; color:rgb(145, 100, 100); padding-top: 1%; margin-top: 0">Created by students of KPI with the support of<br/> power engineers and lack of sleep.</p>
                <p class="pictx" style="font-size: 100%; color:rgb(145, 100, 100);">Copyright ©2018</p>
            </div>
        </footer>
    </body>
</html>
