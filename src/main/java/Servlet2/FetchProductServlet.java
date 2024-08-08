package Servlet2;

import Dao.ProductDao;
import Connection.DBconnect;
import Model.Product;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*@WebServlet("/FetchProductsServlet")
*/public class FetchProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try{ProductDao productDao = new ProductDao(DBconnect.getConnection());
        List<Product> productList = productDao.getAllProducts(); // Fetch all products

        request.setAttribute("products", productList);
        request.getRequestDispatcher("display_products.jsp").forward(request, response);}
        catch(ClassNotFoundException | SQLException e) {
        	
        	e.printStackTrace();
        	
        }
    }
}
