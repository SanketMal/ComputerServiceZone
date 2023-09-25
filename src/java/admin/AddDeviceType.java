/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
@WebServlet(name = "AddDeviceType", urlPatterns = {"/AddDeviceType"})
public class AddDeviceType extends HttpServlet {

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
            out.println("<title>Servlet AddDeviceType</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddDeviceType at " + request.getContextPath() + "</h1>");
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
    
    String deviceType = request.getParameter("deviceType");
    String formAction = request.getParameter("formAction");
    int deviceId = Integer.parseInt(request.getParameter("deviceId"));
    
    
    Connection con = null;
    
    try {
        con = DatabaseConnection.getConnection();
        PreparedStatement preparedStatement = null;
        // For data save
        if (deviceId == 0 && formAction.equals(ResponseMessage.formActionSave)) {
            Statement stmt = (Statement) con.createStatement();
            int result = stmt.executeUpdate("insert into device_type (`device_name`,`device_type`, device_active) values('" + deviceType + "','"+deviceType+"',"+"1)" );
            Utility.closeDbConnection(con, stmt);

            // Debugging: Check if the result is greater than 0
            System.out.println("Result: " + result);

            if (result > 0) {
                // Debugging: Check if the correct path is being generated
                System.out.println("Redirecting...");

                // Redirect to the specified JSP page
                response.sendRedirect(request.getContextPath() + "/admin/device-type.jsp");
            }
        }
        // For data update
        else if (deviceId != 0 && formAction.equals(ResponseMessage.formActionEdit)) {
            // Here we have to write update java code
            Statement stmt = (Statement) con.createStatement();
            String updateQuery = "UPDATE device_type SET device_name = ? , device_type = ? WHERE device_id = ?";
            preparedStatement = con.prepareStatement(updateQuery);
            preparedStatement.setString(1 ,deviceType);
            preparedStatement.setString(2 ,deviceType);
            preparedStatement.setInt(3 ,deviceId);
            
            
            int result = preparedStatement.executeUpdate();
            Utility.closeDbConnection(con, stmt);
            System.out.println("Result: " + result);
            if(result > 0){
                System.out.println("Redirecting...");
                response.sendRedirect(request.getContextPath() + "/admin/device-type.jsp");
            }
            
        }
        // For delete data
        else if (deviceId != 0 && formAction.equals(ResponseMessage.formActionDelete)) {
            Statement stmt = (Statement) con.createStatement();
            String updateQuery = "UPDATE device_type SET device_active = ? WHERE device_id = ?";
            preparedStatement = con.prepareStatement(updateQuery);
            preparedStatement.setBoolean(1 , false);
            preparedStatement.setInt(2 ,deviceId);
            
            
            int result = preparedStatement.executeUpdate();
            Utility.closeDbConnection(con, stmt);
             System.out.println("Result: " + result);
            if(result > 0){
                System.out.println("Redirecting...");
                response.sendRedirect(request.getContextPath() + "/admin/device-type.jsp");
            }
        }
        
        
    } catch (SQLException e) {
        e.printStackTrace();
    }
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
