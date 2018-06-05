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
            <div class="Navigator" style="background-color: black; display: inline-block">
                
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
            
            <div class="Container" style="color: black; font-size: 1em; overflow-y: scroll;">
                <table border="1px" cellspacing="0" class="cart">
                    <tr>
                        <th>Product</th>
                        <th>Unit price</th>
                        <th>Country</th>
                        <th>VoL</th>
                    </tr>
                    <tfoot>
                    <%
                        double Sum = 0;
                        if(request.getAttribute("List") != null)
                        {
                            ArrayList<Product> L = (ArrayList<Product>) request.getAttribute("List");
                            for(int i = 0; i < L.size(); i++)
                            {
                                Sum += L.get(i).getPrice()/26;
                            }
                        }
                        out.print("<tr><td colspan=\"3\"><b>Total price</b></td><td class=\"numb\">"+ new DecimalFormat("#0.00").format(Sum) +"$</td></tr>" +
                         "</tfoot>");
                        if(request.getAttribute("List") != null)
                        {
                            ArrayList<Product> L = (ArrayList<Product>) request.getAttribute("List");
                            for(int i = 0; i < L.size(); i++)
                            {
                                out.print("<tr>" +
                                        "<td>" +
                                         "<form method=\"post\" action=\"/shop/basket\">\n" +
                                        "<input type=\"submit\" value=\"✕\" style=\"font-size: 1em; color: red; background-color: transparent; border-style: none;\">" +
                                         "<input type=\"hidden\" value=\"2\" name=\"SetDel\">\n" +
                                         "<input type=\"hidden\" value=\""+ L.get(i).getID() +"\" name=\"ProductID\">\n" +
                                         "</form>" +
                                        ""+ L.get(i).getName() +"" +
                                        "</td>" +
                                        "<td class=\"numb\">" +
                                        ""+ new DecimalFormat("#0.00").format(L.get(i).getPrice()/26) +"$" +
                                        "</td>" +
                                        "<td class=\"numb\">" +
                                        ""+ L.get(i).getCountry() +"" +
                                        "</td>" +
                                        "<td class=\"numb\">" +
                                        ""+ L.get(i).getVoL() +"%" +
                                        "</td>" +
                                        "</tr>");
                            }
                        }
                        else
                        {
                            out.print("В корзине ничего нет");
                        }
                    %>
                </table>
                        <input class="button" type="button" value="Buy" style="background-color: #42e042; font-size: 2em; display: block; margin-left: auto; margin-right: auto; margin-top: 5%;">
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