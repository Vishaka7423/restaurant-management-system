<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MALHAR</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.navbar {
	background-color: rgb(128, 45, 15);
}

.navbar-brand {
	color: rgb(232, 144, 112);
	border: none;
	font-size: 1.2rem;
	font-family: 'Times New Roman', Times, serif;
}

.navbar-brand:hover {
	background-color: rgb(232, 144, 112);
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
	background-color: rgb(232, 144, 112);
	color: black;
	border-radius: 15px;
	font-weight: bolder;
	font-size: 1.3rem;
}

.navbar-nav .user-greeting {
	margin-left: 0;
	text-align: center;
	color: #ffe69e;
	font-size: 2rem;
	font-family: 'Times New Roman', Times, serif;
}

.toast-container {
	position: fixed;
	top: 20px;
	left: 50%;
	transform: translateX(-50%);
	z-index: 1055;
}

.toast {
	background-color: #f8f9fa;
	color: #343a40;
}

.toast-header {
	background-color: #e9ecef;
	color: #343a40;
}

.toast-body {
	color: #343a40;
}

.footer {
	background-color: rgb(232, 144, 112);
}
</style>
</head>
<body>
	<%
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth == null) {
	%>
	<div aria-live="polite" aria-atomic="true"
		class="bg-dark position-relative bd-example-toasts">
		<div class="toast-container p-3" id="toastPlacement">
			<div class="toast" role="alert" aria-live="assertive"
				aria-atomic="true">
				<div class="toast-header">
					<img src="https://via.placeholder.com/20" class="rounded me-2"
						alt="Placeholder Image"> <strong class="me-auto">WELCOME
						TO MALHAR'S KITCHEN</strong>
					<button type="button" class="btn-close" data-bs-dismiss="toast"
						aria-label="Close"></button>
				</div>
				<div class="toast-body">TO ORDER PLEASE LOGIN FIRST !!!</div>
			</div>
		</div>
	</div>
	<%
	}
	%>

	<nav class="navbar navbar-expand-lg ">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">MALHAR</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp">HOME</a></li>
					<li class="nav-item"><a class="nav-link" href="#menu">MENU</a></li>
					<li class="nav-item"><a class="nav-link" href="#chef">OUR
							CHEFS</a></li>
					<li class="nav-item"><a class="nav-link" href="admin.jsp">ADMIN</a></li>
					<li class="nav-item"><a class="nav-link"
						href="registration.jsp">REGISTRATION</a></li>
				</ul>
				<ul class="navbar-nav mt-auto mb-2 mb-lg-0">
					<%
					auth = (User) request.getSession().getAttribute("auth");
					if (auth != null) {
						String username = auth.getname(); // Assuming `getName()` returns the user's name
					%>
					<li class="nav-item user-greeting"
						style="margin-left: 0; margin-right: 8rem;">HEY! <%=username%></li>
					<li class="nav-item"><a class="nav-link active"
						href="ordernow.jsp">ORDER NOW</a></li>
					<li class="nav-item"><a
						class="nav-link active position-relative" aria-current="page"
						href="cart.jsp">CART <span
							class="position-absolute top-2 start-100 translate-middle badge rounded-pill bg-danger">
								<%
								ArrayList<Cart> cart_List = (ArrayList<Cart>) session.getAttribute("cart-list");
								if (cart_List != null) {
									out.print(cart_List.size());
								} else {
									out.print("0");
								}
								%>
						</span></a></li>
					<li class="nav-item"><a class="nav-link active"
						href="LogoutServlet">LOGOUT</a></li>
					<%
					} else {
					%>
					<li class="nav-item"><a class="nav-link active"
						href="login.jsp">LOGIN</a></li>
					<%
					}
					%>
				</ul>
			</div>
		</div>
	</nav>




	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
    window.addEventListener('DOMContentLoaded', (event) => {
        const toastEl = document.querySelector('.toast');
        if (toastEl) {
            const toast = new bootstrap.Toast(toastEl, {
                autohide: false
            });
            toast.show();
        }
    });
    </script>
</body>
</html>
