<%-- 
    Document   : logout
    Created on : 4 Sep, 2023, 12:09:37 AM
    Author     : Sanket Mal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Logout</title>
</head>
<body>
    <%
        // Invalidate the user's session to log them out
        session.invalidate();
        // Redirect to the login page or any other appropriate page
        response.sendRedirect("admin-login.jsp");
    %>
</body>
</html>

