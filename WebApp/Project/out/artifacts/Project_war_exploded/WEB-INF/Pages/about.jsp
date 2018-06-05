<%@ page contentType="text/html;charset=UTF-8"
         language="java"
         import="DAO.Product" %>
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
        <header>
            <!-- Блок навигатора -->
            <div class="Navigator" style="display: inline-block">
                
                <ul class="nonst">
                    <li class="menu"><input type="search" placeholder="Search" class="textbox" style="margin-left: 1em; font-size: 1.1em;"></li>
                    <a href="/"><li class="menu">Main</li></a>
                    <a href="/shop"><li class="menu">Catalog</li></a>
                    <a href="/shop/basket"> <li class="menu">Cart</li></a>
                    <a href="/about"><li class="menu">About us</li></a>
                    <%
                        if(session.getAttribute("UserName") != null)
                        {
                            out.print("<li class=\"button\" style=\"padding: 0.2em; display: inline-block; border-radius: 30px 30px 30px 30px; color:#555555; background-color: #b1b1b1; font-size: 1.1em; margin-right: 2em; float: right\"><a href=\"/office\">" + session.getAttribute("UserName") + "</a></li>");
                        }
                        else
                        {
                            out.print("<li class=\"button\" style=\"padding: 0.2em; display: inline-block; border-radius: 30px 30px 30px 30px; color:#555555; background-color: #b1b1b1; font-size: 1.1em; margin-right: 2em; float: right\"><a href=\"/entrance\">Log in</a> | <a href=\"/registration\">Sign up</a></li>");
                        }
                    %>
                </ul>
            </div>
            
            <div class="Container" style="background-color: rgba(0, 0, 0, 0.62);">
                <p class="pictx" style="margin-top: 6em;">As purveyors of alcohol, we are acutely aware of the harm that alcohol can cause if not sold and consumed in a responsible way. Our staff receive training on the liquor licencing regulations relevant to each store’s jurisdiction and each store has a qualified licence holder.  We comply with all liquor licencing laws and we take care not to sell directly or indirectly to persons under the legal age.</p>
                <h1 style="text-align: center; color: white;">Contacts</h1>
                <p class="pictx">The Whisky Shop of Kyiv<br/>
                Kyiv UA<br/>
                info@whiskyshopua.com
                </p>
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