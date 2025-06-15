<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head><title>Submit Complaint</title></head>
<body>
<h2>Submit a New Complaint</h2>
<form method="post" action="../ComplaintServlet">
    <label>Title:</label><input type="text" name="title" required /><br/>
    <label>Description:</label><textarea name="description" required></textarea><br/>
    <input type="submit" value="Submit Complaint" />
</form>
<p><a href="dashboard.jsp">Back to Dashboard</a></p>
</body>
</html>