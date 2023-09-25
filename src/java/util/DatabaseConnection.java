/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package util;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Sanket Mal
 */
public class DatabaseConnection {
    private static String databaseUrl = "jdbc:mysql://localhost:3306/csz_db";
    private static String userName = "root";
    private static String password = "";
    
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(databaseUrl, userName, password);
    }
}
