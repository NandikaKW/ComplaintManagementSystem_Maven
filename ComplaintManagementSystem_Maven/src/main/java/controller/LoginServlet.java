package controller;
import model.User;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;


public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        System.out.println("hello");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User user = UserDAO.validateUser(username, password);
        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            res.sendRedirect("pages/dashboard.jsp");
        } else {
            res.sendRedirect("pages/login.jsp");
        }
    }

}