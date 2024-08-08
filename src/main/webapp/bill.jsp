<%@page import="java.util.ArrayList"%>
<%@ page import="Model.User"%>
<%@ page import="Model.Cart"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bill</title>
<%@ include file="component/head.jsp"%>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	color: #333;
}

.container {
	max-width: 800px;
	margin: 40px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.bill-header {
	font-size: 36px;
	font-family: 'Times New Roman', serif;
	color: #333;
	text-align: center;
	margin: 20px 0;
}

.bill-details p {
	margin: 10px 0;
	font-size: 16px;
}

.bill-details strong {
	color: #555;
}

.bill-details .inline {
	display: flex;
	justify-content: space-between;
	margin-bottom: 10px;
}

.bill-details .inline p {
	margin: 0;
}

.bill-details .inline .half-width {
	width: 48%;
}

.total-amount-container {
	display: flex;
	justify-content: flex-end;
	margin-top: 10px;
}

.total-amount {
	font-size: 2rem;
	font-weight: bold;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

table, th, td {
	border: 1px solid #ddd;
}

th, td {
	padding: 12px;
	text-align: center;
}

th {
	background-color: #333;
	color: white;
	font-size: 18px;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

tr:hover {
	background-color: #f1f1f1;
}

.print-button {
	background-color: #333;
	color: white;
	border: none;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	border-radius: 4px;
	margin-top: 20px;
}

.print-button:hover {
	background-color: #555;
}

@media print {
	.print-button {
		display: none;
	}
}
</style>
</head>
<body>
	<div class="container">
		<h1 class="bill-header">MALHAR</h1>
		<h2 class="bill-header">BILL RECEIPT</h2>
		<div class="bill-details">
			<div class="inline">
				<p class="half-width">
					<strong>Username:</strong>
					<%=request.getAttribute("username")%></p>
				<p class="half-width">
					<strong>Email:</strong>
					<%=request.getAttribute("email")%></p>
				<p class="half-width">
					<strong>Mobile:</strong>
					<%=request.getAttribute("mobile")%></p>

			</div>
			<div class="inline">
				<p class="half-width">
					<strong>Address:</strong>
					<%=request.getAttribute("address")%></p>
				<div class="total-amount-container">
					<p class="total-amount" style="font-size: 1.5rem;">
						<strong>Total Amount:</strong> $<%=request.getAttribute("totalAmount")%></p>
				</div>
			</div>
		</div>
		<h3 style="text-align: center; margin-top: 20px;">Order Details</h3>
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
				<td><%=item.getPtitle()%></td>
				<td><%=item.getCategory()%></td>
				<td>$<%=item.getPrice()%></td>
				<td><%=item.getQuantity()%></td>
			</tr>
			<%
			}
			}
			%>
		</table>
		<button class="print-button" onclick="window.print()">Print
			Bill</button>
	</div>
	<%@ include file="component/foot.jsp"%>
</body>
</html>
