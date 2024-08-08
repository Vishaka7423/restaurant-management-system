<%@ page import="Model.Product" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Product</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2 style="text-align: center;">Add New Product</h2>
    <form action="AddProductServlet" method="post">
        <div class="form-group">
            <label for="ptitle">Product Title:</label>
            <input type="text" id="ptitle" name="ptitle" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="category">Category:</label>
            <select id="category" name="category" class="form-control" required>
                <option value="nonveg">Non-Veg</option>
                <option value="veg">Veg</option>
                <option value="dessert">Dessert</option>
            </select>
        </div>
        <div class="form-group">
            <label for="price">Price:</label>
            <input type="number" id="price" name="price" class="form-control" step="0.01" required>
        </div>
        <div class="form-group">
            <label for="pphoto">Photo (category/filename):</label>
            <input type="text" id="pphoto" name="pphoto" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Add Product</button>
    </form>
</div>
</body>
</html>
