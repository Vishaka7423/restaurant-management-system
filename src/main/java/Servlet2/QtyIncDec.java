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
 * Servlet implementation class QtyIncDec
 */
@WebServlet("/Qty-Inc-Dec")
public class QtyIncDec extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter();) {

			String action = request.getParameter("action");
			int pid = Integer.parseInt(request.getParameter("pid"));

			ArrayList<Cart> cart_List = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");

			if (action != null && pid >= 1) {
				if (action.equals("inc")) {
					for (Cart c : cart_List) {
						if (c.getPid() == pid) {

							int quantity = c.getQuantity();
							quantity++;
							c.setQuantity(quantity);
							response.sendRedirect("cart.jsp");
						}

					}

				}
				if (action.equals("dec")) {
					for (Cart c : cart_List) {
						if (c.getPid() == pid && c.getQuantity() > 1) {

							int quantity = c.getQuantity();
							quantity--;
							c.setQuantity(quantity);
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
