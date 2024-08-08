package Servlet2;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Cart;

@WebServlet("/addtocart")
public class AddtoCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		try (PrintWriter out = response.getWriter()) {
			ArrayList<Cart> cartList = new ArrayList<Cart>();

			int id = Integer.parseInt(request.getParameter("id"));
			Cart cm = new Cart();
			cm.setPid(id);
			cm.setQuantity(1);

			HttpSession session = request.getSession();
			ArrayList<Cart> cart_List = (ArrayList<Cart>) session.getAttribute("cart-list");

			if (cart_List == null) {
				cartList.add(cm);
				session.setAttribute("cart-list", cartList);

				response.sendRedirect("ordernow.jsp");
			}

			else {
				cartList = cart_List;

				boolean exist = false;

				for (Cart c : cart_List) {
					if (c.getPid() == id) {
						exist = true;
						out.println(
				"<h3 style='color:crimson, text-align:center'>Item already exist in Cart.<a href='cart.jsp'>Go To Cart Page</a></h3>");
					}

				}
				if (!exist) {

					cartList.add(cm);
					response.sendRedirect("ordernow.jsp");
				}

			}
			
		}
	}

}
