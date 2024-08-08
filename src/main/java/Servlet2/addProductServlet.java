package Servlet2;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Dao.ProductDao;
import Connection.DBconnect;
import Model.Product;

@WebServlet("/AddProductServlet")
public class addProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String ptitle = request.getParameter("ptitle");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        String pphoto = request.getParameter("pphoto");
try {
        ProductDao pd = new ProductDao(DBconnect.getConnection());
        Product product = new Product();
        product.setPtitle(ptitle);
        product.setCategory(category);
        product.setPrice(price);
        product.setPphoto(pphoto);

        pd.addProduct(product);

        response.sendRedirect("adminDashboard.jsp"); // Redirect to admin dashboard or product listing page
}catch(ClassNotFoundException |SQLException e)
{
	
	 e.printStackTrace();
     response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database connection problem");
 
}
    }
}
