<%@ page import="model.User" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head><title>Dashboard</title></head>
<body>
<h2>Welcome, <%= user.getUsername() %>! (Role: <%= user.getRole() %>)</h2>
<ul>
    <li><a href="submit_complaint.jsp">Submit Complaint</a></li>
    <li><a href="complaints.jsp">View My Complaints</a></li>
    <li><a href="../LogoutServlet">Logout</a></li>
</ul>
</body>
</html>