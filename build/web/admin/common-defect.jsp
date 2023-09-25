<%-- 
    Document   : common-defect
    Created on : 20 Aug, 2023, 9:52:32 PM
    Author     : Sanket Mal
--%>

<%@page import="util.GetDataById"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="util.Utility"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.DatabaseConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            Integer adminId =(Integer )session.getAttribute("adminId");
            if(adminId == null){
                response.sendRedirect("admin-login.jsp");
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/x-icon" href="../images/logo.png">
        <title>Common Defect</title>
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
                            <button aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation" class="navbar-toggler" data-target="#navbarSupportedContent" data-toggle="collapse" type="button"><span class="navbar-toggler-icon"></span></button>
                        </div>
                        <div class="float-right">
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="device-type.jsp">Device Type</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="sub-device-type.jsp">Sub Device Type</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="device-os-type.jsp">Device OS Type</a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link" href="common-defect.jsp">Common Defect</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="customer-request.jsp">Customer Request</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="customer-feedback.jsp">Customer Feedback</a>
                                </li>
                                <li class="nav-item">
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
        <!-- Header End -->
        <section class="container">
            <div class="row">
                <div class="add-section bg-light mt-2 mb-2">
                    <form action ="../AddCommonDefect" id="commonDefect" method="POST" class="row">
                        <div class="form-group mb-3 col-md-4">
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
                        <div class="form-group mb-3 col-md-4">
                            <div class="row">
                                <div class="col-md-5">
                                    <label for="sub-deviceType" class="form-label">Device Mode</label>
                                </div>
                                <div class="col-md-7">
                                    <select class="form-select" aria-label="Default select example" id="subDeviceTypeName" name="subDeviceId" oninput="clearErrorMessage('messageForSubDeviceType')">
                                        <option selected value="">Select problem in</option>
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
                        <div class="form-group mb-3 col-md-4">
                            <div class="row">
                                <div class="col-md-5">
                                    <label for="deviceOSType" class="form-label">Operating System </label>
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
                        <div class="row  align-items-center">
                            <div class="col-md-2">
                              <label for="defectName" class="col-form-label">Defect Details</label>
                            </div>
                            <div class="col-md-10">
                              <input type="text" id="defectName" name="defectName" class="form-control defectName" aria-describedby="passwordHelpInline"oninput="clearErrorMessage('messageForDefectName')">
                             
                            </div>
                             <p id="messageForDefectName" style="color:red"></p>
                            <!-- For Edit -->
                            <input type="hidden" name="defectId" class="defect-id" value="0">
                            <input type="hidden" name="formAction" class="form-action" value="save">
                            <input type="hidden" name="deviceId" id="deviceTypeName" value="">
                            <input type="hidden" name="subDeviceId" id="subDeviceTypeName" value=""><!-- comment -->
                            <input type="hidden" name="deviceOSId" id="deviceOSTypeName" value="">
                        </div>
                        
                        <div class="row">
                            <div class="col-md-6">
                                <div class="row align-items-center">
                                    <div class="col-md-5">
                                        <label for="minAmount" class="col-form-label">Expected Minimum Amount</label>
                                    </div>
                                    <div class="col-md-7">
                                        <input type="text" id="minAmount" name="minAmount" class="form-control minAmount" oninput="clearErrorMessage('messageForMinAmount')"> 
                                    </div>
                                </div>
                                <p id="messageForMinAmount" style="color:red"></p>
                            </div>
                            <div class="col-md-6">
                                <div class="row align-items-center">
                                    <div class="col-md-5">
                                        <label for="maxAmount" class="col-form-label">Expected Maximum Amount</label>
                                    </div>
                                    <div class="col-md-7">
                                        <input type="text" id="maxAmount" name="maxAmount" class="form-control maxAmount" oninput="clearErrorMessage('messageForMaxAmount')"> 
                                    </div>
                                </div>
                                <p id="messageForMaxAmount" style="color:red"></p>
                            </div>
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
                               
                <%
                    // Fetch the data from the database
                    List<Map<String, Object>> commonDefectList = new ArrayList<>();
                    
                    Set<Integer> deviceIdSet = new HashSet<>();
                    Set<Integer> subDeviceIdSet = new HashSet<>();
                    Set<Integer> deviceOSIdSet = new HashSet<>();
                    
                    try {
                        con = DatabaseConnection.getConnection();
                        String query = "SELECT * FROM common_defect WHERE defect_active = 1;";
                        statement = con.createStatement();
                        ResultSet rst = statement.executeQuery(query);      
                        while (rst.next()) {
                            Map<String, Object> commonDefectMap = new HashMap<>();
                            commonDefectMap.put("defectId", rst.getInt(1));
                            commonDefectMap.put("deviceId", rst.getInt(2));
                            commonDefectMap.put("subDeviceId", rst.getInt(3));
                            commonDefectMap.put("deviceOSId", rst.getInt(5));
                            commonDefectMap.put("defectName", rst.getString(4));
                            commonDefectMap.put("minAmount", rst.getInt(7));
                            commonDefectMap.put("maxAmount", rst.getInt(8));
                            commonDefectList.add(commonDefectMap);
                            
                            deviceIdSet.add(rst.getInt(2));
                            subDeviceIdSet.add(rst.getInt(3));
                            deviceOSIdSet.add(rst.getInt(5));
                        }
                        Utility.closeDbConnection(con,rst, statement);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    // For Get Device Details by ID
                    Map<Integer, String> deviceTypeMap = GetDataById.getDeviceTypeById(deviceIdSet);
                    
                    // For Sub Devie Id
                    Map<Integer, String> subDeviceTypeMap = GetDataById.getSubDeviceTypeById(subDeviceIdSet);
                    //For Device OS Id
                    Map<Integer,String> deviceOSTypeMap = GetDataById.getDeviceOSTypeById(deviceOSIdSet);
                    if (commonDefectList.size() > 0) {
                %>
                <div class="table-section bg-light mt-2">
                    <table class="table mt-2">
                        <thead>
                            <tr>
                                <th scope="col">Defect ID</th>
                                <th scope="col">Device Name</th>
                                <th scope="col">Sub Device Name</th>

                                <th scope="col">Device OS Name</th>
                                <th scope="col">Defect Name</th>
                                <th scope="col">Expected Min Amount</th>
                                <th scope="col">Expected Max Amount</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                        for (int i = 0; i < commonDefectList.size(); i++) {
                            Map<String, Object> commonDefectMap = commonDefectList.get(i);
                            String deviceName = deviceTypeMap.get(commonDefectMap.get("deviceId"));
                            String subDeviceName = subDeviceTypeMap.get(commonDefectMap.get("subDeviceId"));
                            String deviceOSName = deviceOSTypeMap.get(commonDefectMap.get("deviceOSId"));
                           
                        %>
                            <tr>
                                <td scope="row"><%= commonDefectMap.get("defectId") %></td>
                                <td><%= deviceName %></td>
                                <td><%= subDeviceName %></td>
                                <td><%= deviceOSName %></td>
                                <td scope="row"><%= commonDefectMap.get("defectName") %></td>
                                <td scope="row"><%= commonDefectMap.get("minAmount") %></td>
                                <td scope="row"><%= commonDefectMap.get("maxAmount") %></td>
                                <td>
                                    <!-- Your action links here -->
                    <a href="javascript:void(0)" data-toggle="tooltip" title="Edit" data-id="<%= commonDefectMap.get("defectId") %>" 
                                       data-name="<%= commonDefectMap.get("defectName") %>"
                                       data-device-name="<%= commonDefectMap.get("deviceId") %>"
                                       data-subdevice-name="<%= commonDefectMap.get("subDeviceId") %>"
                                       data-device-os-name="<%= commonDefectMap.get("deviceOSId") %>"
                                       data-min-amount="<%= commonDefectMap.get("minAmount") %>"
                                       data-max-amount="<%= commonDefectMap.get("maxAmount") %>"
                                       class="dataEdit"><i class="bi bi-pen"></i></a> | 
                    <a href="javascript:void(0)" data-bs-toggle="modal" title="Delete" data-bs-target="#deleteModal"
                                       data-deleteid="<%= commonDefectMap.get("defectId") %>" 
                                       data-name="<%= commonDefectMap.get("defectName") %>"
                                       data-device-name ="<%= commonDefectMap.get("deviceId") %>"
                                       data-subdevice-name="<%= commonDefectMap.get("subDeviceId") %>"
                                       data-device-os-name ="<%= commonDefectMap.get("deviceOSId") %>"
                                       data-min-amount="<%= commonDefectMap.get("minAmount") %>"
                                       data-max-amount="<%= commonDefectMap.get("maxAmount") %>"
                                       class="dataDelete"><i class="bi bi-trash3"></i></a>
                                </td>
                            </tr>
                        <%
                        }
                        %>
                        </tbody>
                    </table>
                </div>
                <%
                    }
                %>                                  
            </div>
        </section>
        <div aria-hidden="true" aria-labelledby="exampleModalLabel" class="modal fade" id="deleteModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Delete Modal</h5><button aria-label="Close" class="btn-close" data-bs-dismiss="modal" type="button"></button>
                    </div>
                    <div class="modal-body">
                        
                        Are you sure want to delete this?
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" data-bs-dismiss="modal" type="button">Close</button> 
                        
                        <form action="../AddCommonDefect" method="POST">
                            <input type="hidden" name="defectId" class="delete-defect-id">
                            <input type="hidden" name="formAction" class="form-action" value="delete">
                            <button class="btn btn-danger" type="submit">Delete</button>
                        </form>
                        
                    </div>
                </div>
            </div>
        </div>
    </body>
    <!-- Vendor JS Files -->
    <script src="../assets/js/jquery.js"></script>
    <script src="../assets/vendor/purecounter/purecounter_vanilla.js"></script>
    <script src="../assets/vendor/aos/aos.js"></script>
    <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="../assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="../assets/vendor/swiper/swiper-bundle.min.js"></script>
    
    <script src="../assets/js/admin/common-defect.js"></script>
</html>
