/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.DatabaseConnection;
import util.ResponseMessage;
import util.Utility;

/**
 *
 * @author Sanket Mal
 */
@WebServlet(name = "AddDeviceOSType", urlPatterns = {"/AddDeviceOSType"})
public class AddDeviceOSType extends HttpServlet {

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
            out.println("<title>Servlet AddDeviceOSType</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddDeviceOSType at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        String deviceOSType = request.getParameter("deviceOSType");
        String formAction = request.getParameter("formAction");
        int deviceOSId = Integer.parseInt(request.getParameter("deviceOSId"));
        Connection con = null;
        String deviceOSIdParam = request.getParameter("deviceOSId");
         deviceOSId = 0;  // Default value in case of parsing error
        if (deviceOSIdParam != null && !deviceOSIdParam.isEmpty()) {
            try {
                deviceOSId = Integer.parseInt(deviceOSIdParam);
            } catch (NumberFormatException e) {
                // Handle parsing error
                e.printStackTrace();  // Print the error for debugging purposes
                // You might want to add proper error handling here, such as logging the error
            }
        }
        try{
            con = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement = null;
            PreparedStatement maxDeviceOSId = null;
            int maxDeviceOSIdValue=0;
            //for data save
            if(deviceOSId == 0 && formAction.equals(ResponseMessage.formActionSave)){
                Statement stmt = (Statement) con.createStatement();
                String findMaxDeviceOSIdQuery = "SELECT MAX(device_os_id) AS max_device_os_id FROM device_os;";
                maxDeviceOSId = con.prepareStatement(findMaxDeviceOSIdQuery);
            
            // Execute the query
                ResultSet resultSet = maxDeviceOSId.executeQuery();

            // Retrieve and print the maximum sub_device_id value
            if (resultSet.next()) {
                 maxDeviceOSIdValue = resultSet.getInt("max_device_os_id");
                System.out.println("Max device_os_id: " + maxDeviceOSIdValue);
            } else {
                System.out.println("No data found.");
            }
                //int result = stmt.executeUpdate("insert into sub_device_type (sub_device_id,`sub_device_type`,sub_device_active) values (maxSubDeviceIdValue+1,'"+subDeviceType +"',"+"1)");
                String insertQuery = "INSERT INTO device_os (device_os_id,`device_os_type`, device_os_active) VALUES (?,?, ?)";
                preparedStatement = con.prepareStatement(insertQuery);
                preparedStatement.setInt(1, maxDeviceOSIdValue+1 );
                preparedStatement.setString(2, deviceOSType);
               
                preparedStatement.setInt(3, 1);  // Assuming 1 indicates active
                int result = preparedStatement.executeUpdate();

                Utility.closeDbConnection(con , stmt);
                //Debugging : check if the result is grater than 0
                System.out.println("Result :" + result);
                if(result > 0){
                    
                    
                    // Debugging : Check if the correct path is being generated
                    System.out.println("Redirecting...");
                    // Redirect to the specified JSP page
                    response.sendRedirect(request.getContextPath() + "/admin/device-os-type.jsp");
                    
                }
            }
            //For Data Update
            else if (deviceOSId != 0 && formAction.equals(ResponseMessage.formActionEdit)){
                    Statement stmt =(Statement) con.createStatement();
                    String updateQuery = "UPDATE device_os SET device_os_type = ? WHERE device_os_id = ?";
                    preparedStatement = con.prepareStatement(updateQuery);
                    preparedStatement.setString(1, deviceOSType);
                    preparedStatement.setInt(2, deviceOSId);
                    int result = preparedStatement.executeUpdate();
                    Utility.closeDbConnection(con, stmt);
                     //Debugging : check if the result is grater than 0
                    System.out.println("Result :" + result);
                    if(result > 0){
                    // Debugging : Check if the correct path is being generated
                    System.out.println("Redirecting...");
                    // Redirect to the specified JSP page
                    response.sendRedirect(request.getContextPath() + "/admin/device-os-type.jsp");
                    
                }                    
            }
            //For Delete Data
            else if( deviceOSId != 0 && formAction.equals(ResponseMessage.formActionDelete)){
                Statement stmt = (Statement) con.createStatement();
                String updateQuery = "UPDATE device_os SET device_os_active = ? WHERE device_os_id = ?";
                preparedStatement = con.prepareStatement(updateQuery);
                preparedStatement.setBoolean(1,false);
                preparedStatement.setInt(2,deviceOSId);
                int result = preparedStatement.executeUpdate();
                Utility.closeDbConnection(con, stmt);
                     //Debugging : check if the result is grater than 0
                System.out.println("Result :" + result);
                if(result > 0){
                // Debugging : Check if the correct path is being generated
                System.out.println("Redirecting...");
                // Redirect to the specified JSP page
                response.sendRedirect(request.getContextPath() + "/admin/device-os-type.jsp");
                    
                }           
                
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        
        
       // processRequest(request, response);
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
