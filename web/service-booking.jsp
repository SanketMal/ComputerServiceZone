<%-- 
    Document   : service-booking
    Created on : 11 Sep, 2023, 12:03:41 PM
    Author     : Sanket Mal
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.DatabaseConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
        <title>Customer Dashboard</title>
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/customer-styles.min.css" />
        <link href="assets/css/font-style.css" rel="stylesheet">
        <link href="assets/css/service-booking.css" rel="stylesheet">
       
    </head>
    <body>
        <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
            data-sidebar-position="fixed" data-header-position="fixed">
            <!-- Sidebar Start -->
            <aside class="left-sidebar">
              <!-- Sidebar scroll-->
              <div>
                <div class="brand-logo d-flex align-items-center justify-content-between">
                  <a href="index.jsp" class="text-nowrap logo-img">
                      <img src="images/logo.png" width="180" alt="" />
                  </a>
                  <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
                    <i class="ti ti-x fs-8"></i>
                  </div>
                </div>
                <!-- Sidebar navigation-->
                <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
                  <ul id="sidebarnav">
                    <!--<li class="nav-small-cap">
                      <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                      <span class="hide-menu">Home</span>
                    </li>-->
                    <li class="nav-small-cap sidebar-item">
                      <a class="sidebar-link" href="customer-dashboard.jsp" aria-expanded="false">
                        <span>
                          <i class="ti ti-layout-dashboard"></i>
                        </span>
                        <span class="hide-menu">Dashboard</span>
                      </a>
                    </li>
                    
                    <!--<li class="nav-small-cap sidebar-item"><a class="sidebar-link" href="index.jsp"><i class="bi bi-house-door"></i>Home</a></li>-->
                    <li class="nav-small-cap sidebar-item"><a class="sidebar-link" href="customer-profile.jsp"><i class="bi bi-person-circle"></i>profile</a></li>
                    <li class="nav-small-cap sidebar-item"><a class="sidebar-link active" href="customer-issue.jsp"><i class="bi bi-pen"></i>Write Issue</a></li>
                    <!--<li class="nav-small-cap sidebar-item"><a class="sidebar-link active" href="service-booking.jsp"><i class="bi bi-screwdriver"></i>Booking Service</a></li>-->
                    <!--<li class="nav-small-cap sidebar-item"><a class="sidebar-link" href="customer-payment-status.jsp"><i class="bi bi-cash"></i>Payment Status</a></li>-->
                    <li class="nav-small-cap sidebar-item"><a class="sidebar-link" href="contact.jsp"><i class="bi bi-telephone"></i>Contact</a></li>
                    <li class="nav-small-cap sidebar-item"><a class="sidebar-link" href="customer-feedback.jsp"><i class="bi bi-chat-quote"></i>Feedback</a></li>
                    <li class="nav-small-cap sidebar-item"><a class="sidebar-link" href="customer-logout.jsp"><i class="bi bi-box-arrow-left"></i>Logout</a></li>
                  </ul>
                </nav>
                <!-- End Sidebar navigation -->
              </div>
              <!-- End Sidebar scroll-->
            </aside>
            <!--  Sidebar End -->
            
            <!--  Main wrapper -->
            <div class="body-wrapper">
              <!--  Header Start -->
              <header class="app-header">
                <nav class="navbar navbar-expand-lg navbar-light">
                  <div class="navbar-collapse justify-content-end px-0" id="navbarNav">
                    <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
                        <li><a class="nav-link scrollto active" href="index.jsp">Home</a></li>
                        <li><a class="nav-link scrollto" href="./#about">About Us</a></li>
                        <li><a class="nav-link scrollto" href="./#services">Services</a></li>

                        <li><a class="nav-link scrollto" href="./#contact">Contact</a></li>
                        <li class="nav-item dropdown">
                          <a class="nav-link nav-icon-hover" href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown"
                            aria-expanded="false">
                              <img src="images/user-1.jpg" alt="" width="35" height="35" class="rounded-circle">
                          </a>
                          <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="drop2">
                            <div class="message-body">
                              <a href="customer-profile.jsp" class="d-flex align-items-center gap-2 dropdown-item">
                                <i class="ti ti-user fs-6"></i>
                                <p class="mb-0 fs-3"> My Profile </p>
                              </a>
                             
                              <a href="customer-logout.jsp" class="btn btn-outline-primary mx-3 mt-2 d-block">Logout</a>
                            </div>
                          </div>
                        </li>
                    </ul>
                  </div>
                </nav>
              </header>
              <div class="container-fluid">
