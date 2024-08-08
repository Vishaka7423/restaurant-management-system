<%@ page import="Model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit User</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container mt-4">
		<h2>Edit User</h2>
		<%
        User user = (User) request.getAttribute("user");
        if (user == null) {
    %>
		<div class="alert alert-danger" role="alert">Error: User object
			is not found in the request scope.</div>
		<%
        } else {
    %>
		<form action="UserManagementServlet" method="post">
			<input type="hidden" name="action" value="update"> <input
				type="hidden" name="id" value="<%= user.getId() %>">

			<div class="form-group">
				<label for="name">Name:</label> <input type="text" id="name"
					name="name" class="form-control" value="<%= user.getname() %>"
					required>
			</div>
			<div class="form-group">
				<label for="email">Email:</label> <input type="email" id="email"
					name="email" class="form-control" value="<%= user.getEmail() %>"
					required>
			</div>
			<div class="form-group">
				<label for="password">Password:</label> <input type="password"
					id="password" name="password" class="form-control"
					value="<%= user.getPassword() %>" required>
			</div>
			<div class="form-group">
				<label for="mobile">Mobile:</label> <input type="text" id="mobile"
					name="mobile" class="form-control" value="<%= user.getMobile() %>"
					required>
			</div>
			<div class="form-group">
				<label for="address">Address:</label> <input type="text"
					id="address" name="address" class="form-control"
					value="<%= user.getAddress() %>" required>
			</div>
			<button type="submit" class="btn btn-primary">Update User</button>
		</form>
		<%
        }
    %>
	</div>
</body>
</html>
