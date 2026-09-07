<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Sign Up</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="<%= (session.getAttribute("theme")!=null && session.getAttribute("theme").equals("light"))?"theme-light":"" %>">
<div class="container">
    <h1>Student Sign Up</h1>
    <div class="card">
        <form method="post" action="SignupServlet">
            <label for="name">Name</label>
            <input id="name" name="name" type="text" required />

            <label for="surname">Surname</label>
            <input id="surname" name="surname" type="text" required />

            <label for="studentId">Student ID</label>
            <input id="studentId" name="studentId" type="text" required />

            <label for="email">Email</label>
            <input id="email" name="email" type="email" required />

            <label for="password">Password</label>
            <input id="password" name="password" type="password" required />

                <label>Gender</label>
                <div class="radio-group">
                    <label class="radio"><input type="radio" name="gender" value="Male" required> <span>Male</span></label>
                    <label class="radio"><input type="radio" name="gender" value="Female"> <span>Female</span></label>
                </div>

                <button type="submit" class="btn">Sign Up</button>
            </form>
            <p class="muted">Already have an account? <a href="login.jsp">Login</a></p>
            <div class="message">
                <% String error = (String) request.getAttribute("error"); %>
                <% if (error != null) { %>
                    <div class="error"><%= error %></div>
                <% } %>
            </div>
    </div>
</div>
</body>
</html>
