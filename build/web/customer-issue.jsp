<%-- 
    Document   : customer-issue
    Created on : 11 Sep, 2023, 12:02:27 PM
    Author     : Sanket Mal
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.DatabaseConnection"%>
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
                    <!--<li class="nav-small-cap sidebar-item"><a class="sidebar-link" href="service-booking.jsp"><i class="bi bi-screwdriver"></i>Booking Service</a></li>-->
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
            
        <!-- Sidebar End -->

        <!-- Main wrapper -->
        <div class="body-wrapper">
            <!-- Header Start -->
            <header class="app-header">
                <nav class="navbar navbar-expand-lg navbar-light">
                  <div class="navbar-collapse justify-content-end px-0" id="navbarNav">
                    <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
                        <li><a class="nav-link scrollto active" href="index.jsp">Home</a></li>
                        <li><a class="nav-link scrollto" href="./#about">About Us</a></li>
                        <li><a class="nav-link scrollto" href="./#services">Services</a></li>
<!--                        <li><a class="nav-link scrollto" href="./#portfolio">Portfolio</a></li>-->
                        <!--<li><a class="nav-link scrollto" href="#team">Team</a></li>-->
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
              </header><!-- Header end -->
            <!-- Header end -->

            <div class="container-fluid">
                <div class="row">
                    
                    <form action="CustomerIssue" id="customerIssue" method="POST" class="row">
                        <div class="row">
                                <!-- First row content -->
                            <div class="form-group mb-3 col-md-6">
                                    <div class="row">
                                            <div class="col-md-5">
                                                    <label for="deviceType" class="form-label">Device Type</label>
                                            </div>
                                            <div class="col-md-7">
                                                    <select class="form-select" aria-label="Default select example" id="deviceTypeName" name="deviceId" oninput="clearErrorMessage('messageForDeviceType')">
                                                            <option selected value="">Select Device Type</option>
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
                                                            <option value="<%= rst.getInt(1)%>"><%= rst.getString(2) %></option>
                                                    <%
                                                                    }
//                                            Utility.closeDbConnection(con, rst, statement);
                                                            } catch (Exception e) {
                                                                    e.printStackTrace();
                                                            }
                                                    %>
                                                    </select>
                                            </div>
                                    </div>                                                        
                                    <p id="messageForDeviceType" style="color:red"></p>
                            </div>
                            <div class="form-group mb-3 col-md-6">
                                    <div class="row">
                                            <div class="col-md-5">
                                                    <label for="deviceMode" class="form-label">Problem Type</label>
                                            </div>
                                            <div class="col-md-7">
                                                    <select class="form-select" aria-label="Default select example" id="subDeviceTypeName" name="subDeviceId" oninput="clearErrorMessage('messageForSubDeviceType')">
                                                            <option selected value="">Select Problem in</option>
                                                    <%
