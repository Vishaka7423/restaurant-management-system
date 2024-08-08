package Servlet2;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminServ extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Initialize validation messages
        String usernameError = null;
        String emailError = null;
        String passwordError = null;

        // Validate input data
        if (username == null || username.trim().isEmpty()) {
            usernameError = "Username is required.";
        }

        if (email == null || email.trim().isEmpty()) {
            emailError = "Email is required.";
        } else if (!email.matches("^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$")) {
            emailError = "Invalid email format.";
        }

        if (password == null || password.trim().isEmpty()) {
            passwordError = "Password is required.";
        }

        if (usernameError != null || emailError != null || passwordError != null) {
            // Set the error messages in request attributes
            request.setAttribute("usernameError", usernameError);
            request.setAttribute("emailError", emailError);
            request.setAttribute("passwordError", passwordError);

            // Forward back to the admin login JSP page with error messages
            request.setAttribute("username", username);
            request.setAttribute("email", email);
            request.getRequestDispatcher("admin.jsp").forward(request, response);
            return;
        }

        // Check login credentials
        if ("admin@gmail.com".equals(email) && "Admin@7423".equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            response.sendRedirect("adminDashboard.jsp"); // Redirect to welcome page
        } else {
            // Forward back to the admin login JSP page with error message
            request.setAttribute("loginError", "Invalid email or password");
            request.setAttribute("username", username);
            request.setAttribute("email", email);
            request.getRequestDispatcher("admin.jsp").forward(request, response);
        }
    }
}
