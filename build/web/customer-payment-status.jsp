<%-- 
    Document   : payment-status
    Created on : 11 Sep, 2023, 12:04:30 PM
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
                    <li class="nav-small-cap sidebar-item"><a class="sidebar-link" href="customer-issue.jsp"><i class="bi bi-pen"></i>Write Issue</a></li>
                    <!--<li class="nav-small-cap sidebar-item"><a class="sidebar-link" href="service-booking.jsp"><i class="bi bi-screwdriver"></i>Booking Service</a></li>-->
                    <li class="nav-small-cap sidebar-item"><a class="sidebar-link active" href="customer-payment-status.jsp"><i class="bi bi-cash"></i>Payment Status</a></li>
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
              </header>
    </body>
</html>
