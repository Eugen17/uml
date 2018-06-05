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
        <title>Login</title>
        <link rel="stylesheet" href="CSS/index.css">
    </head>
    
    <body>
        <header>
            <!-- Блок навигатора -->
            <div class="Navigator" style="display: inline-block">
                
                <ul class="nonst">



                    <a href="/about"><li class="menu">About game</li></a>

                </ul>
            </div>
            
            <div class="Container">
                <form method="post", action="/entrance">
                    <input type="text" placeholder="Login" class="textbox" name="Login" style="text-align: center; display: block; font-size: 2em; margin-left: auto; margin-right: auto; margin-top: 5em;"><br/>
                    <input type="password" placeholder="Password" class="textbox" name="Password" style="text-align: center; display: block; font-size: 2em; margin-left: auto; margin-right: auto;"><br/>
                    <%
                        if(request.getAttribute("Error") != null)
                        {
                            out.print("<p style=\"margin:0 auto;width:15em;font-size:1.5em; text-align: center; background-color: rgba(255,255,255,0.76); color: red\">Incorrect Login or Password</p>");
                        }
                    %>
                    <input type="submit" value="Confirm" class="button" style="display: block; font-size: 2em; margin-left: auto; margin-right: auto; width: 12.3em; margin-top: 1em;">
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