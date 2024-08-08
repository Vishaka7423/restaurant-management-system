<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Cart" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Confirmation</title>
<%@ include file="component/head.jsp" %>
<style>
body {
    font-family: 'Times New Roman', serif;
    background-color: #f9f9f9;
    color: #333;
}

.container {
    max-width: 800px;
    margin: 40px auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    border-radius: 10px;
    text-align: center; /* Center all text in the container */
}

h1, h2, h3 {
    color: #444;
    text-align: center; /* Center the headings */
}

h1 {
    font-size: 2.5em;
    margin-bottom: 20px;
}

h2 {
    font-size: 2em;
    margin-bottom: 15px;
}

h3 {
    font-size: 1.5em;
    margin-top: 20px;
}

p {
    font-size: 1.1em;
    margin: 10px 0;
    text-align: center; /* Center the paragraphs */
}

table {
    margin: 20px auto;
    border-collapse: collapse;
    width: 100%;
}

th, td {
    padding: 12px 15px;
    border: 1px solid #ddd;
    text-align: left;
}

th {
    background-color: #f1f1f1;
}

.button-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 20px;
}

button {
    padding: 10px 20px;
    font-size: 1.1em;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.btn-primary {
    background-color: #007bff;
    color: #fff;
}

.btn-success {
    background-color: #28a745;
    color: #fff;
}

button:hover {
    opacity: 0.9;
}
</style>
</head>
<body>
    <div class="container">
        <button class="btn btn-primary" style="position: fixed; top: 10px; left: 10px;" onclick="goBack()">Back to Menu</button>
        <h1>Order Confirmation</h1>
        <p>Thank you for your purchase, <%= request.getAttribute("username") %>!</p>
        <p>Email: <%= request.getAttribute("email") %></p>
        <h2>Order Summary</h2>
        <table>
            <tr>
                <th>Name</th>
                <th>Category</th>
                <th>Price</th>
                <th>Quantity</th>
            </tr>
            <%
            ArrayList<Cart> cartProducts = (ArrayList<Cart>) request.getAttribute("cartProducts");
            if (cartProducts != null) {
                for (Cart item : cartProducts) {
            %>
            <tr>
                <td><%= item.getPtitle() %></td>
                <td><%= item.getCategory() %></td>
                <td>$<%= item.getPrice() %></td>
                <td><%= item.getQuantity() %></td>
            </tr>
            <%
                }
            }
            %>
        </table>
        <div class="button-container">
            <h3>Total Amount: Rs. <%= request.getAttribute("totalAmount") %></h3>
            <form id="billForm" action="BillServlet" method="post">
                <input type="hidden" name="username" value="<%= request.getAttribute("username") %>">
                <input type="hidden" name="email" value="<%= request.getAttribute("email") %>">
                <input type="hidden" name="mobile" value="<%= request.getAttribute("mobile") %>">
                <input type="hidden" name="address" value="<%= request.getAttribute("address") %>">
                <input type="hidden" name="cartProducts" value="<%
                    StringBuilder formattedProducts = new StringBuilder();
                    if (cartProducts != null) {
                        for (Cart item : cartProducts) {
                            formattedProducts.append(item.getPtitle())
                                              .append(";")
                                              .append(item.getCategory())
                                              .append(";")
                                              .append(item.getPrice())
                                              .append(";")
                                              .append(item.getQuantity())
                                              .append(",");
                        }
                        if (formattedProducts.length() > 0) {
                            formattedProducts.setLength(formattedProducts.length() - 1); // Remove trailing comma
                        }
                    }
                    out.print(formattedProducts.toString());
                %>">
                <input type="hidden" name="totalAmount" value="<%= request.getAttribute("totalAmount") %>">
                <button type="submit" class="btn btn-success">Generate Bill</button>
            </form>
        </div>
        <script>
            function goBack() {
                window.history.back();
            }
        </script>
    </div>
    <%@ include file="component/foot.jsp" %>
</body>
</html>
