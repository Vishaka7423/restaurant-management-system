<%@page import="Dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="Connection.DBconnect"%>
<%@ page import="Model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<%@include file="component/head.jsp"%>
<%@ include file="component/navbar.jsp"%>
<%
auth = (User) request.getSession().getAttribute("auth");

if (auth != null) {
	request.setAttribute("auth", auth);
}

ArrayList<Cart> cart_List = (ArrayList<Cart>) session.getAttribute("cart-list");

ArrayList<Cart> cartproduct = null; // Changed to ArrayList
double total = 0;
if (cart_List != null) {
	ProductDao pdao = new ProductDao(DBconnect.getConnection());
	total = pdao.getTotalCartPrice(cart_List);
	cartproduct = pdao.getCartProducts(cart_List);
	request.setAttribute("cart_List", cart_List);
	request.setAttribute("total", total);
} else {
	out.println("<p>Cart is empty or cart-list attribute is not set in session.</p>");
}
%>
<style type="text/css">
.btn-incre, .btn-decre {
	box-shadow: none;
	font-size: 1.2rem;
	
}
.table {
    border-collapse: collapse;
}

.table th, .table td {
    border: 1px solid #dee2e6; /* Light gray border color */
    padding: 8px; /* Adjust padding as needed */
}

.table thead th {
    background-color: #f8f9fa; /* Light background for headers */
    border-bottom: 2px solid #dee2e6; /* Slightly thicker border for header */
}
</style>
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-between align-items-center py-3">
			<h3>
				Total Amount: Rs.<%=total%></h3>
			<form action="placeorder" method="post">
				<button type="submit" class="btn btn-success">Place An
					Order</button>
			</form>
		</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Quantity</th>

					<th scope="col">REMOVE?</th>

				</tr>
			</thead>
			<tbody>

				<%
				if (cart_List != null && cartproduct != null) {

					for (Cart c : cartproduct) {
				%>
				<tr>
					<td><%=c.getPtitle()%></td>
					<td><%=c.getCategory()%></td>
					<td><%=c.getPrice()%></td>
					<td style="width: 8.7rem">
						<form action="" method="post" class="form-inline">
							<input type="hidden" name="place" value="<%=c.getPid()%>"
								class="form-input">
							<div class="form-group d-flex" >
								<a class="btn btn-sm btn-decre"
									href="Qty-Inc-Dec?action=dec&pid=<%=c.getPid()%>"><i
									class="fa-regular fa-square-minus"></i></a> <input type="text"
									name="quantity" class="form-control"
									value="<%=c.getQuantity()%>" readonly
									style="width: 4rem; text-align: center"> <a
									class="btn btn-sm btn-incre"
									href="Qty-Inc-Dec?action=inc&pid=<%=c.getPid()%>"><i
									class="fa-regular fa-square-plus"></i></a>
								</div>


						</form>
					</td>

					<td><a class="btn btn-sm btn-danger" "
						href="Removefromcart?pid=<%=c.getPid()%>">REMOVE</a></td>
				</tr>
				<%
				}
				}
				%>

			</tbody>


		</table>
		<button class="btn btn-primary" onclick="goBack()">Back</button>

	</div>
	<%@include file="component/foot.jsp"%>
	<script>
		function goBack() {
			window.history.back();
		}
	</script>
</body>
</html>
