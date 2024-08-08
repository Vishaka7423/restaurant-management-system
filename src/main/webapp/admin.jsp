<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 700px; /* Increased width */
            padding: 40px; /* Increased padding */
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 30px; /* Moved upwards */
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
</head>
<body>
<div class="container">
    <div class="card w-75 mx-auto my-5"> <!-- Adjusted card width -->
        <div class="card-header text-center">ADMIN LOGIN</div>
        <div class="card-body">
            <form action="AdminServ" method="post">
                <div class="form-group">
                    <label for="name">Username</label>
                    <input type="text" class="form-control" id="name" name="name" value="<%= request.getAttribute("username") != null ? request.getAttribute("username") : "" %>" required>
                    <small class="text-danger"><%= request.getAttribute("usernameError") != null ? request.getAttribute("usernameError") : "" %></small>
                </div>
                <div class="form-group">
                    <label for="email">Email address</label>
                    <input type="email" class="form-control" id="email" name="email" value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>" required>
                    <small class="text-danger"><%= request.getAttribute("emailError") != null ? request.getAttribute("emailError") : "" %></small>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                    <small class="text-danger"><%= request.getAttribute("passwordError") != null ? request.getAttribute("passwordError") : "" %></small>
                </div>
                <div class="text-center">
                    <input type="submit" class="btn btn-primary" value="LOGIN" />
                </div>
                <small class="text-danger d-block text-center mt-2"><%= request.getAttribute("loginError") != null ? request.getAttribute("loginError") : "" %></small>
            </form>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
