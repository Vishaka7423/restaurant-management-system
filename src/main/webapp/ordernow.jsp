<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Connection.DBconnect"%>
<%@ page import="Model.*"%>
<%@ page import="Dao.ProductDao"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="component/head.jsp"%>
<%@ include file="component/navbar.jsp"%>
<%
auth = (User) request.getSession().getAttribute("auth");

if (auth != null) {
	request.setAttribute("auth", auth);
}
ProductDao pd = new ProductDao(DBconnect.getConnection());
List<Product> nonproducts = pd.getNonProduct();
List<Product> vegproducts = pd.getVegProduct();
List<Product> desproducts = pd.getDessertProduct();
%>


<style>
.card-img-custom {
	margin-top: 0.9rem;
}
</style>

</head>
<body>
	<div class="dropdown" style="margin-left: 0.8rem; margin-top: 0.3rem;">
		<button class="btn btn-secondary dropdown-toggle" type="button"
			id="dropdownMenuButton1" data-bs-toggle="dropdown"
			aria-expanded="false">CATEGORY</button>
		<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
			<li><a class="dropdown-item" href="#nonveg_header">NONVEG</a></li>
			<li><a class="dropdown-item" href="#veg_header">VEG</a></li>
			<li><a class="dropdown-item" href="#des_header">DESSERTS</a></li>
		</ul>
	</div>

	<div class="container">
		<div class="card-header custom-card-header my-3 text-center"
			id="nonveg_header"
			style="font-family: 'Times New Roman', Times, serif; font-weight: bold; font-size: 2rem;">NONVEG</div>
		<div class="row">
			<%
			if (!nonproducts.isEmpty()) {
				for (Product p : nonproducts) {
			%>
			<div class="col-md-3 my-3">

				<div class="card" style="width: 16rem;"></div>
				<img src="images/<%=p.getPphoto()%>	"
					class="card-img-top card-img-custom" alt="m.biryani">
				<div class="card-body">
					<h5 class="card-title"><%=p.getPtitle()%></h5>
					<h5 class="price"><%=p.getPrice()%></h5>

					<a href="addtocart?id=<%=p.getPid()%>" class="btn btn-dark">ADD
						to Order</a>

				</div>
			</div>
			<%
			}

			}
			%>
		</div>
	</div>


	<div class="container">
		<div class="card-header custom-card-header my-3 text-center"
			id="veg_header"
			style="font-family: 'Times New Roman', Times, serif; font-weight: bold; font-size: 2rem;">VEG</div>
		<div class="row">

			<%
			if (!vegproducts.isEmpty()) {
				for (Product p : vegproducts) {
			%>
			<div class="col-md-3 my-3">

				<div class="card" style="width: 16rem;"></div>
				<img src="images/<%=p.getPphoto()%>	"
					class="card-img-top card-img-custom" alt="m.biryani">
				<div class="card-body">
					<h5 class="card-title"><%=p.getPtitle()%></h5>
					<h5 class="price"><%=p.getPrice()%></h5>

					<a href="addtocart?id=<%=p.getPid()%>" class="btn btn-dark">ADD
						to Order</a>

				</div>
			</div>

			<%
			}

			}
			%>
		</div>
	</div>
	<div class="container">
		<div class="card-header custom-card-header my-3 text-center"
			id="des_header"
			style="font-family: 'Times New Roman', Times, serif; font-weight: bold; font-size: 2rem;">DESSERTS
			AND MUCHMORE</div>
		<div class="row">

			<%
			if (!desproducts.isEmpty()) {
				for (Product p : desproducts) {
			%>
			<div class="col-md-3 my-3">

				<div class="card" style="width: 16rem;"></div>
				<img src="images/<%=p.getPphoto()%>	"
					class="card-img-top card-img-custom" alt="m.biryani">
				<div class="card-body">
					<h5 class="card-title"><%=p.getPtitle()%></h5>
					<h5 class="price"><%=p.getPrice()%></h5>

					<a href="addtocart?id=<%=p.getPid()%>" class="btn btn-dark">ADD
						to Order</a>

				</div>
			</div>

			<%
			}

			}
			%>
		</div>
	</div>


	<%@ include file="component/foot.jsp"%>

</body>
</html>