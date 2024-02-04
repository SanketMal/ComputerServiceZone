/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package customer;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.DatabaseConnection;
import java.util.Date;
import util.Utility;
/**
 *
 * @author Sanket Mal
 */
@WebServlet(name = "CustomerIssue", urlPatterns = {"/CustomerIssue"})
public class CustomerIssue extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CustomerIssue</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerIssue at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int deviceTypeId = Integer.parseInt(request.getParameter("deviceTypeId"));
        int subDeviceId = Integer.parseInt(request.getParameter("subDeviceId"));
        int deviceOSTypeNameId = Integer.parseInt(request.getParameter("deviceOSTypeNameId"));
        
        Connection con = null;
        PreparedStatement pstmt = null;
                
        List<Map<String, Object>> commonDefectList = new ArrayList<>();
        
        if (deviceTypeId != 0 && subDeviceId != 0 && deviceOSTypeNameId != 0) {
            try {
                con = DatabaseConnection.getConnection();

                String query = "SELECT * FROM common_defect WHERE device_id = ? AND sub_device_id  = ? "
                        + "AND device_os_id  = ? AND defect_active = 1";
                pstmt = con.prepareStatement(query);
                pstmt.setInt(1, deviceTypeId);
                pstmt.setInt(2, subDeviceId);
                pstmt.setInt(3,deviceOSTypeNameId);
                ResultSet rst = pstmt.executeQuery();
                
                while (rst.next()) {
                    Map<String, Object> commonDefectMap = new HashMap<>();
                    commonDefectMap.put("defectId", rst.getInt("defect_id"));
                    commonDefectMap.put("deviceId", rst.getInt("device_id"));
                    commonDefectMap.put("subDeviceId", rst.getInt("sub_device_id"));
                    commonDefectMap.put("defectName", rst.getString("defect_name"));
                    commonDefectMap.put("subDeviceId", rst.getInt("device_os_id"));
                    commonDefectList.add(commonDefectMap);
                }
                
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        
        Gson gson = new Gson();
        String jsonData = gson.toJson(commonDefectList);
        
        response.setContentType("application/json");
//	response.getWriter().write(map.toString());
        PrintWriter out = response.getWriter();
        out.println(jsonData);
        
//        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int deviceId = Integer.parseInt(request.getParameter("deviceId"));
        int subDeviceId = Integer.parseInt(request.getParameter("subDeviceId"));
        int deviceOSId = Integer.parseInt(request.getParameter("deviceOSId"));
        int defectId =  Integer.parseInt(request.getParameter("defectId"));
        String defectDetails = request.getParameter("defectdetails");
        String address = request.getParameter("address");
        
        int customerId =Integer.parseInt(request.getParameter("customerId"));
        String submissionDate = request.getParameter("submissionDate");
        int approxMinAmount=0;
        int approxMaxAmount=0;
        Connection con = null;
        Statement stmt = null;
        try{
            con = DatabaseConnection.getConnection();
            String query = "SELECT * FROM  `common_defect` WHERE defect_id ="+ defectId;
            stmt = con.createStatement();
            ResultSet rst = stmt.executeQuery(query);
            if(rst.next()){
               approxMinAmount =rst.getInt("min_expected_amount");
               approxMaxAmount = rst.getInt("max_expected_amount");
            }
            
        }
        catch(SQLException e){
            
        }
        try{
            con = DatabaseConnection.getConnection();
            
            PreparedStatement preparedStatement = null;
             stmt = (Statement)con.createStatement();
            System.out.println(customerId);
            System.out.println(deviceId);
            System.out.println(subDeviceId);
            System.out.println(defectId);
            System.out.println(defectDetails);
            System.out.println(submissionDate);
            System.out.println("min amount :"+ approxMinAmount);
            System.out.println("max amount :"+ approxMaxAmount);
            //Retriving request_fix _expected_date
            Calendar calendar = Calendar.getInstance();
            Date currentDate = calendar.getTime();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String currentDateString = dateFormat.format(currentDate);
            System.out.println("Form submuission date: " + currentDateString);
            // Add 2 days to the current date
            calendar.add(Calendar.DATE, 2);

            // Get the date 2 days from now
            Date dateTwoDaysLater = calendar.getTime();

            // Format the date as a string (e.g., yyyy-MM-dd)
            String requestFixExpectedDate = dateFormat.format(dateTwoDaysLater);

            // Print or use the twoDaysLaterString as needed
            System.out.println("Two days later: " + requestFixExpectedDate);
            
            request.setAttribute("defectId", defectId);//To access the defectId in service-booking.jsp page
            request.setAttribute("approxMinAmount", approxMinAmount);
             request.setAttribute("approxMaxAmount", approxMaxAmount);
              request.setAttribute("requestFixExpectedDate", requestFixExpectedDate);
            
            int result = stmt.executeUpdate("insert into `customer_request_problem` (request_customer_id ,request_device_id,request_device_os_id,"
                   + "request_sub_device_id,request_defect_id,`request_description`,`request_date`,`request_fix_expected_date`,"
                    + "request_approx_min_amount,request_approx_max_amount,`address`,request_confirm,get_service) values("
                   +customerId +","+deviceId+","+deviceOSId+","+subDeviceId+","+defectId+",'"+defectDetails+"','"+submissionDate+
                    "','"+requestFixExpectedDate+"',"+approxMinAmount +","+ approxMaxAmount+",'"+address+"',false ,false)");
            

            Utility.closeDbConnection(con, stmt);

            // Debugging: Check if the result is greater than 0
            System.out.println("Result: " + result);

            if (result > 0) {
                // Debugging: Check if the correct path is being generated
                System.out.println("Redirecting...");

                // Redirect to the specified JSP page
                //response.sendRedirect(request.getContextPath() + "/service-booking.jsp");
                request.getRequestDispatcher("/service-booking.jsp").forward(request, response);
            }
        }catch(SQLException e ){
            e.printStackTrace();
        }
        //processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