<!--                  <h1>COMPUTER SERVICE ZONE</h1>
                  <h2>Your Trusted Computer and Laptop Repair Service</h2>
                  <h3>We are always ready to fix your computer problems !</h3>-->
                  
                <%  
                    int defectId = (int) request.getAttribute("defectId");
                    int approxMinAmount = (int) request.getAttribute("approxMinAmount");
                     int approxMaxAmount = (int) request.getAttribute("approxMaxAmount");
                    
                    Connection con = null;
                    Statement stmt = null;
                    try {
                        con = DatabaseConnection.getConnection();
                        int userId = (int) session.getAttribute("customerId");
                        System.out.println("User Id: " + userId);
                        System.out.println("Defect Id: " + defectId);
                        System.out.println("approxMinAmount: " + approxMinAmount);
                        System.out.println("approxMaxAmount: " + approxMaxAmount);
//                        String query = "SELECT * FROM `customer_request_problem` WHERE request_customer_id = " + userId
//                                + " AND request_defect_id =" + defectId + " AND get_service = false";
//                        stmt = con.createStatement();
//                        ResultSet rst = stmt.executeQuery(query);
                        
                            
                           
                        out.println("<h3>The cost to fix your problem can be roughly between " + approxMinAmount + " to " + approxMaxAmount + "</h3>");
                        out.println("<h3>Our service man will reach you with in two days. </h3>");
                    } catch (Exception e) {
                        out.println("Error: " + e.getMessage());
                        e.printStackTrace(); // Print the full stack trace for debugging
                    } finally {
                        // Close database resources (connection and statement) in a finally block
                        if (stmt != null) {
                            try {
                                stmt.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                        if (con != null) {
                            try {
                                con.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                    }
                %>
                <!-- Service booking confirmation form -->
                <form class="form" action="ConfirmServiceBooking" method="post">
                       <input type="hidden" name="defectId" value="<%= defectId %>" />
                        <input type="hidden" name="approxMinAmount" value="<%= approxMinAmount %>" />
                        <input type="hidden" name="approxMaxAmount" value="<%= approxMaxAmount %>" />
                        <input type="hidden" name="customerId" value="<%= customerId %>" />
                       <div id="tytle">
                           <h4>Confirm Service Booking</h4>
                       </div><!-- comment -->
                       <div>
                           <p>To confirm booking click on yes and submit :</p>
                       </div>
                        
                    <div class="mb-3">
                       
                        <div class="form-check form-check-inline">
                            <input type="radio" id="confirmationYes" name="confirmation" value="Yes" class="form-check-input" required>
                            <label for="confirmationYes" class="form-check-label">Yes</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input type="radio" id="confirmationNo" name="confirmation" value="No" class="form-check-input" required>
                            <label for="confirmationNo" class="form-check-label">No</label>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
<!--                 Thanks message 
                <div id="thanksMessage" style="display: none;">
                    <p>Thanks for confirming your service booking!</p>
                </div>-->


              </div>
            </div>
    </body>
    <script src="assets/js/jquery.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
    <script src="assets/js/customer/sidebarmenu.js"></script>
    <script src="assets/js/customer/app.min.js"></script>
    <script src="assets/js/customer/apexcharts.min.js"></script>
    <script src="assets/js/customer/simplebar.js"></script>
    <script src="assets/js/customer/service-booking.js"></script>
    
</html>
