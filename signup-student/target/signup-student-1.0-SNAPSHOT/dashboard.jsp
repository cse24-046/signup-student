<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bac.ac.signupstudent.UserStore" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="<%= (session.getAttribute("theme")!=null && session.getAttribute("theme").equals("light"))?"theme-light":"" %>">
<%
    Integer idxObj = (Integer) session.getAttribute("userIndex");
    if (idxObj == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    int idx = idxObj.intValue();
    String name = UserStore.getName(idx);
    String surname = UserStore.getSurname(idx);
    String studentId = UserStore.getStudentId(idx);
    String email = UserStore.getEmail(idx);
    String password = UserStore.getPassword(idx);
%>
<div class="container">
    <h1>Student Dashboard</h1>
    <div class="card <%= (UserStore.getGender(idx) != null && UserStore.getGender(idx).equalsIgnoreCase("Male")) ? "male" : (UserStore.getGender(idx) != null && UserStore.getGender(idx).equalsIgnoreCase("Female") ? "female" : "") %>">
        <div style="display:flex;align-items:center;gap:16px;margin-bottom:16px">
            <!-- Avatar SVG with initials -->
        <% String gender = (UserStore.getGender(idx)!=null)?UserStore.getGender(idx):""; String genderClass = gender.equalsIgnoreCase("Male")?"male":(gender.equalsIgnoreCase("Female")?"female":""); %>
        <div class="avatar <%= genderClass %>" style="width:72px;height:72px;border-radius:12px;overflow:hidden;flex:0 0 72px;display:flex;align-items:center;justify-content:center">
            <svg width="72" height="72" xmlns="http://www.w3.org/2000/svg">
                <rect width="100%" height="100%" fill="none"/>
                <text x="50%" y="50%" dominant-baseline="middle" text-anchor="middle" font-family="'Courier New', monospace" font-size="26" fill="currentColor"><%= (name!=null?name.substring(0,1):"") + (surname!=null && surname.length()>0?surname.substring(0,1):"") %></text>
            </svg>
        </div>
        <div style="flex:1">
            <p style="margin:0;font-weight:700"> <%= name %> <%= surname %></p>
            <p style="margin:0;margin-top:6px;font-size:14px"> <%= email %></p>
        </div>
        <div style="margin-left:auto">
            <form action="ThemeServlet" method="get">
                <% String currentTheme = (session.getAttribute("theme")!=null)?(String)session.getAttribute("theme"):"dark"; %>
                <% String toggleClass = "theme-toggle "+("light".equals(currentTheme)?("light "+genderClass):"dark"); %>
                <button type="submit" class="<%= toggleClass %>" aria-label="Toggle theme (current: <%= currentTheme %>)">
                    <% if ("light".equals(currentTheme)) { %>
                        <!-- Sun icon for light theme -->
                        <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                            <circle cx="12" cy="12" r="4" fill="currentColor" />
                            <g stroke="currentColor" stroke-width="1.4" stroke-linecap="round">
                                <path d="M12 2v2" />
                                <path d="M12 20v2" />
                                <path d="M4.2 4.2l1.4 1.4" />
                                <path d="M18.4 18.4l1.4 1.4" />
                                <path d="M2 12h2" />
                                <path d="M20 12h2" />
                                <path d="M4.2 19.8l1.4-1.4" />
                                <path d="M18.4 5.6l1.4-1.4" />
                            </g>
                        </svg>
                    <% } else { %>
                        <!-- Moon icon for dark theme -->
                        <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                            <path fill="currentColor" d="M21 12.79A9 9 0 1111.21 3 7 7 0 0021 12.79z" />
                        </svg>
                    <% } %>
                </button>
            </form>
        </div>
        </div>

        <p><strong>Student ID:</strong> <%= studentId %></p>
        <p><strong>Email:</strong> <%= email %></p>
        <p><strong>Password:</strong> <%= password %></p>

        <form action="LogoutServlet" method="get">
            <button type="submit" class="btn">Logout</button>
        </form>
    </div>
</div>
</body>
</html>
