<%@ page import="java.util.*, model.User, model.Complaint, dao.ComplaintDAO" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<Complaint> complaints = ComplaintDAO.getComplaintsByUserId(user.getId());
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Complaints</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
<h2 class="mb-4">My Complaints</h2>
<table class="table table-striped table-hover">
    <thead class="table-dark">
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Description</th>
        <th>Status</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <% for (Complaint c : complaints) { %>
    <tr>
        <td><%= c.getId() %></td>
        <td><%= c.getTitle() %></td>
        <td><%= c.getDescription() %></td>
        <td><span class="badge
                        <%= "Pending".equals(c.getStatus()) ? "bg-warning" :
                            "Resolved".equals(c.getStatus()) ? "bg-success" : "bg-info" %>">
                        <%= c.getStatus() %>
                    </span></td>
        <td>
            <% if ("Pending".equals(c.getStatus())) { %>
            <a href="edit_complaint.jsp?id=<%= c.getId() %>" class="btn btn-sm btn-primary">Edit</a>
            <form method="post" action="../DeleteComplaintServlet" class="d-inline">
                <input type="hidden" name="id" value="<%= c.getId() %>">
                <button type="submit" class="btn btn-sm btn-danger">Delete</button>
            </form>
            <% } %>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>
<a href="dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>