package Servlet2;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Cart;

/**
 * Servlet implementation class Removefromcart
 */
@WebServlet("/Removefromcart")
public class Removefromcart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter();) {

			String pid = request.getParameter("pid");
			out.println("product:id is:" + pid);

			if (pid != null) {

				ArrayList<Cart> cart_List = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
				if (cart_List != null) {
					for (Cart c : cart_List) {

						if (c.getPid() == Integer.parseInt(pid)) {
							cart_List.remove(cart_List.indexOf(c));
							break;
						}
					}
					response.sendRedirect("cart.jsp");

				}

			} else {

				response.sendRedirect("cart.jsp");
			}
		}
	}

}
