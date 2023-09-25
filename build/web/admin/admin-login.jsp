<%-- 
    Document   : admin
    Created on : 3 Aug, 2023, 9:55:34 PM
    Author     : Sanket Mal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
        <link rel="icon" type="image/x-icon" href="../images/logo.png">
        
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="../assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="../assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="../assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="../assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="../assets/css/style.css" rel="stylesheet">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <h1 class="text-center mt-5 mb-5">Welcome to Computer Service Zone Administrator Portal</h1>
                <div class="col-md-6">
                    <image src="../images/welcome-to-the-admin-team.png">
                </div>
                <div class="col-md-6 mt-5">
                    
                    <%
                        String loginMessage = (String) session.getAttribute("admin-login-message");
                        if (loginMessage != null && loginMessage.equals("error")) {
                    %>
                    <h3>Please provide correct username and password.</h3>
                    <%   
                            session.removeAttribute("admin-login-message");
                        }
                    %>
                    
                   <form name="admin-login" id="admin-login" action="../AdminLogIn" method="POST">
        <!-- Email input -->
                        <div class="form-outline mb-4">
                            <label class="form-label" for="form2Example1">Email address</label>
                            <input class="form-control" id="email" type="email" name="email"oninput="clearErrorMessage('messageForEmail')"> 
                            <p id="messageForEmail" style="color:red"></p>
                        </div><!-- Password input -->
                        <div class="form-outline mb-4">
                            <label class="form-label" for="form2Example2">Password</label>
                            <input class="form-control" id="password" type="password" name="password"pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required oninput="clearErrorMessage('messageForPassword')"> 
                            <p id="messageForPassword" style="color:red"></p>
                        </div><!-- 2 column grid layout for inline styling -->
                        <div class="row mb-4">
                            <div class="col d-flex justify-content-center">
                                <!-- Checkbox -->
                <!--                                <div class="form-check">
                                    <input checked class="form-check-input" id="form2Example31" type="checkbox" value=""> 
                                    <label class="form-check-label" for="form2Example31">Remember me</label>
                                </div>-->
                            </div>
                            <div class="text-center">
                                <!-- Simple link -->
                                <a href="#!">Forgot password?</a>
                            </div>
                        </div><!-- Submit button -->

                        <button class="btn btn-primary btn-block mb-4 " type="submit"onclick="return formValidation();">Sign in</button> <!-- Register buttons -->

                        <div class="text-center">
                            <p>Not a member? <a href="admin-register.jsp">Register</a></p>

                        </div>
                   </form>
                </div>
                
            </div>
        </div>
        
    </body>
    <script type="text/javascript" src="../assets/js/form-validation/admin-login.js"></script>
</html>
