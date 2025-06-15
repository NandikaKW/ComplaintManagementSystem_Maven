<%@ page import="java.util.*, model.User, model.Complaint, dao.ComplaintDAO" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<Complaint> complaints = ComplaintDAO.getComplaintsByUserId(user.getId());
%>
<html>
<head><title>My Complaints</title></head>
<body>
<h2>My Complaints</h2>
<table border="1">
    <tr><th>ID</th><th>Title</th><th>Description</th><th>Status</th></tr>
    <% for (Complaint c : complaints) { %>
        <tr>
            <td><%= c.getId() %></td>
            <td><%= c.getTitle() %></td>
            <td><%= c.getDescription() %></td>
            <td><%= c.getStatus() %></td>
        </tr>
    <% } %>
</table>
<p><a href="dashboard.jsp">Back to Dashboard</a></p>
</body>
</html>