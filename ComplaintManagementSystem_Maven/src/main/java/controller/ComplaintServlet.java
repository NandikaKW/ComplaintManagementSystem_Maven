package controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Complaint;
import dao.ComplaintDAO;
import model.User;

import java.io.IOException;
@WebServlet("/ComplaintServlet")
public class ComplaintServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute("user");
        if (user != null) {
            String title = req.getParameter("title");
            String description = req.getParameter("description");
            Complaint c = new Complaint(title, description, user.getId());
            ComplaintDAO.saveComplaint(c);
            res.sendRedirect("pages/complaints.jsp");
        } else {
            res.sendRedirect("pages/login.jsp");
        }
    }

}