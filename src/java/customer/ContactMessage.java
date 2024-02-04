/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package customer;

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
@WebServlet(name = "ContactMessage", urlPatterns = {"/ContactMessage"})
public class ContactMessage extends HttpServlet {

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
            out.println("<title>Servlet ContactMessage</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ContactMessage at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String message = request.getParameter("message");
        Connection con = null;
        Statement stmt = null;
        
        System.out.println("name "+name);
        System.out.println("email "+email);
    try {
        con = DatabaseConnection.getConnection();
        stmt = (Statement) con.createStatement();
        int result = stmt.executeUpdate("INSERT INTO interested_person(`name`, `email`, `phone`, `message`) VALUES "
                + "('"+name+"','"+email+"','"+phone+"','"+message+"')");
        System.out.println("result: " + result);
        if (result > 0) {
            response.sendRedirect(request.getContextPath()+"/contact.jsp?message="+ ResponseMessage.messageSentSuccess);
        } else {
            response.sendRedirect(request.getContextPath()+"/contact.jsp?message="+ ResponseMessage.messageSentFail);
        }
    } catch (SQLException e) {
        e.printStackTrace();
        response.sendRedirect(request.getContextPath()+"/contact.jsp?message="+ ResponseMessage.messageSentFail);

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
