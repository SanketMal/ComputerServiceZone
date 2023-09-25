/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
@WebServlet(name = "UpdateServiceStatus", urlPatterns = {"/UpdateServiceStatus"})
public class UpdateServiceStatus extends HttpServlet {

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
            out.println("<title>Servlet UpdateServiceStatus</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateServiceStatus at " + request.getContextPath() + "</h1>");
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
         int orderId = Integer.parseInt(request.getParameter("orderId"));
        int currentStatus = Integer.parseInt(request.getParameter("currentStatus")) ;
        

        Connection con = null;
        PreparedStatement pstmt = null;
        
        try {
            con = DatabaseConnection.getConnection();
            if(currentStatus == 0){
                String updateQuery = "UPDATE customer_request_problem SET get_service = ? WHERE request_id = ?";
                pstmt = con.prepareStatement(updateQuery);
                pstmt.setInt(1,  1); // 0 for Due, 1 for Got
                pstmt.setInt(2, orderId);
            
            }
            
            else if(currentStatus == 1){
                String updateQuery = "UPDATE customer_request_problem SET get_service = ? WHERE request_id = ?";
                pstmt = con.prepareStatement(updateQuery);
                pstmt.setInt(1,  0); // 0 for Due, 1 for Got
                pstmt.setInt(2, orderId);
            
            }
                    
                    
                    
            int result = pstmt.executeUpdate();
            //Utility.closeDbConnection(con, pstmt);
            System.out.println("Result: " + result);
            if(result > 0){
                System.out.println("Redirecting...");
                response.sendRedirect(request.getContextPath()+"/admin/customer-request.jsp");
            
            }
            
        } catch (Exception e) {
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
