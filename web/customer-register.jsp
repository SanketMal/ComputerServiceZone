<%-- 
    Document   : CustomerRegister
    Created on : 7 Aug, 2023, 9:15:33 AM
    Author     : Sanket Mal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
                    border: 2px solid ;
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
                <li><a class="nav-link scrollto active" href="./#hero">Home</a></li>
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
                        String message = request.getParameter("message");
                        if (message != null) {
                     %>
                     <h3 style="color:blue"><%= message %></h3>
                     <%
                        }
                    %>
                    
                    <form name="Customer-register" class="form" id="customer-register" action="./CustomerRegister" method="POST">
                        <div class="form-outline mb-2">
                       
                             <label class="form-label" for="form2Example1">First Name </label>
                             <input class="form-control" id="firstName" type="text" name="firstName"oninput="clearErrorMessage('messageForFirstName')">
                             <p id="messageForFirstName" style="color:red"></p>
                        </div>
                        <div class="form-outline mb-2">
                             <label class="form-label" for="form2Example1">Last Name </label>
                             <input class="form-control" id="lastName" type="text" name="lastName"oninput="clearErrorMessage('messageForLastName')">
                             <p id="messageForLastName"style="color:red" ></p>
                        </div>
                        <!-- Email input -->
                        <div class="form-outline mb-2">
                            <label class="form-label" for="form2Example1">Email address</label>
                            <input class="form-control" id="email" type="email" name="email"oninput="clearErrorMessage('messageForEmail')">
                            <p id="messageForEmail"style="color:red" ></p>
                        </div>
                        <div class="form-outline mb-2">
                            <label class="form-label" for="form2Example2">Phone Number</label>
                            <input class="form-control" id="phone" type="tel"name="phone"oninput="clearErrorMessage('messageForPhone')">
                            <p id="messageForPhone"style="color:red" ></p>
                        </div>
                        <!-- Password input -->
                        <div class="form-outline mb-2">
                            <label class="form-label" for="form2Example2">Password</label>
                            <input class="form-control" id="password" type="password" name="password"pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required oninput="clearErrorMessage('messageForPassword')"> 
                            <p id="messageForPassword"style="color:red" ></p>
  

                        </div><!-- 2 column grid layout for inline styling -->
                        <div class="form-outline mb-4">
                            <label class="form-label" for="form2Example2">Confirm Password</label>
                            <input class="form-control" id="cpassword" type="password"name="cpassword" required oninput="clearErrorMessage('messageForCpassword')">
                            <p id="messageForCpassword"style="color:red" ></p>
                        </div>
                        <div class="row mb-2">
                            <div class="col d-flex justify-content-center">
                                <!-- Checkbox -->
                                <div class="form-check">
                                    <input checked class="form-check-input" id="form2Example31" type="checkbox" value=""> <label class="form-check-label" for="form2Example31">Remember me</label>
                                </div>
                            </div>
                            
                        </div><!-- Submit button -->
                        <button class="btn btn-primary btn-block mb-4" type="submit" onclick="return formValidation();">Register</button> 
                        <button class="btn btn-primary btn-block mb-4" type="cancel">Cancel</button> 
                        <button class="btn btn-primary btn-block mb-4" type="reset">Reset</button> 
                        <!-- Register buttons -->
<!--                        <div class="text-center">
                            <p>Back to <a href="admin.jsp">admin login</a></p>
                            
                        </div>-->
                    </form>
                </div>
                
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
    
    <script type="text/javascript" src="assets/js/form-validation/customer-register.js"></script>
    
</html>
