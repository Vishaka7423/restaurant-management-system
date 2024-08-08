package Servlet2;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Model.Cart;
import Model.User;
import Dao.ProductDao;
import Connection.DBconnect;

@WebServlet("/placeorder2")
public class PlaceOrderServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		User auth = (User) session.getAttribute("auth");
		ArrayList<Cart> cart_List = (ArrayList<Cart>) session.getAttribute("cart-list");

		if (auth != null && cart_List != null) {
			Connection connection = null;
			try {
				connection = DBconnect.getConnection();
				ProductDao pdao = new ProductDao(connection);
				double total = pdao.getTotalCartPrice(cart_List);
				ArrayList<Cart> cartProducts = pdao.getCartProducts(cart_List);

				// Clear the cart
				//session.removeAttribute("cart-list");

				try (PrintWriter out = response.getWriter()) {
					out.println("<html><body>");
					out.println("<h1>Order Confirmation</h1>");
					out.println("<p>Thank you for your purchase, " + auth.getname() + "!</p>");
					out.println("<p>Email: " + auth.getEmail() + "</p>");
					out.println("<h2>Order Summary</h2>");
					out.println(
							"<table border='1'><tr><th>Name</th><th>Category</th><th>Price</th><th>Quantity</th></tr>");

					for (Cart item : cartProducts) {
						out.println("<tr>");
						out.println("<td>" + item.getPtitle() + "</td>");
						out.println("<td>" + item.getCategory() + "</td>");
						out.println("<td>" + item.getPrice() + "</td>");
						out.println("<td>" + item.getQuantity() + "</td>");
						out.println("</tr>");
					}

					out.println("</table>");
					out.println("<h3>Total Amount: $" + total + "</h3>");
					  out.println("<button onclick='goBack()'>Back to Menu</button>");
	                    out.println("<script>");
	                    out.println("function goBack() {");
	                    out.println("    window.history.back();");
	                    out.println("}");
	                    out.println("</script>");
					out.println("</body></html>");
				}
			} catch (SQLException | ClassNotFoundException e) {
				e.printStackTrace();
				response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database connection problem");
			} finally {
				if (connection != null) {
					try {
						connection.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		} else {
			response.sendRedirect("login.jsp");
		}

	}
}
