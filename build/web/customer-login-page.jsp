<%-- 
    Document   : CustomerRegister
    Created on : 7 Aug, 2023, 9:15:33 AM
    Author     : Sanket Mal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
        Integer customerId = (Integer) session.getAttribute("customerId");
        //out.print(adminId);
        if (customerId != null) {
            response.sendRedirect("customer-dashboard.jsp");
        }
    %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="icon" type="image/x-icon" href="images/logo.png">
        
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet"><!--

         Vendor CSS Files 
-->        <link href="assets/vendor/aos/aos.css" rel="stylesheet"><!--
-->         <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"><!--<!--
-->        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"><!--
-->        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet"><!--
-->        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet"><!--
-->        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">
        <style>
            .form{
                text-align:left;
                position: center;
            }
            .col-md-6{
                margin-top: 5%;
            }
            #hero .btn-get-started {
                    font-size: 36px;
                    display: inline-block;
                    padding: 4px 0;
                    border-radius: 50px;
                    transition: 0.3s ease-in-out;
                    margin: 10px;
                    width: 64px;
                    height: 64px;
                    text-align: center;
                    border: 2px solid white;
                    color: white;
}

    
    </style>
    </head>
    <body>
        
        <!-- ======= Header ======= -->
        <header id="header" class="fixed-top header-transparent">
          <div class="container d-flex align-items-center justify-content-between position-relative">

            <div class="logo">
              <h1 class="text-light"><a href="index.jsp"><span><img src="images/logo.png" alt="csz"></span></a></h1>
              <!-- Uncomment below if you prefer to use an image logo -->
              <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
            </div>

            <nav id="navbar" class="navbar">
              <ul>
                <li><a class="nav-link scrollto active" href="index.jsp">Home</a></li>
                <li><a class="nav-link scrollto" href="./#about">About Us</a></li>
                <li><a class="nav-link scrollto" href="./#services">Services</a></li>
                <li><a class="nav-link scrollto" href="./#portfolio">Portfolio</a></li>
                <!--<li><a class="nav-link scrollto" href="#team">Team</a></li>-->
                <li><a class="nav-link scrollto" href="./#contact">Contact</a></li>
                <li class="dropdown"><a href="#"><i class="bi bi-people-fill"></i> <i class="bi bi-chevron-down"></i></a>
                  <ul>
                      <li><a href="customer-register.jsp">Register</a></li>
                    <li><a href="customer-login-page.jsp">Log in</a></li>

                  </ul>
                </li>
              </ul>
              <i class="bi bi-list mobile-nav-toggle"></i>
            </nav><!-- .navbar -->

          </div>
        </header>
        <!--End Header--> 

        <!-- ======= Hero Section ======= -->
        <section id="hero" style="background: url(./images/background.jpg); background-size: cover; height: 50vh;">
          <div class="hero-container" data-aos="fade-up">
            <h1>Welcome to computer service zone</h1>
            <h2 >We are always ready to fix your computer problems !</h2>
            <a href="#main" class="btn-get-started scrollto"><i class="bx bx-chevrons-down"></i></a>
          </div>
        </section><!-- End Hero -->
        
    <main id="main">
        <div class="container mt-4 p-5">
<!--            <div class="row">
                <div class="col-md-6">
                    <image src="images/register-page.png" height="73%" width="100%">
                    
                </div>-->
                <div class="mx-auto w-50">
                    <%
                        String loginMessage = (String) session.getAttribute("customer-login-message");
                        if (loginMessage != null && loginMessage.equals("error")) {
                    %>
                    <h3 style="color:red">Please provide correct username and password.</h3>
                    <%   
                            session.removeAttribute("customer-login-message");
                        }
                    %>
                    
                    <form name="Customer-login" class="form"id="customer-login" action="CustomerLogin" method="POST" style="text-align:left">
                      
                        <!-- Email input -->
                        <div class="form-outline mb-2">
                            <label class="form-label" for="form2Example1">Email address</label>
                            <input class="form-control" id="email" type="email" name="email"oninput="clearErrorMessage('messageForEmail')">
                            <p id="messageForEmail"style="color:red" ></p>
                        </div>
                    
                        <!-- Password input -->
                        <div class="form-outline mb-2">
                            <label class="form-label" for="form2Example2">Password</label>
                            <input class="form-control" id="password" type="password" name="password"pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required oninput="clearErrorMessage('messageForPassword')"> 
                            <p id="messageForPassword"style="color:red" ></p>
  

                        </div><!-- 2 column grid layout for inline styling -->

                        
                        <div class="mx-auto w-50">
                        <button class="btn btn-primary btn-block mb-4" type="submit" onclick="return formValidation();">Login</button> 
                        <button class="btn btn-primary btn-block mb-4" type="cancel">Cancel</button> 
                        <button class="btn btn-primary btn-block mb-4" type="reset">Reset</button> 
                        </div>
                        
                    </form>
                </div>
                
            </div>
        
    </main>   

    </body>
    
    <!-- Vendor JS Files -->
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
    
    <script type="text/javascript" src="assets/js/form-validation/customer-login.js"></script>
    
</html>
