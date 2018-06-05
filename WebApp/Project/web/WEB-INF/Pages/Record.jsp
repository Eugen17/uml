<%@ page contentType="text/html;charset=UTF-8"
         language="java"
%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="DAO.*" %>
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


                    <%

                        DAOFactory d=new DAOFactory();
                        UserDAO us=d.getUserDAO();


                       if (Integer.parseInt((us.findByName((String)session.getAttribute("UserName"))).getIsAdmin())==1)
                           {
                              out.print(" <table border=\"1px\" cellspacing=\"0\" class=\"cart\">"+
                    "<caption>Records</caption>"+
                    "<tr>"+
                        "<th> </th>"+
                        "<th>Username</th>"+
                        "<th>IsAdmin</th>"+
                    "</tr>"+
                    "<tfoot>");

                               ArrayList<User> L = (ArrayList<User>) request.getAttribute("Users");
                            for(int i = 0; i < L.size(); i++)
                            {
                                out.print("<tr>" +
                                        "<td vertical-align=\"bottom\">" +
                                         "<form method=\"post\" action=\"/record\">\n" +
                                       "<input type=\"submit\" value=\"✕\" style=\"font-size: 1em; color: red; background-color: transparent; border-style: none;\">" +
                                         "<input type=\"hidden\" value=\"2\" name=\"SetDel\">\n" +
                                         "<input type=\"hidden\" value=\""+
                                         L.get(i).getUsername() +"\" name=\"ID\">\n" +"</form>"+"</td>"+
                                        "<td>"+ L.get(i).getName() +
                                        "</td>" +
                                        "<td class=\"numb\">" +
                                        L.get(i).getIsAdmin() +
                                        "</td>" +
                                        "</tr>");
                            }}


                    %>
                </table>
                        <%--<input class="button" type="button" value="Buy" style="background-color: #42e042; font-size: 2em; display: block; margin-left: auto; margin-right: auto; margin-top: 5%;">--%>
            </div>
        </header>
        
       

    </body>
</html>