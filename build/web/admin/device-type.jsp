<%-- 
    Document   : device-type
    Created on : 20 Aug, 2023, 9:00:49 PM
    Author     : Sanket Mal
--%>

<%@page import="util.Utility"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.DatabaseConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <%
        Integer adminId = (Integer) session.getAttribute("adminId");
        //out.print(adminId);
        if (adminId == null) {
            response.sendRedirect("admin-login.jsp");
        }
    %>

        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/x-icon" href="../images/logo.png">
        <title>Device Type</title>
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
                                <li class="nav-item active">
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
        
        <section class="container">
            <div class="row">
                <div class="add-section bg-light mt-2 mb-2">
                    <form action="../AddDeviceType" method="POST">
                        <div class="form-group">
                            <label for="deviceType">Device Type Name</label> 
                            <input class="form-control deviceTypeName" id="deviceTypeName" placeholder="Enter device type name" 
                                   type="text" name="deviceType" oninput="clearErrorMessage('messageForDeviceType')"> 
                            <p id="messageForDeviceType" style="color:red"></p>
                        </div>
                        <!-- For Edit -->
                        <input type="hidden" name="deviceId" class="device-id" value="0">
                        <input type="hidden" name="formAction" class="form-action" value="save">
                        <!-- button -->
                        <button class="btn btn-primary mt-3" type="submit" onclick="return formValidation();">Submit</button>
                        <button class="btn btn-primary mt-3" type="reset" id="formReset">Reset</button>
                    </form>
                </div>

                <div class="table-section bg-light mt-2">
                    <table class="table mt-2">
                    <thead>
                        <tr>
                            <th scope="col">Device ID</th>
                            <th scope="col">Device Name</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <%
                            Connection con = null;
                            Statement statement = null;
                            
                            try {
                                con = DatabaseConnection.getConnection();
                                
                                String query = "SELECT * FROM device_type WHERE device_active = 1;";
                                
                                statement = con.createStatement();
                                ResultSet rst = statement.executeQuery(query);
                                
                                while(rst.next()) {
                        %>
                            <tr>
                                <td scope="row"><%= rst.getInt(1) %></td>
                                <td><%= rst.getString(2) %></td>
                                <td>
                                    <a href="javascript:void(0)" data-toggle="tooltip" title="Edit" data-id="<%= rst.getInt(1) %>" 
                                       data-name="<%= rst.getString(2) %>" class="dataEdit"><i class="bi bi-pen"></i></a> | 
                                    <a href="javascript:void(0)" data-bs-toggle="modal" title="Delete" data-bs-target="#deleteModal"
                                       data-deleteid="<%= rst.getInt(1) %>" class="dataDelete"><i class="bi bi-trash3"></i></a>
                                </td>
                            </tr>
                        <%
                                }
                                Utility.closeDbConnection(con, rst, statement);
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                                                
                    </tbody>
                </table>
                </div>
            </div>
        </section>
                        
        <!-- Delete Modal -->
        <div aria-hidden="true" aria-labelledby="exampleModalLabel" class="modal fade" id="deleteModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Delete Modal</h5><button aria-label="Close" class="btn-close" data-bs-dismiss="modal" type="button"></button>
                    </div>
                    <div class="modal-body">
                        
                        Are you sure want to delete this?
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" data-bs-dismiss="modal" type="button">Close</button> 
                        
                        <form action="../AddDeviceType" method="POST">
                            <input type="hidden" name="deviceId" class="delete-device-id">
                            <input type="hidden" name="formAction" class="form-action" value="delete">
                            <button class="btn btn-danger" type="submit">Delete</button>
                        </form>
                        
                    </div>
                </div>
            </div>
        </div>
        
    </body> 
    <!-- Vendor JS Files -->
    <script src="../assets/js/jquery.js"></script>
    <script src="../assets/vendor/purecounter/purecounter_vanilla.js"></script>
    <script src="../assets/vendor/aos/aos.js"></script>
    <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="../assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="../assets/vendor/swiper/swiper-bundle.min.js"></script>
    
    <script src="../assets/js/admin/device-type.js"></script>
    
</html>
