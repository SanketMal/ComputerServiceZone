<%--
Document   : customer-details
Created on : 20 Aug, 2023, 9:53:37 PM
Author     : Sanket Mal
--%>

<%@page import="util.GetDataById"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="util.Utility"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.DatabaseConnection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%
        Integer adminId = (Integer) session.getAttribute("adminId");
        if (adminId == null) {
            response.sendRedirect("admin-login.jsp");
        }
    %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="icon" type="image/x-icon" href="../images/logo.png">
    <title>Customer Request</title>
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
                    <button aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"
                            class="navbar-toggler" data-target="#navbarSupportedContent" data-toggle="collapse"
                            type="button"><span class="navbar-toggler-icon"></span></button>
                </div>
                <div class="float-right">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item ">
                            <a class="nav-link" href="device-type.jsp">Device Type</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="sub-device-type.jsp">Sub Device Type</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="device-os-type.jsp">Device OS Type</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="common-defect.jsp">Common Defect</a>
                        </li>
                        <li class="nav-item active ">
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
            </nav>
        </div>
    </div>
</div>
<section class="container">
    <div class="row">
        <%
            Connection con = null;
            Statement stmt = null;
            List<Map<Object, Object>> customerIssue = new ArrayList<>();
            Set<Integer> deviceIdSet = new HashSet<>();
            Set<Integer> subDeviceIdSet = new HashSet<>();
            Set<Integer> deviceOSIdSet = new HashSet<>();
            Set<Integer> defectIdSet = new HashSet<>();

            try {
                con = DatabaseConnection.getConnection();
                String query = "SELECT customer_request_problem.request_id ,customer_request_problem.request_customer_id ,"
                + "customer_request_problem.request_device_id,customer_request_problem.request_sub_device_id ,customer_request_problem.request_device_os_id,"
                + "customer_request_problem.request_description,customer_request_problem.request_approx_min_amount,customer_request_problem.request_approx_max_amount,"
                + "user.user_first_name,user.user_last_name,user.user_phone_number,user.user_email,customer_request_problem.request_defect_id,"
                + "customer_request_problem.get_service,customer_request_problem.address FROM customer_request_problem INNER JOIN user ON "
                + "customer_request_problem.request_customer_id = user.user_id where request_confirm = 1";

                stmt = con.createStatement();
                ResultSet rst = stmt.executeQuery(query);
                System.out.println("Rst :" + rst);
                
                while (rst.next()) {
                        int intServiceStatus =rst.getInt("get_service");
                        String serviceStatus = "";
                        if (rst.getInt("get_service") == 0) {
                            serviceStatus = "Due";
                        } else if (rst.getInt("get_service") == 1) {
                            serviceStatus = "Got";
                        }

                        Map<Object, Object> individualIssue = new HashMap<>();
                        individualIssue.put("orderId", rst.getInt("request_id"));
                        individualIssue.put("customerId", rst.getInt("request_customer_id"));
                        individualIssue.put("customerName", rst.getString("user_first_name") + " " + rst.getString("user_last_name"));
                        individualIssue.put("phoneNumber", rst.getString("user_phone_number"));
                        individualIssue.put("email", rst.getString("user_email"));
                        individualIssue.put("address", rst.getString("address"));
                        individualIssue.put("defectId", rst.getInt("request_defect_id"));
                        individualIssue.put("deviceId", rst.getInt("request_device_id"));
                        individualIssue.put("subDeviceId", rst.getInt("request_sub_device_id"));
                        individualIssue.put("deviceOSId", rst.getInt("request_device_os_id"));
                        individualIssue.put("defectDescription", rst.getString("request_description"));
                        individualIssue.put("minAmount", rst.getInt("request_approx_min_amount"));
                        individualIssue.put("maxAmount",rst.getInt("request_approx_max_amount"));
                        individualIssue.put("intServiceStatus",intServiceStatus);
                        individualIssue.put("serviceStatus", serviceStatus);
                        customerIssue.add(individualIssue);
                        deviceIdSet.add(rst.getInt("request_device_id"));
                        subDeviceIdSet.add(rst.getInt("request_sub_device_id"));
                        deviceOSIdSet.add(rst.getInt("request_device_os_id"));
                        defectIdSet.add(rst.getInt("request_defect_id"));
                        
                    }
                    Utility.closeDbConnection(con,rst, stmt);
                }
               catch (Exception e) {
                e.printStackTrace();
            }
            
            
           // For Get Device Details by ID
                    Map<Integer, String> deviceTypeMap = GetDataById.getDeviceTypeById(deviceIdSet);
                    
                    // For Sub Devie Id
                    Map<Integer, String> subDeviceTypeMap = GetDataById.getSubDeviceTypeById(subDeviceIdSet);
                    //For Device OS Id
                    Map<Integer,String> deviceOSTypeMap = GetDataById.getDeviceOSTypeById(deviceOSIdSet);
                    //For Defect Name
                    Map<Integer, String > defectNameMap = GetDataById.getDeviceDetailsByDefectId(defectIdSet);
        %>
        <div class="table-section bg-light mt-2">
            <table class="table mt-2">
                <thead>
                <tr>
                    <th scope="col">Order ID</th>
                    <th scope="col">Customer Id</th>
                    <th scope="col">Customer Name</th>
                    <th scope="col">Address</th>
                    <th scope="col">Phone Number</th>
                    <th scope="col">Email</th>
                    <th scope="col">About Device</th>
                    <th scope="col">Defect</th>
                    <th scope="col">Defect Description</th>
                    <th scope="col">Approx Amount</th>
                    <th scope="col">Service Status</th>
                    <th scope="col">Update Status</th>
                </tr>
                </thead>
                <tbody>
                <%
                    for (int i = 0; i < customerIssue.size(); i++) {
                        Map<Object, Object> individualIssue = customerIssue.get(i);
                        String deviceName = deviceTypeMap.get(individualIssue.get("deviceId"));
                        String subDeviceName = subDeviceTypeMap.get(individualIssue.get("subDeviceId"));
                        String deviceOSName = deviceOSTypeMap.get(individualIssue.get("deviceOSId"));
                        String defectName = defectNameMap.get(individualIssue.get("defectId"));
                %>
                <tr>
                    <td scope="row"><%= individualIssue.get("orderId") %></td>
                    <td><%= individualIssue.get("customerId") %></td>
                    <td><%= individualIssue.get("customerName") %></td>
                    <td scope="row"><%= individualIssue.get("address") %></td>
                    <td><%= individualIssue.get("phoneNumber") %></td>
                    <td scope="row"><%= individualIssue.get("email") %></td>
                    <td scope="row"><%= deviceName + " " +subDeviceName+" " + deviceOSName%></td>
                    <td scope="row"><%= defectName%></td>
                    <td scope="row"><%= individualIssue.get("defectDescription") %></td>
                    <td scope="row"><%= individualIssue.get("minAmount") + " - " + individualIssue.get("maxAmount") %></td>
                    <td scope="row"><%= individualIssue.get("serviceStatus") %></td>
                    <td>
                        <!-- Update Service Status Form -->
                        <form class="update-service-status-form"action="../UpdateServiceStatus" method="POST">
                            <input type="hidden" name="orderId" value="<%= individualIssue.get("orderId") %>">
                            <input type="hidden" name="currentStatus" value="<%= individualIssue.get("intServiceStatus") %>">
                            <button type="submit" class="btn btn-success">Update </button>
                        </form>

                    </td>
                </tr>
                <%
                    } 
                %>
                </tbody>
            </table>
        </div>
        
    </div>
</section>

</body>
<!--<script src="../assets/js/admin/update-service-status.js"></script>-->
</html>
