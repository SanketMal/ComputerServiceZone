<%-- 
    Document   : customer-dashboard
    Created on : 17 Aug, 2023, 1:24:51 AM
    Author     : Sanket Mal
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.Utility"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
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
        <link href="assets/css/customer-dashboard.css" rel="stylesheet">
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
                      <a class="sidebar-link active" href="customer-dashboard.jsp" aria-expanded="false">
                        <span>
                          <i class="ti ti-layout-dashboard"></i>
                        </span>
                        <span class="hide-menu">Dashboard</span>
                      </a>
                    </li>
                    
<!--                    <li class="nav-small-cap sidebar-item"><a class="sidebar-link" href="index.jsp"><i class="bi bi-house-door"></i>Home</a></li>-->
                    <li class="nav-small-cap sidebar-item"><a class="sidebar-link" href="customer-profile.jsp"><i class="bi bi-person-circle"></i>profile</a></li>
                    <li class="nav-small-cap sidebar-item"><a class="sidebar-link" href="customer-issue.jsp"><i class="bi bi-pen"></i>Write Issue</a></li>
                    
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
              <!--  Header End -->
<!--              <div class="container-fluid">
                  Row 1 
                <div class="row">
                    <div>
                          <h3>Order Details</h3>
                      </div>
                  <div class="col-lg-12 d-flex align-items-strech">
                       
                      <div class="row">
                          <div class="form-group mb-3 col-md-12">
                              <div class="row">
                                <div class="col-md-3">
                                  <p class="small text-muted mb-1">Order Id</p>
                                  <p>10 April 2021</p>
                                </div>
                                <div class="col-md-3">
                                  <p class="small text-muted mb-1">Order Date</p>
                                  <p>012j1gvs356c</p>
                                </div>
                                <div class="col-md-3">
                                  <p class="small text-muted mb-1">Expected Fix Date</p>
                                  <p>012j1gvs356c</p>
                                </div>
                                <div class="col-md-3">
                                  <p class="small text-muted mb-1">Approx amount</p>
                                  <p>012j1gvs356c</p>
                                </div>
                                  
                            </div>
                          </div>
                      </div>
                
                  </div>
                  
                </div>
               
                
                
              </div>-->
              <%
                    List<Map<Object , Object>> customerIssue = new ArrayList<>();
//                    Set<Integer> orederId = new HashSet<>();
//                    Set<Integer> minAmount = new HashSet<>();
//                    Set<Integer> maxAmount = new HashSet<>();
//                    Set<Integer> service = new HashSet<>();


                    Connection con = null;
                    Statement statement = null;

                    try {
                            con = DatabaseConnection.getConnection();
                            System.out.println(customerId);
                            String query = "SELECT * FROM `customer_request_problem` WHERE request_customer_id = ? AND request_confirm = 1;";
                            PreparedStatement pstmt = con.prepareStatement(query);
                            pstmt.setInt(1, customerId); 
                            ResultSet rst = pstmt.executeQuery();

                            while(rst.next()) {
                            String serviceStatus = "" ;
                            if(rst.getInt("get_service")==0){
                                serviceStatus = "Due";
                            }
                            else if(rst.getInt("get_service")==1){
                                    serviceStatus="Got";
                            }
                            Map<Object , Object> individualIssue = new HashMap<>();
                            individualIssue.put("orderId", rst.getInt("request_id"));
                            individualIssue.put("orderDate", rst.getString("request_date"));
                            individualIssue.put("orderFixExpectedDate", rst.getString("request_fix_expected_date"));
                            individualIssue.put("minAmount", rst.getInt("request_approx_min_amount"));
                            individualIssue.put("maxAmount", rst.getInt("request_approx_max_amount"));
                            individualIssue.put("serviceStatus", serviceStatus);
                            customerIssue.add(individualIssue);
                    }
                    Utility.closeDbConnection(con,rst, statement);

                    }
                     catch (Exception e) {
                        e.printStackTrace();
                    }
                %>

              <div class="container-fluid">
                    <!-- Row 1 -->
                    <div class="row">
                        <div class="col-lg-12">
                            <h3>Order Details</h3>
                        </div>
                    </div>
<!--                    <div class="row">
                        <div class="col-md-2">
                            <div class="form-group mb-3">
                                <p class="small text-muted mb-1">Order Id</p>
                                
                                <p></p>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group mb-3">
                                <p class="small text-muted mb-1">Order Date</p>
                                <p>10 April 2021</p>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group mb-3">
                                <p class="small text-muted mb-1">Expected Fix Date</p>
                                <p>012j1gvs356c</p>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group mb-3">
                                <p class="small text-muted mb-1">Approx Amount</p>
                                <p>012j1gvs356c</p>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group mb-3">
                                <p class="small text-muted mb-1">Service</p>
                                <p>Due</p>
                            </div>
                        </div>
                    </div>-->
                    <div class="table-section bg-light mt-2">
                    <table class="table mt-2">
                        <thead>
                            <tr>
                                <th scope="col">Order ID</th>
                                <th scope="col">Order Date</th>
                                <th scope="col">Expected Fix Date</th>

                                <th scope="col">Approx Min Amount</th>
                                <th scope="col">Approx Max Amount</th>
                                <th scope="col">Service Status</th>
                               
                            </tr>
                        </thead>
                        <tbody>
                        <%
                        for (int i = 0; i < customerIssue.size(); i++) {
                            Map<Object, Object> individualIssue = customerIssue.get(i);
                           
                        %>
                            <tr>
                                <td scope="row"><%=  individualIssue .get("orderId") %></td>
                                <td><%= individualIssue .get("orderDate")  %></td>
                                <td><%= individualIssue .get("orderFixExpectedDate")  %></td>
                                <td><%= individualIssue .get("minAmount")  %></td>
                                <td scope="row"><%= individualIssue .get("maxAmount")  %></td>
                                <td scope="row"><%= individualIssue .get("serviceStatus")  %></td>
                               
                            </tr>
                        <%
                        }
                        %>
                        </tbody>
                    </table>
                </div>
                    
                     <div class="row">
                        <div class="col-lg-4 d-flex align-items-stretch">

                        </div>
                        <div class="col-lg-8 d-flex align-items-stretch">

                        </div>
                    </div>
                </div>

            </div>
            
            
        </div>
        
    </body>
    <script src="assets/js/jquery.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
    <script src="assets/js/customer/sidebarmenu.js"></script>
    <script src="assets/js/customer/app.min.js"></script>
    <script src="assets/js/customer/apexcharts.min.js"></script>
    <script src="assets/js/customer/simplebar.js"></script>
    <script src="assets/js/customer/dashboard.js"></script>
    
</html>
