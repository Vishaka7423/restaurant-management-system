package Servlet2;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Reg")
public class RegSer extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String DB_URL = "jdbc:mysql://localhost:3306/hotel2";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "vishaka";

    // JDBC driver name
    private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm");
        String address = request.getParameter("address");
        String mobile = request.getParameter("mobile");

        // Initialize validation messages
        String nameError = null;
        String emailError = null;
        String passwordError = null;
        String confirmPasswordError = null;
        String addressError = null;
        String mobileError = null;

        // Validate input data
        if (name == null || name.trim().isEmpty()) {
            nameError = "Name is required.";
        }
        if (email == null || !email.matches("^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$")) {
            emailError = "Invalid email format.";
        }
        if (password == null || password.length() < 8) {
            passwordError = "Password must be at least 8 characters long.";
        }
        if (confirmPassword == null || !confirmPassword.equals(password)) {
            confirmPasswordError = "Passwords do not match.";
        }
        if (address == null || address.trim().isEmpty()) {
            addressError = "Address is required.";
        }
        if (mobile == null || !mobile.matches("\\d{10}")) {
            mobileError = "Mobile number must be exactly 10 digits.";
        }

        if (nameError != null || emailError != null || passwordError != null || confirmPasswordError != null || addressError != null || mobileError != null) {
            // Set the error messages in request attributes
            request.setAttribute("nameError", nameError);
            request.setAttribute("emailError", emailError);
            request.setAttribute("passwordError", passwordError);
            request.setAttribute("confirmPasswordError", confirmPasswordError);
            request.setAttribute("addressError", addressError);
            request.setAttribute("mobileError", mobileError);

            // Forward back to the registration JSP page with error messages
            request.setAttribute("name", name);
            request.setAttribute("email", email);
            request.setAttribute("address", address);
            request.setAttribute("mobile", mobile);
            request.getRequestDispatcher("registration.jsp").forward(request, response);
            return;
        }

        Connection conn = null;
        PreparedStatement checkStmt = null;
        PreparedStatement insertStmt = null;
        ResultSet rs = null;

        try {
            // Load the JDBC driver
            Class.forName(JDBC_DRIVER);

            // Establish a connection
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Check if the user already exists
            String checkSql = "SELECT * FROM user WHERE email = ? OR mobile = ?";
            checkStmt = conn.prepareStatement(checkSql);
            checkStmt.setString(1, email);
            checkStmt.setString(2, mobile);
            rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Prepare error message
                String errorMessage = "User already exists with the same ";
                if (rs.getString("email").equals(email)) {
                    errorMessage += "email";
                }
                if (rs.getString("mobile").equals(mobile)) {
                    if (errorMessage.endsWith("email")) {
                        errorMessage += " and mobile number.";
                    } else {
                        errorMessage += "mobile number.";
                    }
                } else {
                    errorMessage += ".";
                }
                // Set the error message in request attributes
                request.setAttribute("registrationError", errorMessage);

                // Forward back to the registration JSP page with error message
                request.setAttribute("name", name);
                request.setAttribute("email", email);
                request.setAttribute("address", address);
                request.setAttribute("mobile", mobile);
                request.getRequestDispatcher("registration.jsp").forward(request, response);
            } else {
                // Create SQL insert statement
                String sql = "INSERT INTO user (name, email, password, address, mobile) VALUES (?, ?, ?, ?, ?)";

                // Create a PreparedStatement
                insertStmt = conn.prepareStatement(sql);
                insertStmt.setString(1, name);
                insertStmt.setString(2, email);
                insertStmt.setString(3, password);
                insertStmt.setString(4, address);
                insertStmt.setString(5, mobile);

                // Execute the insert
                int rowsInserted = insertStmt.executeUpdate();

                // Check if the insert was successful
                if (rowsInserted > 0) {
                    response.sendRedirect("login.jsp");
                } else {
                    request.setAttribute("registrationError", "Registration failed. Please try again.");
                    // Forward back to the registration JSP page with error message
                    request.setAttribute("name", name);
                    request.setAttribute("email", email);
                    request.setAttribute("address", address);
                    request.setAttribute("mobile", mobile);
                    request.getRequestDispatcher("registration.jsp").forward(request, response);
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("registrationError", "Database error: " + e.getMessage());
            // Forward back to the registration JSP page with error message
            request.setAttribute("name", name);
            request.setAttribute("email", email);
            request.setAttribute("address", address);
            request.setAttribute("mobile", mobile);
            request.getRequestDispatcher("registration.jsp").forward(request, response);
        } finally {
            // Close resources
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (checkStmt != null) {
                try {
                    checkStmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (insertStmt != null) {
                try {
                    insertStmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
