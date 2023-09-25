/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

/**
 *
 * @author Sanket Mal
 */
public class GetDataById {
    
    public static Map<Integer, String> getDeviceTypeById(Set<Integer> deviceIdSet) {
        Connection con = null;
        Statement statement = null;
        Map<Integer, String> deviceTypeMap = new HashMap<>();
        
        try {
            con = DatabaseConnection.getConnection();
            
            String query = "SELECT * FROM `device_type` WHERE device_id IN (";
            
            StringBuilder sb = new StringBuilder(query);
            Iterator val = deviceIdSet.iterator();
            
            int i = 1;
            
            while(val.hasNext()) {
                sb.append(val.next());
                if (i != deviceIdSet.size()) {
                    sb.append(", ");
                }
                i++;
            }
            query = sb.append(")").toString();
            
            System.out.println("SQL " + query);
            
            statement = con.createStatement();
            
            ResultSet rst = statement.executeQuery(query);
            
            while(rst.next()) {
                deviceTypeMap.put(rst.getInt(1), rst.getString(2));
            }
            
            Utility.closeDbConnection(con, rst, statement);
            
        } catch (SQLException e) {
            e.getMessage();
        }
        
        return deviceTypeMap;
    }
    public static Map<Integer , String > getSubDeviceTypeById (Set<Integer> subDeviceIdSet){
        Connection con = null;
        Statement stmt = null;
        Map<Integer , String> subDeviceTypeMap = new HashMap <>();
        try{
          con = DatabaseConnection.getConnection();
          String query ="SELECT * from `sub_device_type` where sub_device_id IN (";
          StringBuilder sb = new StringBuilder(query);
          Iterator val = subDeviceIdSet.iterator();
          int i=1;
          while(val.hasNext()){
              sb.append(val.next());
              if( i != subDeviceIdSet.size()){
                  sb.append(", ");
              }
              i++;
          }
          sb.append(")");
          query = sb.toString();
          System.out.println("SQL " + query);
          stmt = con.createStatement();
          ResultSet rst = stmt.executeQuery(query);
          while(rst.next()){
              subDeviceTypeMap.put(rst.getInt(1), rst.getString(2));
          }
          Utility.closeDbConnection(con, rst, stmt);
          
        } catch(SQLException e){
            e.printStackTrace();
        }
        return subDeviceTypeMap;
    }
    public static Map<Integer ,String> getDeviceOSTypeById (Set<Integer> deviceOSIdSet){
        Connection con = null;
        Statement stmt = null;
        Map<Integer , String> deviceOSMap =new  HashMap<>();
        try{
            con = DatabaseConnection.getConnection();
            String query = " SELECT * FROM `device_os` WHERE device_os_id IN (";
            StringBuilder sb = new StringBuilder(query);
            int i = 1;
            Iterator val = deviceOSIdSet.iterator();
            while(val.hasNext()){
                sb.append(val.next());
                if( i != deviceOSIdSet.size()){
                    sb.append(", ");
                    
                }
                i++;
            }
            sb.append(")");
            query = sb.toString();
            System.out.println("SQL " + query);
            stmt = con.createStatement();
            ResultSet rst = stmt.executeQuery(query);
            while(rst.next()){
                deviceOSMap.put(rst.getInt(1), rst.getString(2));
            }
            Utility.closeDbConnection(con, rst, stmt); 
        } catch(SQLException e){
            e.getMessage();
        }
        
        return deviceOSMap;
    }
    public static Map<Integer, String> getDeviceDetailsByDefectId(Set<Integer> defectIdSet) {
        Connection con = null;
        Statement statement = null;
        Map<Integer, String> deviceDetailsMap = new HashMap<>();
        
        try {
            con = DatabaseConnection.getConnection();
            
            String query = "SELECT * FROM `common_defect` WHERE defect_id IN (";
            
            StringBuilder sb = new StringBuilder(query);
            Iterator val = defectIdSet.iterator();
            
            int i = 1;
            
            while(val.hasNext()) {
                sb.append(val.next());
                if (i != defectIdSet.size()) {
                    sb.append(", ");
                }
                i++;
            }
            query = sb.append(")").toString();
            
            System.out.println("SQL " + query);
            
            statement = con.createStatement();
            
            ResultSet rst = statement.executeQuery(query);
            
            while(rst.next()) {
               deviceDetailsMap.put(rst.getInt(1), rst.getString("defect_name"));
            }
            
            Utility.closeDbConnection(con, rst, statement);
            
        } catch (SQLException e) {
            e.getMessage();
        }
        
        return deviceDetailsMap;
    }
    
}

