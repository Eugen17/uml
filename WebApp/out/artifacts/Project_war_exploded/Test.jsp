<%@ page contentType="text/html;charset=UTF-8"
         language="java" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="DAO.Product" %>


<html>
<head>
    <title>Test JSP</title>
</head>
<body>
    <%
        ArrayList<Product> L = (ArrayList<Product>) request.getAttribute("List");
        for(int i = 0; i < L.size(); i++)
        {
            out.println("<li>" +
                    "" +  L.get(i).toString() + "" +
                    "</li>");
        }
    %>
</body>
</html>
