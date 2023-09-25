/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
@WebServlet(name = "AdminLogIn", urlPatterns = {"/AdminLogIn"})
public class AdminLogIn extends HttpServlet {

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
        
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String encodedPassword = Utility.convertBase64(password);
        
        Connection connection = null;
        Statement statement = null;

        try {
            connection = DatabaseConnection.getConnection();
            PrintWriter out = response.getWriter();
            
            String query = "select * from user where `user_email` = '" + email + "' and user_active = 1 and user_role = 1;";
            
            statement  = connection.createStatement();
            ResultSet rst = statement.executeQuery(query);
            
            HttpSession adminLoginSession = request.getSession();
            if (rst.next()) {
                int userId = rst.getInt("user_id");
                String userPassHashFromDB = rst.getString("user_password"); // Assuming it's stored as a hash

                if (encodedPassword.equals(userPassHashFromDB)){
                    // Login success

                    HttpSession session = request.getSession();
                    session.setAttribute("adminId", userId);

                    adminLoginSession.setAttribute("admin-login-message", "success");
                    Utility.closeDbConnection(connection, rst, statement);
                    response.sendRedirect(request.getContextPath() + "/admin/dashboard.jsp");
                } else {
                    // Login failed
                    adminLoginSession.setAttribute("admin-login-message", "error");
                    Utility.closeDbConnection(connection, rst, statement);
                    response.sendRedirect(request.getContextPath() + "/admin/admin-login.jsp");
                }
            } else {
                // Login failed
                adminLoginSession.setAttribute("admin-login-message", "error");
                Utility.closeDbConnection(connection, rst, statement);
                response.sendRedirect(request.getContextPath() + "/admin/admin-login.jsp");
            }

        //    preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

//        processRequest(request, response);
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
