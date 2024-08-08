<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registration Form</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 600px;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }
        .form-group label {
            font-weight: bold;
        }
        .btn-primary {
            width: 100%;
        }
        .form-control {
            border-radius: 0.25rem;
        }
        .text-danger {
            font-size: 0.875rem;
        }
    </style>
    <script>
        function validateForm() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirm").value;

            if (password !== confirmPassword) {
                alert("Passwords do not match.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<div class="container">
    <h2 class="mb-4 text-center">Register</h2>
    <form action="RegSer" method="post" onsubmit="return validateForm();">
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" id="name" name="name" value="<%= request.getParameter("name") != null ? request.getParameter("name") : "" %>" required>
            <small class="text-danger"><%= request.getAttribute("nameError") != null ? request.getAttribute("nameError") : "" %></small>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>" required>
            <small class="text-danger"><%= request.getAttribute("emailError") != null ? request.getAttribute("emailError") : "" %></small>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
            <small class="text-danger"><%= request.getAttribute("passwordError") != null ? request.getAttribute("passwordError") : "" %></small>
        </div>
        <div class="form-group">
            <label for="confirm">Confirm Password</label>
            <input type="password" class="form-control" id="confirm" name="confirm" required>
            <small class="text-danger"><%= request.getAttribute("confirmPasswordError") != null ? request.getAttribute("confirmPasswordError") : "" %></small>
        </div>
        <div class="form-group">
            <label for="address">Address</label>
            <textarea class="form-control" id="address" name="address" rows="3" required><%= request.getParameter("address") != null ? request.getParameter("address") : "" %></textarea>
            <small class="text-danger"><%= request.getAttribute("addressError") != null ? request.getAttribute("addressError") : "" %></small>
        </div>
        <div class="form-group">
            <label for="mobile">Mobile</label>
            <input type="text" class="form-control" id="mobile" name="mobile" value="<%= request.getParameter("mobile") != null ? request.getParameter("mobile") : "" %>" required>
            <small class="text-danger"><%= request.getAttribute("mobileError") != null ? request.getAttribute("mobileError") : "" %></small>
        </div>
        <button type="submit" class="btn btn-primary">Register</button>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
