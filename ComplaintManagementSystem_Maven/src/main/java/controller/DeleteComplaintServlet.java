package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import dao.ComplaintDAO;
import model.User;

@WebServlet("/DeleteComplaintServlet")
public class DeleteComplaintServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute("user");
        if (user != null) {
            int complaintId = Integer.parseInt(req.getParameter("id"));
            ComplaintDAO.deleteComplaint(complaintId);
            res.sendRedirect("pages/complaints.jsp");
        } else {
            res.sendRedirect("pages/login.jsp");
        }
    }

}