<%@ page import="java.util.List" %>
<%@ page import="Model.Order" %>
<html>
<head>
    <title>Orders</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
            text-align: left;
        }
    </style>
</head>
<body>
    <h2>Orders List</h2>
    <table>
        <tr>
            <th>Order ID</th>
            <th>Username</th>
            <th>Email</th>
            <th>Mobile</th>
            <th>Address</th>
            <th>Cart Products</th>
            <th>Total Amount</th>
        </tr>
        <%
            List<Order> orders = (List<Order>) request.getAttribute("orders");
            for (Order order : orders) {
        %>
        <tr>
            <td><%= order.getOrderid() %></td>
            <td><%= order.getUsername() %></td>
            <td><%= order.getEmail() %></td>
            <td><%= order.getMobile() %></td>
            <td><%= order.getAddress() %></td>
            <td><%= order.getCartProducts() %></td>
            <td><%= order.getTotalAmount() != null ? String.format("%.2f", order.getTotalAmount()) : "N/A" %></td>
        </tr>
        <% } %>
    </table>
</body>
</html>
