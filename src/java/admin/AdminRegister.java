/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
@WebServlet(name = "AdminRegister", urlPatterns = {"/AdminRegister"})
public class AdminRegister extends HttpServlet {

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
            out.println("<title>Servlet AdminLogIn</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminLogIn at " + request.getContextPath() + "</h1>");
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
        
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String encodedPassword = Utility.convertBase64(password);
        
        Connection connection = null;
        
        try {
            connection = DatabaseConnection.getConnection();
            
            // email id is already exist or not
            
            Statement stmt = (Statement) connection.createStatement();
            
            int result = stmt.executeUpdate("insert into user (`user_first_name` ,`user_last_name`,`user_email`,user_phone_number,"
                    + "`user_password`,user_role, user_active)values('"+firstName+"','"+lastName+"','"+email+"', '"+phone+"','"+encodedPassword+"',1, 1)");
            Utility.closeDbConnection(connection, stmt);
            if (result > 0) {
                response.sendRedirect(request.getContextPath() + "/admin/admin-register.jsp?message=" + ResponseMessage.adminRegisterSuccess);
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/admin-register.jsp?message=" +  ResponseMessage.adminRegisterError);
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
