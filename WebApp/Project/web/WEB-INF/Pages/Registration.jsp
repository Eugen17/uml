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
                    <a href="/entrance"><li class="button" style="padding: 0.2em; display: inline-block; border-radius: 30px 30px 30px 30px; color:#555555; background-color: #b1b1b1; font-size: 1.1em; margin-right: 2em; float: right">Log in</li></a>
                </ul>
            </div>
            
            <div class="Container">
                <form method="post" action="/registration">
                    <input type="text" placeholder="Login" class="textbox" name="Login" style="text-align: center; display: block; font-size: 2em; margin-left: auto; margin-right: auto; margin-top: 5em;"><br/>
                    <input type="password" placeholder="Password" class="textbox" name="Password" style="text-align: center; display: block; font-size: 2em; margin-left: auto; margin-right: auto;"><br/>
                    <input type="password" placeholder="Repeat password" class="textbox" style="text-align: center; display: block; font-size: 2em; margin-left: auto; margin-right: auto;"><br/>

                    <input type="email" placeholder="E-mail" class="textbox" name="Email" style="text-align: center; display: block; font-size: 2em; margin-left: auto; margin-right: auto;"><br/>

                    <input type="text" placeholder="Name" class="textbox" name="Name" style="text-align: center; display: block; font-size: 2em; margin-left: auto; margin-right: auto;"><br/>
                    <input type="text" placeholder="Surname" class="textbox" name="Surname" style="text-align: center; display: block; font-size: 2em; margin-left: auto; margin-right: auto;"><br/>

                    <input type="submit" value="Confirm" class="button" style="display: block; font-size: 2em; margin-left: auto; margin-right: auto; width: 12.3em;">
                </form>
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