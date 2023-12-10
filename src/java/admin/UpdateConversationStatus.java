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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.DatabaseConnection;
import util.Utility;

/**
 *
 * @author Sanket Mal
 */
@WebServlet(name = "UpdateConversationStatus", urlPatterns = {"/UpdateConversationStatus"})
public class UpdateConversationStatus extends HttpServlet {

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
            out.println("<title>Servlet UpdateConversationStatus</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateConversationStatus at " + request.getContextPath() + "</h1>");
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
    int id = Integer.parseInt(request.getParameter("id"));
    int currentStatus = Integer.parseInt(request.getParameter("currentStatus"));
    
    Connection con = null;
    PreparedStatement pstmt = null;
    
    try {
        con = DatabaseConnection.getConnection();
        if (currentStatus == 0) {
            String updateQuery = "UPDATE interested_person SET action = ? WHERE id = ?";
            pstmt = con.prepareStatement(updateQuery);
            pstmt.setInt(1, 1); // 1 for completed
            pstmt.setInt(2, id);
        } else if (currentStatus == 1) {
            String updateQuery = "UPDATE interested_person SET action = ? WHERE id = ?";
            pstmt = con.prepareStatement(updateQuery);
            pstmt.setInt(1, 0); // 0 for pending
            pstmt.setInt(2, id);
        }
        
        int result = pstmt.executeUpdate();
        
        if (result > 0) {
            // Redirect back to the original JSP page
            response.sendRedirect(request.getContextPath() + "/admin/interested-person.jsp");
        } else {
            // Handle the case when the update was not successful
            // You can add error handling code here
        }
    } catch (Exception e) {
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
