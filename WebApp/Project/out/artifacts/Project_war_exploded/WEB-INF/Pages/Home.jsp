<%@ page contentType="text/html;charset=UTF-8"
         language="java"%>

<%@ page import="java.util.ArrayList"
         import="DAO.Product"%>
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
            
            <div class="Container">
                <p class="pictx" style="margin-top: 12em;">Welcome to the WhiskeyShop site.<br/> We have been selling varieties of whiskey all over the world since 1902.<br/> There you can buy the most rare kind of whiskey would you like.<br/> You can also order in bulk.</p>
            </div>
        </header>
        
        <!-- Популярные напитки-->
        <section class="PopDrinks">
            <div class="Container">
                <input class="button" type="button" value="Most popular drinks" style="font-size: 400%; display: block; margin-left: auto; margin-right: auto; margin-top: 5%;">
                <ul class="nonst" style="text-align: center; margin-top: 5%">

                    <%
                        ArrayList<Product> List = (ArrayList<Product>) request.getAttribute("ArrayOfPopularProduct");
                        for(int i = 0; i < List.size(); i++)
                        {
                            long ID = List.get(i).getID();
                            out.print("<a href=\"/shop/product?id=" + ID + "\"><li class=\"line\"><img src=\"ProductIMG/" + ID + ".jpg\" class=\"pop\"></li></a>");
                        }
                    %>

                    <!--
                    <a href=""><li class="line"><img src="IMG/217525011_0_640x640.jpg" width="200"  class="pop"></li></a>
                    <a href=""><li class="line"><img src="IMG/jim_beam_5010196092142_images_1679161607._S.jpg" width="200"  class="pop"></li></a>
                    <a href=""><li class="line"><img src="IMG/jameson_5011007003005_images_1424940081._S.jpg" width="200"  class="pop"></li></a>
                    -->
        </ul>
            </div>
        </section>
    
        <!-- Информация 1-->
        <section class="FirstInfo">
            <div class="Container"  style="margin-top: 5%;">
                <h1 class="pictx" style="padding-top: 30%">TENNESSEE WHISKEY</h1>
                <p class="pictx">Essentially, it's not all that different from bourbon.<br/> The main difference is that if you call it "bourbon", you will likely be shot by an angry country singer.<br/> Also, it's treated to something called the Lincoln County Process, which involves dripping it through charcoal.</p>
            </div>
        </section>
        
        <!-- Цытаты-->
        <section class="Quotations">
            <div class="Container">
                <ul class="nonst">
                    <li class="quotes"><img src="IMG/Man_1.png" width="200" ><p style="display:inline;"><q>There is no bad whiskey.<br/> There are only some whiskeys that aren’t as good as others.</q></p></li>
                    <li  class="quotes"><p style="display:inline-block;"><q>Ninety percent I’ll spend on good times, women, and Irish Whiskey.<br/> The other ten percent I’ll probably waste.</q></p><img src="IMG/Man_2.png" width="200"  style="display:inline-block;"></li>
                    <li  class="quotes"><img src="IMG/Man_3.png" width="200"><p style="display:inline;"><q>Love makes the world go round? Not at all.<br/> Whiskey makes it go round twice as fast.</q></p></li>
        </ul>
            </div>
        </section>
        
        <!-- Информация 2-->
        <section class="SecondInfo">
            <div class="Container">
                <h1 class="pictx" style="padding-top: 30%">IRISH WHISKEY</h1>
                <p class="pictx">Also known as "water" in Dublin, Scotch's neighboring spirit is extra smooth thanks to its lack of peat and typictxal triple-distilled preparation following 3yrs in a cask.<br/> It's often blended, usually single malt, and one of the most popular whiskies in the world.</p>
            </div>
        </section>
        
        <footer>
            <div class="Container">
                <p class="pictx" style="font-size: 120%; color:rgb(145, 100, 100); padding-top: 1%; margin-top: 0">Created by students of KPI with the support of<br/> power engineers and lack of sleep.</p>
                <p class="pictx" style="font-size: 100%; color:rgb(145, 100, 100);">Copyright ©2018</p>
            </div>
        </footer>
    </body>
</html>