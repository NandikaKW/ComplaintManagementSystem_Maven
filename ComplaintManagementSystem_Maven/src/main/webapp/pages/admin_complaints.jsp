<%@ page import="java.util.*, model.User, model.Complaint, dao.ComplaintDAO" %>
<%
  User user = (User) session.getAttribute("user");
  if (user == null || !"Admin".equalsIgnoreCase(user.getRole())) {
    response.sendRedirect("login.jsp");
    return;
  }
  List<Complaint> complaints = ComplaintDAO.getAllComplaints();
%>
<html>
<head>
  <title>Admin - All Complaints</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
<h2 class="mb-4">All Complaints</h2>
<table class="table table-striped table-hover">
  <thead class="table-dark">
  <tr>
    <th>ID</th>
    <th>Title</th>
    <th>Description</th>
    <th>User ID</th>
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
    <td><%= c.getUserId() %></td>
    <td><%= c.getStatus() %></td>
    <td>
      <form method="post" action="../AdminComplaintServlet" class="d-inline">
        <input type="hidden" name="id" value="<%= c.getId() %>">
        <input type="hidden" name="action" value="delete">
        <button type="submit" class="btn btn-danger btn-sm">Delete</button>
      </form>
      <button class="btn btn-primary btn-sm" data-bs-toggle="modal"
              data-bs-target="#updateModal<%= c.getId() %>">
        Update
      </button>

      <!-- Update Modal -->
      <div class="modal fade" id="updateModal<%= c.getId() %>" tabindex="-1">
        <div class="modal-dialog">
          <div class="modal-content">
            <form method="post" action="../AdminComplaintServlet">
              <input type="hidden" name="id" value="<%= c.getId() %>">
              <input type="hidden" name="action" value="update">
              <div class="modal-header">
                <h5 class="modal-title">Update Complaint #<%= c.getId() %></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
              </div>
              <div class="modal-body">
                <div class="mb-3">
                  <label class="form-label">Status:</label>
                  <select name="status" class="form-select">
                    <option <%= "Pending".equals(c.getStatus()) ? "selected" : "" %>>Pending</option>
                    <option <%= "In Progress".equals(c.getStatus()) ? "selected" : "" %>>In Progress</option>
                    <option <%= "Resolved".equals(c.getStatus()) ? "selected" : "" %>>Resolved</option>
                  </select>
                </div>
                <div class="mb-3">
                  <label class="form-label">Remarks:</label>
                  <textarea name="remarks" class="form-control"></textarea>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Save changes</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </td>
  </tr>
  <% } %>
  </tbody>
</table>
<a href="dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>