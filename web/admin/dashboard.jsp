<%-- 
    Document   : dashboard
    Created on : 8 Aug, 2023, 8:38:40 PM
    Author     : Sanket Mal
--%>

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
        <title>Admin Dashboard</title>
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
        <div class="flex-container1">
            <div class ="flex-box">
                <a class="link-light" href="device-type.jsp">Device Type</a>
            </div>
            <div class ="flex-box">
               <a class="link-light" href="sub-device-type.jsp">Sub Device Type</a>
            </div>
            <div class ="flex-box">
                <a class="link-light" href="device-os-type.jsp">Device OS Type</a>
            </div>
            <div class ="flex-box">
                <a class="link-light" href="common-defect.jsp">Common Defect</a>
            </div>
            
        </div>
        <div class="flex-container2">
            <div class ="flex-box">
               <a class="link-light" href="customer-request.jsp">Customer Request</a>

            </div>
            <div class ="flex-box">
                 <a class="link-light" href="interested-person.jsp">Interested Person</a>
            </div>
            <div class ="flex-box">
               <a class="link-light" href="customer-feedback.jsp">Customer Feedback</a>
            </div>
            
            <div class ="flex-box">
                 <a class="link-light" href="admin-profile.jsp">Admin Profile</a>
            </div>
        </div>
    </body>
    <!-- Vendor JS Files -->
  <script src="../assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="../assets/vendor/aos/aos.js"></script>
  <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="../assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="../assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="../assets/vendor/php-email-form/validate.js"></script>
</html>
