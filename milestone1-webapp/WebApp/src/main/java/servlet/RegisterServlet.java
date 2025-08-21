package servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.regex.Pattern;
import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final Pattern EMAIL_PATTERN = Pattern.compile("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$");
    private static final Pattern PHONE_PATTERN = Pattern.compile("^\\+?[1-9]\\d{1,14}$");
    private static final Pattern PASSWORD_PATTERN = Pattern.compile("^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$");

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentNumber = request.getParameter("studentNumber");
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        // Validation
        if (!EMAIL_PATTERN.matcher(email).matches()) {
            request.setAttribute("error", "Invalid email format");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        if (!PHONE_PATTERN.matcher(phone).matches()) {
            request.setAttribute("error", "Invalid phone number format");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        if (!PASSWORD_PATTERN.matcher(password).matches()) {
            request.setAttribute("error", "Password must be at least 8 characters long and contain letters and numbers");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        // Hash password
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO users (student_number, name, surname, email, phone, password) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, studentNumber);
            stmt.setString(2, name);
            stmt.setString(3, surname);
            stmt.setString(4, email);
            stmt.setString(5, phone);
            stmt.setString(6, hashedPassword);

            stmt.executeUpdate();
            request.setAttribute("message", "Registered successfully! Please login.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } catch (SQLException e) {
            if (e.getSQLState().equals("23505")) { // Unique constraint violation
                request.setAttribute("error", "Student number or email already exists");
            } else {
                request.setAttribute("error", "Registration failed: " + e.getMessage());
            }
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}