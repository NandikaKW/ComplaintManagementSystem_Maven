package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import dao.ComplaintDAO;
import model.Complaint;
import model.User;

@WebServlet("/UpdateComplaintServlet")
public class UpdateComplaintServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute("user");
        if (user != null) {
            int complaintId = Integer.parseInt(req.getParameter("id"));
            String title = req.getParameter("title");
            String description = req.getParameter("description");

            Complaint complaint = new Complaint(complaintId, title, description, user.getId(), "Pending");
            ComplaintDAO.updateComplaint(complaint);

            res.sendRedirect("pages/complaints.jsp");
        } else {
            res.sendRedirect("pages/login.jsp");
        }
    }

}