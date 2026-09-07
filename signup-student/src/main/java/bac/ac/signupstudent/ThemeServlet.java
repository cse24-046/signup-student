package bac.ac.signupstudent;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/ThemeServlet")
public class ThemeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String current = (String) session.getAttribute("theme");
        if (current == null || "dark".equals(current)) {
            session.setAttribute("theme", "light");
        } else {
            session.setAttribute("theme", "dark");
        }
        String referer = request.getHeader("Referer");
        if (referer != null) response.sendRedirect(referer);
        else response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
}
