package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import dao.ComplaintDAO;
import model.User;

@WebServlet("/AdminComplaintServlet")
public class AdminComplaintServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute("user");

        if (user != null && "Admin".equalsIgnoreCase(user.getRole())) {
            String action = req.getParameter("action");
            int complaintId = Integer.parseInt(req.getParameter("id"));

            if ("update".equals(action)) {
                String status = req.getParameter("status");
                // Remove the remarks parameter
                ComplaintDAO.updateComplaintStatus(complaintId, status);
            } else if ("delete".equals(action)) {
                ComplaintDAO.deleteComplaint(complaintId);
            }

            res.sendRedirect("pages/admin_complaints.jsp");
        } else {
            res.sendRedirect("pages/login.jsp");
        }
    }


}