package Servlets;

import DAO.*;
import org.sqlite.JDBC;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class RecordServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        HttpSession session = req.getSession(true);

            DAOFactory d=new DAOFactory();
            SessionDAO s=d.getSessionDAO();

            System.out.println(session.getAttribute("UserName"));
            //if admin
            UserDAO u=d.getUserDAO();

            req.setAttribute("Users", u.findAll());
            req.setAttribute("ListAll", s.findAll());
            req.setAttribute("ListName", s.findAllByUserName((String) session.getAttribute("UserName")));

        req.getRequestDispatcher("/WEB-INF/Pages/Record.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        HttpSession session = req.getSession(true);
        ArrayList<Long> L = new ArrayList<>();
        DAOFactory d=new DAOFactory();
        SessionDAO s=d.getSessionDAO();
        UserDAO u=d.getUserDAO();
        switch(req.getParameter("SetDel"))
        {
//            case "1":
//                if(session.getAttribute("UserCartList") != null)
//                {
//                    L = (ArrayList<Long>) session.getAttribute("UserCartList");
//                }
//                L.add(Long.valueOf(req.getParameter("ProductID")));
//
//                System.out.println(req.getParameter("ProductID"));
//
//                session.setAttribute("UserCartList", L);
//                break;

            case "2":
                L = (ArrayList<Long>) session.getAttribute("Users");
                System.out.println(req.getParameter("ID"));
                //L.remove(Long.valueOf(req.getParameter("ID")));
                boolean a=u.deleteUser(req.getParameter("ID"));

                break;
        }
        System.out.println();
       resp.sendRedirect("/record");
    }
}
