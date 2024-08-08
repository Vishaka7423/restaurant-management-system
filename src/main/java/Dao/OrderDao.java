package Dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.Order;

public class OrderDao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/hotel2";
    private String jdbcUsername = "root";
    private String jdbcPassword = "vishaka";

    private static final String SELECT_ALL_ORDERS = "SELECT * FROM orders";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ORDERS)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderid(rs.getInt("orderid"));
                order.setUsername(rs.getString("username"));
                order.setEmail(rs.getString("email"));
                order.setMobile(rs.getString("mobile"));
                order.setAddress(rs.getString("address"));
                order.setCartProducts(rs.getString("cartProducts"));
                order.setTotalAmount(rs.getDouble("TotalAmount"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }
}
