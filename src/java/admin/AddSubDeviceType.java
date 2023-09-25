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
import util.DatabaseConnection;
import util.ResponseMessage;
import util.Utility;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sanket Mal
 */
@WebServlet(name = "AddSubDeviceType", urlPatterns = {"/AddSubDeviceType"})
public class AddSubDeviceType extends HttpServlet {

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
            out.println("<title>Servlet AddSubDeviceType</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddSubDeviceType at " + request.getContextPath() + "</h1>");
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
        String subDeviceType = request.getParameter("subDeviceType");
        String formAction = request.getParameter("formAction");
        int subDeviceId = Integer.parseInt(request.getParameter("subDeviceId"));
        Connection con = null;
        String subDeviceIdParam = request.getParameter("subDeviceId");
        subDeviceId = 0;  // Default value in case of parsing error
        if (subDeviceIdParam != null && !subDeviceIdParam.isEmpty()) {
            try {
                subDeviceId = Integer.parseInt(subDeviceIdParam);
            } catch (NumberFormatException e) {
                // Handle parsing error
                e.printStackTrace();  // Print the error for debugging purposes
                // You might want to add proper error handling here, such as logging the error
            }
        }
        try{
            con = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement = null;
            PreparedStatement maxSubDeviceId = null;
            int maxSubDeviceIdValue=0;
            //for data save
            if(subDeviceId == 0 && formAction.equals(ResponseMessage.formActionSave)){
                Statement stmt = (Statement) con.createStatement();
                String findMaxSubDeviceIdQuery = "SELECT MAX(sub_device_id) AS max_sub_device_id FROM sub_device_type;";
            maxSubDeviceId = con.prepareStatement(findMaxSubDeviceIdQuery);
            
            // Execute the query
                ResultSet resultSet = maxSubDeviceId.executeQuery();

            // Retrieve and print the maximum sub_device_id value
            if (resultSet.next()) {
                 maxSubDeviceIdValue = resultSet.getInt("max_sub_device_id");
                System.out.println("Max sub_device_id: " + maxSubDeviceIdValue);
            } else {
                System.out.println("No data found.");
            }
                //int result = stmt.executeUpdate("insert into sub_device_type (sub_device_id,`sub_device_type`,sub_device_active) values (maxSubDeviceIdValue+1,'"+subDeviceType +"',"+"1)");
                String insertQuery = "INSERT INTO sub_device_type (sub_device_id,`sub_device_type`, sub_device_active) VALUES (?,?, ?)";
                preparedStatement = con.prepareStatement(insertQuery);
                preparedStatement.setInt(1, maxSubDeviceIdValue+1 );
                preparedStatement.setString(2, subDeviceType);
               
                preparedStatement.setInt(3, 1);  // Assuming 1 indicates active
                int result = preparedStatement.executeUpdate();

                Utility.closeDbConnection(con , stmt);
                //Debugging : check if the result is grater than 0
                System.out.println("Result :" + result);
                if(result > 0){
                    
                    
                    // Debugging : Check if the correct path is being generated
                    System.out.println("Redirecting...");
                    // Redirect to the specified JSP page
                    response.sendRedirect(request.getContextPath() + "/admin/sub-device-type.jsp");
                    
                }
            }
            //For Data Update
            else if (subDeviceId != 0 && formAction.equals(ResponseMessage.formActionEdit)){
                    Statement stmt =(Statement) con.createStatement();
                    String updateQuery = "UPDATE sub_device_type SET sub_device_type = ? WHERE sub_device_id = ?";
                    preparedStatement = con.prepareStatement(updateQuery);
                    preparedStatement.setString(1, subDeviceType);
                    preparedStatement.setInt(2, subDeviceId);
                    int result = preparedStatement.executeUpdate();
                    Utility.closeDbConnection(con, stmt);
                     //Debugging : check if the result is grater than 0
                    System.out.println("Result :" + result);
                    if(result > 0){
                    // Debugging : Check if the correct path is being generated
                    System.out.println("Redirecting...");
                    // Redirect to the specified JSP page
                    response.sendRedirect(request.getContextPath() + "/admin/sub-device-type.jsp");
                    
                }                    
            }
            //For Delete Data
            else if( subDeviceId != 0 && formAction.equals(ResponseMessage.formActionDelete)){
                Statement stmt = (Statement) con.createStatement();
                String updateQuery = "UPDATE sub_device_type SET sub_device_active = ? WHERE sub_device_id = ?";
                preparedStatement = con.prepareStatement(updateQuery);
                preparedStatement.setBoolean(1,false);
                preparedStatement.setInt(2,subDeviceId);
                int result = preparedStatement.executeUpdate();
                Utility.closeDbConnection(con, stmt);
                     //Debugging : check if the result is grater than 0
                System.out.println("Result :" + result);
                if(result > 0){
                // Debugging : Check if the correct path is being generated
                System.out.println("Redirecting...");
                // Redirect to the specified JSP page
                response.sendRedirect(request.getContextPath() + "/admin/sub-device-type.jsp");
                    
                }           
                
            }
        }
        catch(SQLException e){
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
