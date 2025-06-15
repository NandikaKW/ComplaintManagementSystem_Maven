<%@ page import="model.User, model.Complaint, dao.ComplaintDAO" %>
<%
  User user = (User) session.getAttribute("user");
  if (user == null) {
    response.sendRedirect("login.jsp");
    return;
  }

  int complaintId = Integer.parseInt(request.getParameter("id"));
  Complaint complaint = ComplaintDAO.getComplaintById(complaintId);

  if (complaint == null || complaint.getUserId() != user.getId() || !"Pending".equals(complaint.getStatus())) {
    response.sendRedirect("complaints.jsp");
    return;
  }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Edit Complaint</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-8">
      <div class="card shadow-sm">
        <div class="card-header bg-primary text-white">
          <h4 class="mb-0">Edit Complaint #<%= complaint.getId() %></h4>
        </div>
        <div class="card-body">
          <form method="post" action="../UpdateComplaintServlet">
            <input type="hidden" name="id" value="<%= complaint.getId() %>">
            <div class="mb-3">
              <label for="title" class="form-label">Title</label>
              <input type="text" class="form-control" id="title" name="title"
                     value="<%= complaint.getTitle() %>" required>
            </div>
            <div class="mb-3">
              <label for="description" class="form-label">Description</label>
              <textarea class="form-control" id="description" name="description"
                        rows="4" required><%= complaint.getDescription() %></textarea>
            </div>
            <div class="d-grid gap-2">
              <button type="submit" class="btn btn-primary">Update Complaint</button>
              <a href="complaints.jsp" class="btn btn-secondary">Cancel</a>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>