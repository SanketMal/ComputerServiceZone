<%-- 
    Document   : admin-profile
    Created on : 20 Aug, 2023, 9:53:54 PM
    Author     : Sanket Mal
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="util.Utility"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.DatabaseConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<!DOCTYPE html>
<html>
    <head>
        <%
            Integer adminId =(Integer )session.getAttribute("adminId");
            if(adminId == null){
                response.sendRedirect("admin-login.jsp");
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/x-icon" href="../images/logo.png">
        <title>Admin Profile</title>
        <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="../assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="../assets/css/admin.css" rel="stylesheet">
    </head>
    <body>
        <div class="header bg-light">
            <div class="container">
                <div class="row">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <div class="float-left">
                            <a class="navbar-brand logo" href="#"><img class="img-fluid" src="../images/logo.png"></a> 
                            <button aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler" data-target="#navbarSupportedContent" data-toggle="collapse" type="button"><span class="navbar-toggler-icon"></span></button>
                        </div>
                        <div class="float-right">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item ">
                                    <a class="nav-link" href="device-type.jsp">Device Type</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="sub-device-type.jsp">Sub Device Type</a>
                                </li>
                                <li class="nav-item ">
                                    <a class="nav-link" href="device-os-type.jsp">Device OS Type</a>
                                </li>
                                <li class="nav-item ">
                                    <a class="nav-link" href="common-defect.jsp">Common Defect</a>
                                </li>
                                <li class="nav-item ">
                                    <a class="nav-link" href="customer-request.jsp">Customer Request</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="interested-person.jsp">Interested Person</a>
                                </li>
                                <li class="nav-item ">
                                    <a class="nav-link" href="customer-feedback.jsp">Customer Feedback</a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link" href="admin-profile.jsp">Admin Profile</a>
                                </li>
                                <li class="nav-item">
                                    <button id="btn"><a class="nav-link" href="logout.jsp">Logout</a></button>
                                </li>
                            </ul>
                        </div>
                        <!--<div class="collapse navbar-collapse float-right" id="navbarSupportedContent">
                            
                        </div>-->
                    </nav>
                </div>
            </div>
        </div>
       <h1 >Admin Profile</h1>
    
    <% 
      //  Establish a database connection
        Connection con = null;
        Statement stmt = null;
        try {
           con = DatabaseConnection.getConnection();
           int userId = (int) session.getAttribute("adminId");
           
        // Execute a query to retrieve admin details     
            String query = "SELECT * FROM user WHERE user_id = " + userId + " AND user_role = 1 AND user_active = 1"; 
            stmt = con.createStatement();
            ResultSet rst = stmt.executeQuery(query);
            
            // Display admin details
            if (rst.next()) {             
                String firstName = rst.getString("user_first_name");
                String lastName = rst.getString("user_last_name");
                String phoneNumber= rst.getString("user_phone_number");
                String email = rst.getString("user_email");
                System.out.println(email);
                // Extract and display other admin details
                out.println("<p>User Id: " + userId + "</p>");
                out.println("<p>First Name: " + firstName + "</p>");
                out.println("<p>Last Name: " + lastName + "</p>");
                out.println("<p>Phone Number: " + phoneNumber + "</p>");
                
                
                out.println("<p>Email: " + email + "</p>");
                
            }
            
            Utility.closeDbConnection(con, rst, stmt);
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        } 
    %>

    </body>
</html>
