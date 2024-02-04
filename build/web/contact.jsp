<%-- 
    Document   : contact
    Created on : 11 Sep, 2023, 12:07:24 PM
    Author     : Sanket Mal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
    Integer customerId = (Integer) session.getAttribute("customerId");
    
    if (customerId == null) {
        response.sendRedirect("customer-login-page.jsp");
    }
%>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/x-icon" href="images/logo.png">
        <title>Contact us</title>
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
                    <!--<li class="nav-small-cap sidebar-item"><a class="sidebar-link" href="customer-payment-status.jsp"><i class="bi bi-cash"></i>Payment Status</a></li>-->
                    <li class="nav-small-cap sidebar-item"><a class="sidebar-link active" href="contact.jsp"><i class="bi bi-telephone"></i>Contact</a></li>
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
              <div class="container-fluid">
                  <section id="contact" class="contact section-bg">
            <div class="container" data-aos="fade-up">

              <div class="row">
                <div class="col-lg-6">
                  <div class="info-box mb-4">
                    <i class="bx bx-map"></i>
                    <h3>Our Address</h3>
                    <p>MFRJ+VGW, Badu Rd, Madhyamgram, Kolkata, West Bengal 700129</p>
                  </div>
                </div>

                <div class="col-lg-3 col-md-6">
                  <div class="info-box  mb-4">
                    <i class="bx bx-envelope"></i>
                    <h3>Email Us</h3>
                    <p>contact@example.com</p>
                  </div>
                </div>

                <div class="col-lg-3 col-md-6">
                  <div class="info-box  mb-4">
                    <i class="bx bx-phone-call"></i>
                    <h3>Call Us</h3>
                    <p>+1 5589 55488 55</p>
                  </div>
                </div>

              </div>

              <div class="row">

                <div class="col-lg-6 ">

                  <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3680.9681210400386!2d88.4787375748414!3d22.69223062857606!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39f8a1e24db25ad7%3A0x5d936ba734cbbd96!2sCOMPUTER%20SERVICE%20ZONE!5e0!3m2!1sen!2sin!4v1696388698428!5m2!1sen!2sin"
                    width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

                </div>

                  <div class="col-lg-4" style="margin-left: 10%">
                    <form action="./ContactMessage" method="POST"id="contact-form">
                      <div class="row">
                        <div class="form-group mt-3">
                          <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" oninput="clearErrorMessage('messageForName')">

                            <p id="messageForName"style="color:red" ></p>
                        </div>
                        <div class="form-group mt-3">
                          <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" oninput="clearErrorMessage('messageForEmail')">
                            <p id="messageForEmail"style="color:red" ></p>
                        </div>
                      </div>
                      <div class="form-group mt-3">
                        <input type="text" class="form-control" name="phone" id="phone" placeholder="Your phone number" oninput="clearErrorMessage('messageForPhone')">
                            <p id="messageForPhone"style="color:red" ></p>
                      </div>
                      <div class="form-group mt-3">
                        <textarea class="form-control" name="message" id="message" placeholder="Message" oninput="clearErrorMessage('messageForMessage')"></textarea>
                            <p id="messageForMessage"style="color:red" ></p>
                      </div>
                      <div class="text-center">
                        <button class="btn btn-primary btn-block mb-4" type="submit" onclick="return formValidation();">Submit</button>                       </div>
                    </form>
<!--                    <div class="thank-you-message" style="display: none;">
                      Your message has been sent. Thank you!
                    </div>-->
                    <%
                        String message = request.getParameter("message");
                        if (message != null) {
                     %>
                     <h3 style="color: blue"><%= message %></h3>
                     <%
                        }
                    %>
                  </div>

<!--                  <script>
                  document.addEventListener("DOMContentLoaded", function() {
                    const form = document.getElementById("contact-form");
                    const thankYouMessage = document.querySelector(".thank-you-message");

                    form.addEventListener("submit", function(event) {
                      event.preventDefault(); // Prevent the default form submission

                      // Here, you can optionally use AJAX to submit the form data to the server.
                      // If you don't need to submit to a server, you can skip this part.

                      // Display the "Thank you" message and hide the form
                      form.style.display = "none";
                      thankYouMessage.style.display = "block";
                    });
                  });
                  </script>-->


              </div>

            </div>
          </section>
        </div>
              
    </body>
    <script type="text/javascript" src="assets/js/customer/contact.js"></script>
</html>
