/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
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
import javax.servlet.http.HttpSession;
import util.DatabaseConnection;
import util.Utility;

/**
 *
 * @author Sanket Mal
 */
@WebServlet(name = "CustomerLogin", urlPatterns = {"/CustomerLogin"})
public class CustomerLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CustomerLogin</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CustomerLogin at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    out.println(email);
    out.println(password);
    String encodedPassword = Utility.convertBase64(password);
    Connection con = null;
    PreparedStatement pstmt = null;
    try {
        con = DatabaseConnection.getConnection();

        String query = "SELECT * FROM user WHERE user_email = ? AND user_active = 1 AND user_role = 2";
        pstmt = con.prepareStatement(query);
        pstmt.setString(1, email);
        ResultSet rst = pstmt.executeQuery();

        // Check if there are results
        if (rst.next()) {
            int userId = rst.getInt("user_id");
            String userPassHashFromDB = rst.getString("user_password");

            // Check if the password matches
            if (encodedPassword.equals(userPassHashFromDB)) {
                HttpSession session = request.getSession();
                session.setAttribute("customerId", userId);
                Utility.closeDbConnection(con, rst, pstmt);
                response.sendRedirect(request.getContextPath() + "/customer-dashboard.jsp");
            } else {
                // Password doesn't match
                HttpSession customerLoginSession = request.getSession();
                customerLoginSession.setAttribute("customer-login-message", "error");
                Utility.closeDbConnection(con, rst, pstmt);
                response.sendRedirect(request.getContextPath() + "/customer-login-page.jsp");
            }
        } else {
            // Email not found
            HttpSession customerLoginSession = request.getSession();
            customerLoginSession.setAttribute("customer-login-message", "error");
            Utility.closeDbConnection(con, rst, pstmt);
            response.sendRedirect(request.getContextPath() + "/customer-login-page.jsp");
        }
    } catch (SQLException e) {
        // Handle SQL exceptions
        e.printStackTrace();
        // You might want to log the exception and provide an error message to the user
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred.");
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
