<%-- 
    Document   : interested-person
    Created on : 4 Oct, 2023, 9:23:50 AM
    Author     : Sanket Mal
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="util.Utility"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.DatabaseConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

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
        <title>Interested Person</title>
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
                                <li class="nav-item">
                                    <a class="nav-link" href="sub-device-type.jsp">Problem Type</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="device-os-type.jsp">Device OS Type</a>
                                </li>
                                <li class="nav-item ">
                                    <a class="nav-link" href="common-defect.jsp">Common Defect</a>
                                </li>
                                <li class="nav-item ">
                                    <a class="nav-link" href="customer-request.jsp">Customer Request</a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link" href="interested-person.jsp">Interested Person</a>
                                </li>
                                <li class="nav-item ">
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
         <!-- Header End -->
         <% 
             List<Map<Object , Object>> InterestdPerson = new ArrayList<>();
             Connection con = null;
             Statement stmt = null;
             try{
                con = DatabaseConnection.getConnection();
                //System.out.println(adminId);
                String query = "SELECT * FROM `interested_person`;";
                PreparedStatement pstmt = con.prepareStatement(query);
                ResultSet rst = pstmt.executeQuery();

                while(rst.next()) {
                     
                    Map<Object , Object> individualPerson = new HashMap<>();
                    String conversationStatus ="";
                    individualPerson.put("id", rst.getInt("id"));
                    individualPerson.put("name", rst.getString("name"));
                    individualPerson.put("email", rst.getString("email"));
                    individualPerson.put("phone", rst.getString("phone"));
                    individualPerson.put("message", rst.getString("message"));
                    individualPerson.put("action", rst.getInt("action"));
                    if(rst.getInt("action")== 0){
                        conversationStatus = "Pending";
                     }
                     else if(rst.getInt("action")== 1){
                        conversationStatus = "Completed";
                    }
                    individualPerson.put("status", conversationStatus);
                    InterestdPerson.add(individualPerson);
                }
                Utility.closeDbConnection(con,rst, pstmt);
             }catch(Exception e){
                e.printStackTrace();
             }
         
         %>
         <div class="container-fluid">
<!--                     Row 1 
                    <div class="row">
                        <div class="col-lg-12">
                            <h3>Interested Person</h3>
                        </div>
                    </div>-->

                    <div class="table-section bg-light mt-2">
                    <table class="table mt-2">
                        <thead>
                            <tr>
                                <th scope="col">Name</th>
                                <th scope="col">Email</th>
                                <th scope="col">Phone</th>

                                <th scope="col">Message</th>
                                <th scope="col">Conversation Status</th>
                                <th scope="col"></th>
                           
                               
                            </tr>
                        </thead>
                        <tbody>
                        <%
                        for (int i = 0; i < InterestdPerson.size(); i++) {
                            Map<Object, Object> individualPerson = InterestdPerson.get(i);
                           
                        %>
                            <tr>
                                <td scope="row"><%=  individualPerson .get("name") %></td>
                                <td><%= individualPerson .get("email")  %></td>
                                <td><%= individualPerson .get("phone")  %></td>
                                <td><%= individualPerson .get("message")  %></td>
                                <td><%= individualPerson .get("status")  %></td>
                                <td>
                                    <!-- Update Service Status Form -->
                                    <form class="update-conversation-status-form" action="../UpdateConversationStatus" method="POST">
                                        <input type="hidden" name="id" value="<%= individualPerson.get("id") %>">
                                        <input type="hidden" name="currentStatus" value="<%= individualPerson.get("action") %>">
                                        <button type="submit" class="btn btn-success">Update </button>
                                    </form>
                                </td>
  
                                
                               
                            </tr>
                        <%
                        }
                        %>
                        </tbody>
                    </table>
                </div>
                    
<!--                     <div class="row">
                        <div class="col-lg-4 d-flex align-items-stretch">

                        </div>
                        <div class="col-lg-8 d-flex align-items-stretch">

                        </div>
                    </div>-->
                </div>
    </body>
</html>
