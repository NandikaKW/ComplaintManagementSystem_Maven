<%@ page import="model.User" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Complaint Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">CMS Dashboard</a>
        <div class="d-flex text-white">
            Logged in as: <b>&nbsp;<%= user.getUsername() %> </b> | Role: <%= user.getRole() %>
            &nbsp;&nbsp;
            <a href="../LogoutServlet" class="btn btn-outline-light btn-sm ms-3">Logout</a>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <div class="row g-4">
        <div class="col-md-6">
            <div class="card shadow-sm border-0">
                <div class="card-body text-center">
                    <h5 class="card-title">Submit a New Complaint</h5>
                    <p class="card-text">Report an issue to your admin or IT department.</p>
                    <a href="submit_complaint.jsp" class="btn btn-primary">Submit Complaint</a>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="card shadow-sm border-0">
                <div class="card-body text-center">
                    <h5 class="card-title">View My Complaints</h5>
                    <p class="card-text">Check the status of complaints you’ve submitted.</p>
                    <a href="complaints.jsp" class="btn btn-success">View Complaints</a>
                </div>
            </div>
        </div>
    </div>

    <% if ("Admin".equalsIgnoreCase(user.getRole())) { %>
    <div class="row mt-5">
        <div class="col-12">
            <div class="card shadow-sm border-0 bg-warning-subtle">
                <div class="card-body text-center">
                    <h5 class="card-title">Admin Controls</h5>
                    <p class="card-text">As an admin, you can view, update, and delete all complaints.</p>
                    <a href="admin_complaints.jsp" class="btn btn-warning">Manage All Complaints</a>
                </div>
            </div>
        </div>
    </div>
    <% } %>
</div>

<footer class="text-center mt-5 text-muted">
    <p>© 2025 Complaint Management System | Developed for IJSE GDSE</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
