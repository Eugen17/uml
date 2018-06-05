package Servlets;

import DAO.DAOFactory;

import DAO.User;
import DAO.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import static javax.print.attribute.standard.MediaSizeName.D;

public class EntranceServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        HttpSession session = req.getSession(true);
        if(session.getAttribute("UserName") == null)
        {
            req.getRequestDispatcher("/WEB-INF/Pages/Entrance.jsp").forward(req, resp);
        }
        else
        {
            if(req.getParameter("Out") != null)
            {
                session.setAttribute("UserName", null);
                //session.setAttribute("UserID", null);
            }
            resp.sendRedirect("/record");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        HttpSession session = req.getSession(true);
        String Login = req.getParameter("Login");
        String Password = req.getParameter("Password");
        DAOFactory d=new DAOFactory();
        UserDAO us=d.getUserDAO();
        User u=new User(Login,Password);
        boolean er=us.findUser(u);
        if( !er)
        {
            req.setAttribute("Error", "Error");
            req.getRequestDispatcher("/WEB-INF/Pages/Entrance.jsp").forward(req, resp);
        }
        else
        {
            session.setAttribute("UserName", u.getName());
            //session.setAttribute("UserID", U.getID());
            resp.sendRedirect("/record");
        }
    }
}