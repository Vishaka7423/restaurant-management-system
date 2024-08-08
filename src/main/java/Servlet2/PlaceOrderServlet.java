package Servlet2;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
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

@WebServlet("/placeorder")
public class PlaceOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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

                // Prepare request attributes
                request.setAttribute("username", auth.getname());
                request.setAttribute("email", auth.getEmail());
                request.setAttribute("totalAmount", total);
                request.setAttribute("cartProducts", cartProducts);

                // Forward to JSP
                request.getRequestDispatcher("orderConfirmation.jsp").forward(request, response);

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
