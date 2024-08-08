<%@page import="java.util.List"%>
<%@ page import="Model.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Management</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2>User Management</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>Address</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<User> userList = (List<User>) request.getAttribute("userList");
                if (userList != null) {
                    for (User user : userList) {
            %>
            <tr>
                <td><%= user.getId() %></td>
                <td><%= user.getname() %></td>
                <td><%= user.getEmail() %></td>
                <td><%= user.getMobile() %></td>
                <td><%= user.getAddress() %></td>
                <td>
                    <a href="UserManagementServlet?action=edit&id=<%= user.getId() %>" class="btn btn-primary">Edit</a>
                    <a href="UserManagementServlet?action=delete&id=<%= user.getId() %>" class="btn btn-danger">Delete</a>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
</div>
</body>
</html>
