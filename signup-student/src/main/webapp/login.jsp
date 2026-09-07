<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Login</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="<%= (session.getAttribute("theme")!=null && session.getAttribute("theme").equals("light"))?"theme-light":"" %>">
<div class="container">
    <h1>Student Login</h1>
    <div class="card">
        <form method="post" action="LoginServlet">
            <label for="email">Email</label>
            <input id="email" name="email" type="email" required />

            <label for="password">Password</label>
            <input id="password" name="password" type="password" required />

            <button type="submit" class="btn">Login</button>
        </form>
        <p class="muted" style="margin-top:12px;text-align:center">Don't have an account?</p>
        <div style="text-align:center;margin-top:10px">
            <form action="signup.jsp" method="get" style="display:inline-block">
                <button type="submit" class="btn" style="min-width:140px">Create an account</button>
            </form>
        </div>
        <div class="message">
            <% String error = (String) request.getAttribute("error"); %>
            <% if (error != null) { %>
                <div class="error"><%= error %></div>
            <% } %>
            <% if (request.getParameter("registered") != null) { %>
                <div class="success">Registration successful. Please login.</div>
            <% } %>
        </div>
    </div>
</div>
</body>
</html>
