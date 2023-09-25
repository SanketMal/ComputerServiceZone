<%-- 
    Document   : service-confirm-message
    Created on : 16 Sep, 2023, 6:27:09 PM
    Author     : Sanket Mal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
    Integer customerId = (Integer) session.getAttribute("customerId");
    //out.print(adminId);
    if (customerId == null) {
        response.sendRedirect("customer-login-page.jsp");
    }
%>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/x-icon" href="images/logo.png">
        <title>Confirm Message</title>
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/customer-styles.min.css" />
        
        <link href="assets/css/font-style.css" rel="stylesheet">
    </head>
    <body>
        <h1>Thanks for confirming your service booking!</h1>
        <h4><a href="customer-dashboard.jsp">Go back to Dashboard page</a></h4>
    </body>
</html>
