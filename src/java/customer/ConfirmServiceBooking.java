/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package customer;

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
                Utility.closeDbConnection(con, preparedStatement);
            }
        }
        else if ("No".equals(confirmation)) {

                String customerDataQuery = "SELECT user.user_first_name, user.user_last_name, user.user_email, user.user_phone_number, "
        + "customer_request_problem.request_description FROM customer_request_problem "
        + "INNER JOIN user ON customer_request_problem.request_customer_id = user.user_id WHERE user.user_id = ?";

            PreparedStatement customerDataStatement = con.prepareStatement(customerDataQuery);
            customerDataStatement.setInt(1, userId);
            ResultSet customerDataResult = customerDataStatement.executeQuery();

            String firstName = null;
            String lastName = null;
            String userEmail = null;
            String userPhone = null;
            String message = null;

            // Check if there's a result (customer with the given ID found)
            if (customerDataResult.next()) {
                firstName = customerDataResult.getString("user_first_name");
                lastName = customerDataResult.getString("user_last_name");
                userEmail = customerDataResult.getString("user_email");
                userPhone = customerDataResult.getString("user_phone_number");
                message = customerDataResult.getString("request_description");
                System.out.println("User ID: " + userId);
                System.out.println("Message: " + message);
                if (message == null) {
                    // Handle the case where message is null
                    message = ""; // Set a default value or handle it as needed
                }
                System.out.println("message :" +message);

            }

            // Now, you have the customer's data, you can insert it into the interested_person table
            String insertQuery = "INSERT INTO interested_person (name, email, phone , message , action) VALUES (?, ?, ? , ? ,?)";
            preparedStatement = con.prepareStatement(insertQuery);
            preparedStatement.setString(1, firstName + " " + lastName); // Combine first name and last name
            preparedStatement.setString(2, userEmail);
            preparedStatement.setString(3, userPhone);
             preparedStatement.setString(4, message);
             preparedStatement.setInt(5, 0);
                    
            int insertResult = preparedStatement.executeUpdate();
             if (insertResult > 0) {
                    System.out.println("Redirecting...");
                    response.sendRedirect(request.getContextPath() + "/customer-dashboard.jsp");
                }
             
             Utility.closeDbConnection(con, preparedStatement);
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
