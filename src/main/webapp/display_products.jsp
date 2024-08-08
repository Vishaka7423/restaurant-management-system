<%@ page import="java.util.List" %>
<%@ page import="Model.Product" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product List</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h2>Product List</h2>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Category</th>
                <th>Price</th>
            </tr>
        </thead>
        <tbody>
            <% 
                List<Product> products = (List<Product>) request.getAttribute("products");
                if (products != null && !products.isEmpty()) {
                    for (Product product : products) {
            %>
            <tr>
                <td><%= product.getPid() %></td>
                <td><%= product.getPtitle() %></td>
                <td><%= product.getCategory() %></td>
                <td><%= product.getPrice() %></td>
            </tr>
            <% 
                    }
                } else {
            %>
            <tr>
                <td colspan="4" class="text-center">No products found</td>
            </tr>
            <% 
                }
            %>
        </tbody>
    </table>

    <a href="adminDashboard.jsp" class="btn btn-primary">Back to Dashboard</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
