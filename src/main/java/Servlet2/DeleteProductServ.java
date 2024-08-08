package Servlet2;

import Dao.ProductDao;
import Connection.DBconnect;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*@WebServlet("/DeleteProductServlet")
*/public class DeleteProductServ extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("id"));

        try{ProductDao productDao = new ProductDao(DBconnect.getConnection());
        boolean isDeleted = productDao.deleteProduct(productId);

        if (isDeleted) {
            response.sendRedirect("delete_pro.jsp?message=Product deleted successfully");
        } else {
            response.sendRedirect("delete_pro.jsp?message=Failed to delete product");
        }
        }catch(SQLException |ClassNotFoundException e) {
        	
        	
        	e.printStackTrace();
        	
        	
        }
    }
}
