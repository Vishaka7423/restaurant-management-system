package Servlet2;

import Model.Cart;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BillServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String cartProductsStr = request.getParameter("cartProducts");
        String totalAmount = request.getParameter("totalAmount");

        String mobile = null;
        String address = null;

        ArrayList<Cart> cartProducts = new ArrayList<>();
        if (cartProductsStr != null && !cartProductsStr.isEmpty()) {
            String[] productsArray = cartProductsStr.split(",");
            for (String productStr : productsArray) {
                String[] productDetails = productStr.split(";");
                if (productDetails.length == 4) {
                    Cart cart = new Cart();
                    cart.setPtitle(productDetails[0]);
                    cart.setCategory(productDetails[1]);
                    cart.setPrice(Double.parseDouble(productDetails[2]));
                    cart.setQuantity(Integer.parseInt(productDetails[3]));
                    cartProducts.add(cart);
                }
            }
        }

        Connection conn = null;
        PreparedStatement userPs = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel2", "root", "vishaka");

            // Fetch mobile and address from user table
            String userSql = "SELECT mobile, address FROM user WHERE name = ?";
            userPs = conn.prepareStatement(userSql);
            userPs.setString(1, username);
            rs = userPs.executeQuery();
            if (rs.next()) {
                mobile = rs.getString("mobile");
                address = rs.getString("address");
            }

            // Insert order into orders table
            String sql = "INSERT INTO orders (username, email, mobile, address, cartProducts, totalAmount) VALUES (?, ?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, mobile);
            ps.setString(4, address);
            ps.setString(5, cartProductsStr);
            ps.setString(6, totalAmount);
            ps.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources in the finally block
            try {
                if (rs != null) rs.close();
                if (userPs != null) userPs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Set attributes for forwarding to bill.jsp
        request.setAttribute("username", username);
        request.setAttribute("email", email);
        request.setAttribute("mobile", mobile);
        request.setAttribute("address", address);
        request.setAttribute("cartProducts", cartProducts);
        request.setAttribute("totalAmount", totalAmount);

        request.getRequestDispatcher("bill.jsp").forward(request, response);
    }
}
