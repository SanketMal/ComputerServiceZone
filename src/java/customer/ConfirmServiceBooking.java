/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package customer;

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
import util.Utility;

/**
 *
 * @author Sanket Mal
 */
@WebServlet(name = "ConfirmServiceBooking", urlPatterns = {"/ConfirmServiceBooking"})
public class ConfirmServiceBooking extends HttpServlet {

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
            out.println("<title>Servlet ConfirmServiceBooking</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConfirmServiceBooking at " + request.getContextPath() + "</h1>");
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
    String confirmation = request.getParameter("confirmation");
    System.out.println(confirmation);
    Connection con = null;
            int userId = Integer.parseInt(request.getParameter("customerId"));
            int defectId = Integer.parseInt(request.getParameter("defectId"));
            int approxMinAmount = Integer.parseInt(request.getParameter("approxMinAmount"));
            int approxMaxAmount = Integer.parseInt(request.getParameter("approxMaxAmount"));
    try {
        con = DatabaseConnection.getConnection();
        PreparedStatement preparedStatement = null;

        if ("Yes".equals(confirmation)) {
            // Retrieve the values from request parameters
            Statement stmt = (Statement) con.createStatement();
            String updateQuery = "UPDATE `customer_request_problem` SET request_confirm = true " +
                        "WHERE request_customer_id = ? AND request_defect_id = ?";           
            preparedStatement = con.prepareStatement(updateQuery);
            preparedStatement.setInt(1, userId);
            preparedStatement.setInt(2, defectId);
            int result = preparedStatement.executeUpdate();
            //Utility.closeDbConnection(con, stmt);
            System.out.println("Result: " + result);
            if (result > 0) {
                System.out.println("Redirecting...");
                response.sendRedirect(request.getContextPath() + "/booking-confirm-message.jsp");
            }
        }
        else if ("No".equals(confirmation)) {
   
                String updateQuery = "UPDATE `customer_request_problem` SET request_confirm = false " +
                                    "WHERE request_customer_id = ? AND request_defect_id = ?";
                preparedStatement = con.prepareStatement(updateQuery);
                preparedStatement.setInt(1, userId);
                preparedStatement.setInt(2, defectId);

                int result = preparedStatement.executeUpdate();
                if (result > 0) {
                    System.out.println("Redirecting...");
                    response.sendRedirect(request.getContextPath() + "/customer-dashboard.jsp");
                }
        }

    } catch (SQLException e) {
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
