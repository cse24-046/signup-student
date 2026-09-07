package bac.ac.signupstudent;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

import java.io.IOException;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String studentId = request.getParameter("studentId");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");

        String error = null;
        if (name == null || name.trim().isEmpty() || surname == null || surname.trim().isEmpty() || studentId == null || studentId.trim().isEmpty() || email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty() || gender == null || gender.trim().isEmpty()) {
            error = "All fields are required.";
        } else if (UserStore.studentIdExists(studentId)) {
            error = "Student ID is already registered.";
        } else if (UserStore.emailExists(email)) {
            error = "Email is already registered.";
        }

        if (error != null) {
            request.setAttribute("error", error);
            RequestDispatcher rd = request.getRequestDispatcher("/signup.jsp");
            rd.forward(request, response);
            return;
        }

        int idx = UserStore.addUser(name.trim(), surname.trim(), studentId.trim(), email.trim(), password, gender.trim());
        if (idx >= 0) {
            response.sendRedirect(request.getContextPath() + "/login.jsp?registered=1");
        } else {
            request.setAttribute("error", "Registration failed. Please try again later.");
            RequestDispatcher rd = request.getRequestDispatcher("/signup.jsp");
            rd.forward(request, response);
        }
    }
}
