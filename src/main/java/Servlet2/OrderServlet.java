package Servlet2;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Dao.OrderDao;
import Model.Order;
/*@WebServlet("/orders")
*/public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private OrderDao orderDAO;

    public void init() {
        orderDAO = new OrderDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Order> orders = orderDAO.getAllOrders();
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("orders.jsp").forward(request, response);
    }
}
