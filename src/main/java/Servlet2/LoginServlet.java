package Servlet2;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Connection.DBconnect;
import Dao.UserDao;
import Model.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Initialize validation messages
        String emailError = null;
        String passwordError = null;

        // Validate input data
        if (email == null || email.trim().isEmpty()) {
            emailError = "Email is required.";
        } else if (!email.matches("^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$")) {
            emailError = "Invalid email format.";
        }

        if (password == null || password.trim().isEmpty()) {
            passwordError = "Password is required.";
        }

        if (emailError != null || passwordError != null) {
            // Set the error messages in request attributes
            request.setAttribute("emailError", emailError);
            request.setAttribute("passwordError", passwordError);

            // Forward back to the login JSP page with error messages
            request.setAttribute("email", email);
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        try (PrintWriter out = response.getWriter()) {
            try {
                UserDao udao = new UserDao(DBconnect.getConnection());
                User user = udao.userlogin(email, password);
                if (user != null) {
                    request.getSession().setAttribute("auth", user);
                    response.sendRedirect("index.jsp");
                } else {
                    request.setAttribute("loginError", "Invalid email or password.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                request.setAttribute("loginError", "An error occurred: " + e.getMessage());
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
    }
}
