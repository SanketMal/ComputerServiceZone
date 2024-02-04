<%-- 
    Document   : customer-details
    Created on : 20 Aug, 2023, 9:53:37 PM
    Author     : Sanket Mal
--%>

<%@page import="util.Utility"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.DatabaseConnection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <title>Customer Details</title>
        <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="../assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="../assets/css/admin.css" rel="stylesheet">
    </head>
    <body>
        <!-- Header Start -->
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
                                <li class="nav-item ">
                                    <a class="nav-link" href="sub-device-type.jsp">Problem Type</a>
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
                                <li class="nav-item active ">
                                    <a class="nav-link" href="customer-feedback.jsp">Customer Feedback</a>
                                </li>
                                <li class="nav-item ">
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
        <section class="container">
    <div class="row">
        <%
            Connection con = null;
            Statement stmt = null;
            List<Map<Object, Object>> customerFeedback = new ArrayList<>();

            try {
                con = DatabaseConnection.getConnection();
                String query = "SELECT feedback.customer_id ,feedback.feedback,feedback.rating,"
                + "user.user_first_name,user.user_last_name,user.user_phone_number,user.user_email"
                + " FROM feedback INNER JOIN user ON "
                + "feedback.customer_id = user.user_id ";

                stmt = con.createStatement();
                ResultSet rst = stmt.executeQuery(query);
                
                while (rst.next()) {
                    
//                        String serviceStatus = "";
//                        if (rst.getInt("get_service") == 0) {
//                            serviceStatus = "Due";
//                        } else if (rst.getInt("get_service") == 1) {
//                            serviceStatus = "Got";
//                        }

                        Map<Object, Object> individualFeedback = new HashMap<>();
                        
                        individualFeedback.put("customerId", rst.getInt("customer_id"));
                        individualFeedback.put("customerName", rst.getString("user_first_name") + " " + rst.getString("user_last_name"));
                        individualFeedback.put("phoneNumber", rst.getString("user_phone_number"));
                        individualFeedback.put("email", rst.getString("user_email"));
                        individualFeedback.put("feedback", rst.getString("feedback"));
                        individualFeedback.put("rating", rst.getInt("rating"));
                        
                        customerFeedback.add(individualFeedback);
                    }
                    Utility.closeDbConnection(con,rst, stmt);
                }
               catch (Exception e) {
                e.printStackTrace();
            }
            if (customerFeedback.size() > 0) {
        %>
        <div class="table-section bg-light mt-2">
            <table class="table mt-2">
                <thead>
                <tr>
                   
                    <th scope="col">Customer Id</th>
                    <th scope="col">Customer Name</th>
                    
                    <th scope="col">Phone Number</th>
                    <th scope="col">Email</th>
                    
                    <th scope="col">Feedback</th>
                    <th scope="col">Rating</th>
                    
                </tr>
                </thead>
                <tbody>
                <%
                    for (int i = 0; i < customerFeedback.size(); i++) {
                        Map<Object, Object> individualFeedback = customerFeedback.get(i);
                %>
                <tr>
                   <td><%= individualFeedback.get("customerId") %></td>
                    
                    <td><%= individualFeedback.get("customerName") %></td>
                    
                    <td><%= individualFeedback.get("phoneNumber") %></td>
                    <td scope="row"><%= individualFeedback.get("email") %></td>
                    
                    <td scope="row"><%= individualFeedback.get("feedback") %></td>
                    <td scope="row"><%= individualFeedback.get("rating") %></td>
                    
                </tr>
                <%
                    } 
                %>
                </tbody>
            </table>
        </div>
        <%
            } 
        %>
    </div>
</section>
        
    </body>
</html>
