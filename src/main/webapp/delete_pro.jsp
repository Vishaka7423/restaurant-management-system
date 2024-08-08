<%@ page import="Dao.ProductDao, Model.Product, Connection.DBconnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Product</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h2 style="text-align: center;">Delete Product</h2>

    <!-- Form to enter Product ID -->
    <form method="get" action="delete_pro.jsp">
        <div class="form-group">
            <label for="productId">Enter Product ID:</label>
            <input type="text" id="productId" name="id" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Fetch Product</button>
    </form>

    <%
        String idStr = request.getParameter("id");
        if (idStr != null && !idStr.isEmpty()) {
            int productId = Integer.parseInt(idStr);
            ProductDao productDao = new ProductDao(DBconnect.getConnection());
            Product product = productDao.getProductById(productId);

            if (product != null) {
    %>
    <!-- Display Product Details -->
    <form method="post" action="DeleteProductServ">
        <input type="hidden" name="id" value="<%= product.getPid() %>">
        <div class="form-group">
            <label for="productName">Product Name:</label>
            <input type="text" id="productName" name="name" class="form-control" value="<%= product.getPtitle() %>" readonly>
        </div>
        <div class="form-group">
            <label for="productCategory">Category:</label>
            <input type="text" id="productCategory" name="category" class="form-control" value="<%= product.getCategory() %>" readonly>
        </div>
        <div class="form-group">
            <label for="productPrice">Price:</label>
            <input type="text" id="productPrice" name="price" class="form-control" value="<%= product.getPrice() %>" readonly>
        </div>
        <button type="submit" class="btn btn-danger">Delete Product</button>
    </form>
    <%
            } else {
    %>
    <p class="text-danger">Product with ID <%= productId %> not found.</p>
    <%
            }
        }
    %>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
