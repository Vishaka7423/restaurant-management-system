<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard - MALHAR</title>
<link
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    rel="stylesheet">
<style>
.navbar {
    background-color: #6f103f;
}

.navbar-brand {
    color: rgb(232, 144, 112);
    border: none;
    font-size: 1.2rem;
    font-family: 'Times New Roman', Times, serif;
}

.navbar-brand:hover {
    background-color: #d5a6bd;
    color: black;
    border-radius: 15px;
    font-weight: bolder;
    font-size: 1.3rem;
}

.navbar-nav .nav-item a {
    color: rgb(232, 144, 112);
    border: none;
    font-size: 1.2rem;
    font-family: 'Times New Roman', Times, serif;
}

.navbar-nav .nav-item a:hover {
    background-color: #d5a6bd;
    color: black;
    border-radius: 15px;
    font-weight: bolder;
    font-size: 1.3rem;
}

.navbar-nav .user-greeting {
    text-align: center;
    color: #ffe69e;
    font-size: 2rem;
    font-family: 'Times New Roman', Times, serif;
}

.sidebar {
    height: 100vh;
    width: 200px;
    position: fixed;
    top: 4rem;
    left: 0;
    background-color: #8c8585;
    padding-top: 20px;
}

.sidebar a {
    padding: 10px 15px;
    text-decoration: none;
    font-size: 1.2rem;
    color: white;
    display: block;
    font-family: 'Times New Roman', Times, serif;
}

.sidebar a:hover {
    background-color: rgb(232, 144, 112);
    color: black;
    border-radius: 15px;
}

.main-content {
    margin-left: 220px;
    padding: 20px;
}

.footer {
    background-color: #333;
    color: white;
    text-align: center;
    padding: 10px;
    position: absolute;
    width: 100%;
    bottom: 0;
}

#product-options {
    display: none;
}

#user-options {
    display: none;
}

#order-options {
    display: none;
}

.card {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    transition: transform 0.3s, box-shadow 0.3s;
}

.card:hover {
    transform: scale(1.05);
    box-shadow: 5px 8px 16px rgba(0, 0, 0.2, 0.8);
}

.card-body {
    background-color: #f8f9fa;
    border-top: 1px solid #dee2e6;
}
.card-text{
font-size: 1.6rem;
font-weight: bold;
}

h3 {
    font-family: serif;
}
</style>
</head>
<body>
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">MALHAR</a>
            <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mx-auto">
                    <%
                    session = request.getSession(false);
                    if (session != null && session.getAttribute("username") != null) {
                        String username = (String) session.getAttribute("username");
                    %>
                    <li class="nav-item user-greeting">WELCOME! <%=username%></li>
                    <%
                    } else {
                    response.sendRedirect("login.jsp");
                    }
                    %>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link active"
                        href="index.jsp">LOGOUT</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="sidebar">
        <a href="adminDashboard.jsp">Dashboard</a> <a href="#"
            onclick="showUserOptions(event)">Users</a> <a href="#"
            onclick="showOrderOptions(event)">Orders</a> <a href="#"
            onclick="showProductOptions(event)">Products</a>
    </div>

    <div class="main-content" style="text-align: center;">
        <h2>Welcome to the Admin Dashboard</h2>
        <p>Select an option from the sidebar to get started.</p>

        <div id="product-options" style="text-align: center;">
            <h3>Manage Products</h3>
            <br>
            <div class="row justify-content-center">
                <div class="col-md-4 mb-4">
                    <a href="FetchProductServlet"
                        style="text-decoration: none; color: inherit;">
                        <div class="card">
                            <img src="images/LOGO/show_products.jpg" class="card-img-top"
                                alt="fetchpro">
                            <div class="card-body">
                                <p class="card-text" style="font-family: serif;">SHOW
                                    PRODUCT's</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 mb-4">
                    <a href="addProduct.jsp"
                        style="text-decoration: none; color: inherit;">
                        <div class="card">
                            <img src="images/LOGO/add_products.png" class="card-img-top"
                                alt="addpro">
                            <div class="card-body">
                                <p class="card-text" style="font-family: serif;">ADD PRODUCT's</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4 mb-4">
                    <a href="delete_pro.jsp"
                        style="text-decoration: none; color: inherit;">
                        <div class="card">
                            <img src="images/LOGO/delete_pro.png" class="card-img-top"
                                alt="delpro">
                            <div class="card-body">
                                <p class="card-text" style="font-family: serif;">DELETE PRODUCT's</p>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>

        <div id="user-options" style="text-align: center;">
            <h3>Manage USER</h3>
            <br>
            <div class="row justify-content-center">
                <div class="col-md-4 mb-4">
                    <a href="UserManagementServlet"
                        style="text-decoration: none; color: inherit;">
                        <div class="card" style="width: 18rem;">
                            <img src="images/LOGO/user.jpg" class="card-img-top" alt="user">
                            <div class="card-body">
                                <p class="card-text" style="font-family: serif;">UPDATE USER's</p>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>

        <div id="order-options" style="text-align: center;">
            <h3>Manage ORDER's</h3>
            <br>
            <div class="row justify-content-center">
                <div class="col-md-4 mb-4">
                    <a href="OrderServlet"
                        style="text-decoration: none; color: inherit;">
                        <div class="card" style="width: 18rem;">
                            <img src="images/LOGO/orders.jpg" class="card-img-top"
                                alt="order">
                            <div class="card-body">
                                <p class="card-text" style="font-family: serif;">SHOW ORDER's</p>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script
            src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
            function showProductOptions(event) {
                event.preventDefault();
                var productOptions = document.getElementById('product-options');
                var userOptions = document.getElementById('user-options');
                var orderOptions = document.getElementById('order-options');

                productOptions.style.display = 'block';
                userOptions.style.display = 'none';
                orderOptions.style.display = 'none';
            }

            function showUserOptions(event) {
                event.preventDefault();
                var userOptions = document.getElementById('user-options');
                var productOptions = document.getElementById('product-options');
                var orderOptions = document.getElementById('order-options');

                userOptions.style.display = 'block';
                productOptions.style.display = 'none';
                orderOptions.style.display = 'none';
            }

            function showOrderOptions(event) {
                event.preventDefault();
                var orderOptions = document.getElementById('order-options');
                var productOptions = document.getElementById('product-options');
                var userOptions = document.getElementById('user-options');

                orderOptions.style.display = 'block';
                productOptions.style.display = 'none';
                userOptions.style.display = 'none';
            }
        </script>
</body>
</html>