//                                        Connection con1 = null;
//                                        Statement statement1 = null;

                                                            try {
                                                                    con = DatabaseConnection.getConnection();

                                                                    String query = "SELECT * from sub_device_type WHERE sub_device_active =1;";

                                                                    statement = con.createStatement();
                                                                    ResultSet rst = statement.executeQuery(query);

                                                                    while(rst.next()) {
                                                    %>
                                                            <option value="<%= rst.getInt(1) %>"><%= rst.getString(2) %></option>
                                                    <%
                                                                    }
//                                            Utility.closeDbConnection(con, rst, statement);
                                                            } catch (Exception e) {
                                                                    e.printStackTrace();
                                                            }
                                                    %>
                                                    </select>
                                            </div>
                                    </div>                                                        
                                    <p id="messageForSubDeviceType" style="color:red"></p>
                            </div>
                        </div>
                        <div class="row">
                    <!-- Second row content -->
                    <!-- ... Your form inputs and labels ... -->
                                <div class="form-group mb-3 col-md-6">
                                            <div class="row">
                                                    <div class="col-md-5">
                                                            <label for="deviceOSType" class="form-label">Operating System</label>
                                                    </div>
                                                    <div class="col-md-7">
                                                            <select class="form-select" aria-label="Default select example" id="deviceOSTypeName" name="deviceOSId" oninput="clearErrorMessage('messageForDeviceOSType')">
                                                                    <option selected value="">Select OS Type</option>
                                                            <%
    //                                        Connection con1 = null;
    //                                        Statement statement1 = null;

                                                                    try {
                                                                            con = DatabaseConnection.getConnection();

                                                                            String query = "SELECT * from device_os WHERE device_os_active =1;";

                                                                            statement = con.createStatement();
                                                                            ResultSet rst = statement.executeQuery(query);

                                                                            while(rst.next()) {
                                                            %>
                                                                    <option value="<%= rst.getInt(1) %>"><%= rst.getString(2) %></option>
                                                            <%
                                                                            }
    //                                            Utility.closeDbConnection(con, rst, statement);
                                                                    } catch (Exception e) {
                                                                            e.printStackTrace();
                                                                    }
                                                            %>
                                                            </select>
                                                    </div>
                                            </div>                                                        
                                            <p id="messageForDeviceOSType" style="color:red"></p>
                                    </div>
                                    <div class="form-group mb-3 col-md-6">
                                            <div class="row">
                                                    <div class="col-md-5">
                                                            <label for="defectName" class="col-form-label">Defect Part</label>
                                                    </div>
                                                    <div class="col-md-7">
                                                            <select class="form-select" aria-label="Default select example" id="defectName" name="defectId" oninput="clearErrorMessage('messageForDefectName')">
                                                                    <option selected value="">Select Defect Part</option>
                                                            </select>
                                                    </div><!-- comment -->
                                            </div><!-- comment -->
                                            <p id="messageForDefectName" style="color:red"></p>
                                    </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <label for="defectDetails" class="col-form-label">Brief description of the defect</label>
                                </div>
                                <div class="col-md-9">
                                    <textarea id="defectDetails" name="defectdetails" class="form-control defectDetails" aria-describedby="passwordHelpInline" oninput="clearErrorMessage('messageForDefectDetails')"> </textarea>
                                </div>
                                <p id="messageForDefectDetails" style="color:red"></p>
                            </div>
                            <div class="row">
                                <div class="col-md-3">
                                    <label for="addAdress" class="col-form-label">Add Address</label>
                                </div>
                                <div class="col-md-9">
                                    <input type="text" id="address" name="address" class="form-control address" aria-describedby="passwordHelpInline" oninput="clearErrorMessage('messageForAddress')"> 
                                </div>
                                <p id="messageForAddress" style="color:red"></p>
                            </div>                                
                            <div class="row">
                                <input type="hidden" id="customerId" name="customerId" value="<%= customerId%>">
                            </div>  
                            <div>
                                <input type="hidden" id="submissionDate" name="submissionDate" value="">
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <div class="row">
                                        <div class="col-md-6">
                                                <button class="btn btn-primary mt-3" type="submit" onclick="return formValidation();">Submit</button>
                                        </div>
                                        <div class="col-md-6">
                                                <button class="btn btn-primary mt-3" type="reset" id="formReset">Reset</button>
                                         </div>
                                    </div>
                                </div>
                                
                            </div>
                    </form>
               
                </div>
            </div>
        </div>
    </div>
    <!-- comment -->    
        <!-- page-wrapper wrapper end -->
    
</body>
    <script src="assets/js/jquery.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
    <script src="assets/js/customer/sidebarmenu.js"></script>
    <script src="assets/js/customer/app.min.js"></script>
    <script src="assets/js/customer/apexcharts.min.js"></script>
    <script src="assets/js/customer/simplebar.js"></script>
    <script src="assets/js/customer/dashboard.js"></script>
    <script src="assets/js/customer/customer-issue.js"></script>
</html>
