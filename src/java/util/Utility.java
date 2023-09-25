/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Base64;

/**
 *
 * @author Sanket Mal
 */
public class Utility {
    
    public static String convertBase64(String password) {
        String encodedStr = Base64.getEncoder().encodeToString(password.getBytes());
        return encodedStr;
    }
    
    public static void closeDbConnection(Connection connection, Statement statement) throws SQLException {
        statement.close();
        connection.close();
    }
    
    public static void closeDbConnection(Connection connection, ResultSet rst, Statement statement) throws SQLException {
        statement.close();
        rst.close();
        connection.close();
    }
}
