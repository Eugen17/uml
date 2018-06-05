<%@ page contentType="text/html;charset=UTF-8"
         language="java"
         import="DAO.Product" %>
<%@ page import="java.util.ArrayList" %>
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
            <div class="Navigator" style="background-color: black;">
                
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
            
            <!-- Блок сортировки -->
            <form method="get" action="/shop">
            <div class="sort">
                <input class="button" type="submit" value="Accpet" style=" margin-top: 1em; margin-left: 3em; background-color: #42e042;">
                <ul class="nonst" style="margin-top:1em; margin-left: 50em; display: inline;">
                    Sorting:
                    <li class="menu"><input type="radio" name="Sort" value="Price">Expensive</li>
                    <li class="menu"><input type="radio" name="Sort" value="2015">Cheap</li>
                    <li class="menu"><input type="radio" name="Sort" value="Purchases">Popular</li>
                </ul>
            </div>
            
            <!-- Блок фильтров -->
            <div class="filt">
                Filters:
                <hr/>
                <!--
                Price
                    <input id="say" type="range" min="5" max="1000" step="1" value="0" name="Price">
                <p id="listen" style="text-align: center;"></p>
                <script type="text/javascript"> 
                    function say_hi() {
                        var price = document.getElementById('say').value + "$";
 
                       document.getElementById('listen').innerHTML = price;
                    }
                    document.getElementById('say').addEventListener('click', say_hi);
                </script>
                <hr/>
                -->
                Year
                <ul class="nonst">
                    <li><input type="radio" name="Year" value="2015">3 years</li>
                    <li><input type="radio" name="Year" value="2013">5 years</li>
                    <li><input type="radio" name="Year" value="2011">7 years</li>
                    <li><input type="radio" name="Year" value="2006">12 years</li>
                    <li><input type="radio" name="Year" value="1998">20 years</li>
                </ul>
                <hr/>
                Stars
                <ul class="nonst">
                    <li><input type="radio" name="Stars" value="1">1</li>
                    <li><input type="radio" name="Stars" value="2">2</li>
                    <li><input type="radio" name="Stars" value="3">3</li>
                    <li><input type="radio" name="Stars" value="4">4</li>
                    <li><input type="radio" name="Stars" value="5">5</li>
        </ul>
                <hr/>
                Country
                <ul class="nonst">
                    <li><input type="radio" name="Country" value="США">США</li>
                    <li><input type="radio" name="Country" value="Шотландия">Шотландия</li>
                    <li><input type="radio" name="Country" value="Ирландия">Ирландия</li>
                    <li><input type="radio" name="Country" value="Британия">Британия</li>
        </ul>
                <hr/>
                Scope
                <ul class="nonst">
                    <li><input type="radio" name="Scope" value="0.3">0.3 L</li>
                    <li><input type="radio" name="Scope" value="0.5">0.5 L</li>
                    <li><input type="radio" name="Scope" value="0.7">0.7 L</li>
                    <li><input type="radio" name="Scope" value="1">1 L</li>
        </ul>
                <hr/>
                VoL
                <ul class="nonst">
                    <li><input type="radio" name="VoL" value="35">35%</li>
                    <li><input type="radio" name="VoL" value="40">40%</li>
                    <li><input type="radio" name="VoL" value="45">45%</li>
                    <li><input type="radio" name="VoL" value="50">50%</li>
                    <li><input type="radio" name="VoL" value="55">55%</li>
        </ul>
            </div>
            </form>
            
            <div class="Container" style="color: white; display:flex; flex-direction: row; margin-right: 0; width: 80%">
                <div style="width: 100%;height: 85.5%;color: white; font-size: 2em; display:flex; flex-direction: row; flex-flow:row wrap; margin-top: -26em; overflow-y: scroll;">
                <%
                    ArrayList<Product> L = (ArrayList<Product>) request.getAttribute("List");
                    for(int i = 0; i < L.size(); i++)
                    {
                        out.print("<div class=\"prod\">" +
                                "" +
                                "<a href=\"/shop/product?ID="+ L.get(i).getID() +"\"><img class=\"product\" src=\"ProductIMG/"+ L.get(i).getID() +".jpg\"><br/>"+ L.get(i).getName() +"</a><br/><input type=\"button\" class=\"button\" value=\"Add to cart\" style=\" background-color: #42e042;\">" +
                                "" +
                                "</div>");
                    }

                %>
                </div>
            </div>
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