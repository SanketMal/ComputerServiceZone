/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
@WebServlet(name = "AddCommonDefect", urlPatterns = {"/AddCommonDefect"})
public class AddCommonDefect extends HttpServlet {

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
            out.println("<title>Servlet AddCommonDefect</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCommonDefect at " + request.getContextPath() + "</h1>");
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
        
         String formAction = request.getParameter("formAction");
        int deviceId = 0;
        int subDeviceId = 0;
        int deviceOSId = 0;
        int defectId = 0;
        String defectName = "";
        
        int expectedMinAmount =0;
        
        int expectedMaxAmount =0;
        
        

        String deviceIdParam = request.getParameter("deviceId");
        String subDeviceIdParam = request.getParameter("subDeviceId");
        String deviceOSIdParam = request.getParameter("deviceOSId");
        String defectIdParam = request.getParameter("defectId");
        String defectNameParam = request.getParameter("defectName");
        String expectedMinAmountParam = request.getParameter("minAmount");
        String expectedMaxAmountParam = request.getParameter("maxAmount");
        if (deviceIdParam != null && !deviceIdParam.isEmpty()) {
            deviceId = Integer.parseInt(deviceIdParam);
        }
        if (subDeviceIdParam != null && !subDeviceIdParam.isEmpty()) {
            subDeviceId = Integer.parseInt(subDeviceIdParam);
        }
        if (deviceOSIdParam != null && !deviceOSIdParam.isEmpty()) {
            deviceOSId = Integer.parseInt(deviceOSIdParam);
        }
        if (defectIdParam != null && !defectIdParam.isEmpty()) {
            defectId = Integer.parseInt(defectIdParam);
        }
        if (defectNameParam != null) {
            defectName = defectNameParam;
        }
        if ( expectedMinAmountParam  != null && ! expectedMinAmountParam.isEmpty()) {
            expectedMinAmount = Integer.parseInt(expectedMinAmountParam);
        }
        if (expectedMaxAmountParam != null && !expectedMaxAmountParam.isEmpty()) {
            expectedMaxAmount = Integer.parseInt(expectedMaxAmountParam);
        }
        
        
        Connection con = null;
        try{
            con = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement = null;
            //For data save
            if(defectId == 0 && formAction.equals(ResponseMessage.formActionSave)){
                Statement stmt = (Statement) con.createStatement();
                int result = stmt.executeUpdate("insert into common_defect(device_id,sub_device_id,`defect_name`,device_os_id,min_expected_amount,"
                        + "max_expected_amount,defect_active) values("+ deviceId +","+subDeviceId+",'"+defectName+"',"+deviceOSId+","+
                        expectedMinAmount+","+expectedMaxAmount+","+"1)");
                Utility.closeDbConnection(con, stmt);

            // Debugging: Check if the result is greater than 0
                System.out.println("Result: " + result);

                if (result > 0) {
                    // Debugging: Check if the correct path is being generated
                    System.out.println("Redirecting...");

                    // Redirect to the specified JSP page
                    response.sendRedirect(request.getContextPath() + "/admin/common-defect.jsp");
                }
                
            }
            else if(defectId != 0 && formAction.equals(ResponseMessage.formActionEdit)){
                Statement stmt = (Statement) con.createStatement();
                String updateQuery = "UPDATE common_defect SET defect_name = ? , device_id=? ,sub_device_id=?,device_os_id =? ,min_expected_amount=?,max_expected_amount=? WHERE defect_id = ?";
                preparedStatement = con.prepareStatement(updateQuery);
                preparedStatement.setString(1 ,defectName);
                preparedStatement.setInt(2 ,deviceId);
                preparedStatement.setInt(3 ,subDeviceId);
                preparedStatement.setInt(4 ,deviceOSId);
                preparedStatement.setInt(5 ,expectedMinAmount);
                preparedStatement.setInt(6 ,expectedMaxAmount);
                preparedStatement.setInt(7 ,defectId);
                
                



                int result = preparedStatement.executeUpdate();
                Utility.closeDbConnection(con, stmt);
                 System.out.println("Result: " + result);
                if(result > 0){
                    System.out.println("Redirecting...");
                    response.sendRedirect(request.getContextPath() + "/admin/common-defect.jsp");
                }
                
            }
            else if (defectId != 0 && formAction.equals(ResponseMessage.formActionDelete)) {
            Statement stmt = (Statement) con.createStatement();
            String updateQuery = "UPDATE common_defect SET defect_active = ? WHERE defect_id = ?";
            preparedStatement = con.prepareStatement(updateQuery);
            preparedStatement.setBoolean(1 , false);
            preparedStatement.setInt(2 ,defectId);
            
            
            int result = preparedStatement.executeUpdate();
            Utility.closeDbConnection(con, stmt);
             System.out.println("Result: " + result);
            if(result > 0){
                System.out.println("Redirecting...");
                response.sendRedirect(request.getContextPath() + "/admin/common-defect.jsp");
            }
        }
            
        }catch(Exception e){
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
