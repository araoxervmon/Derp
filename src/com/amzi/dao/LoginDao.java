package com.amzi.dao;


import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.PreparedStatement;  
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.io.PrintWriter;  
import java.sql.*;
import java.util.*;

public class LoginDao {  
    public static boolean validate(String name, String pass) {          
        boolean status = false;  
        Connection conn = null;  
        PreparedStatement pst = null;  
        ResultSet rs = null;  
  
        String url = "jdbc:mysql://localhost:3306/";  
        String dbName = "derp";  
        String driver = "com.mysql.jdbc.Driver";  
        String userName = "root";  
        String password = "";  
        try {  
            Class.forName(driver).newInstance();  
            conn = DriverManager  
                    .getConnection(url + dbName, userName, password);  
         //   System.out.println(driver+conn+dbName);
  
            pst = conn  
                    .prepareStatement("select * from derpuser where user=? and password=?");  
            pst.setString(1, name);  
            pst.setString(2, pass);  
  
            rs = pst.executeQuery();  
            status = rs.next();  
  
        } catch (Exception e) {  
            System.out.println(e);  
        } finally {  
            if (conn != null) {  
                try {  
                    conn.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (pst != null) {  
                try {  
                    pst.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (rs != null) {  
                try {  
                    rs.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
        }  
        return status;  
    }  
    

    public static List fetchUser() {          
     //   boolean status = false;  
        Connection conn = null;  
        PreparedStatement pst = null;  
        ResultSet rs = null;  
        ArrayList list=new ArrayList();
        
        String url = "jdbc:mysql://localhost:3306/";  
        String dbName = "derp";  
        String driver = "com.mysql.jdbc.Driver";  
        String userName = "root";  
        String password = "";  
        try {  
            Class.forName(driver).newInstance();  
            conn = DriverManager  
                    .getConnection(url + dbName, userName, password);  
            pst = conn.prepareStatement("select * from derpmember");  
            
            System.out.println(pst);
            rs = pst.executeQuery();  
            while(rs.next()){
                list.add(rs.getString("id"));
                list.add(rs.getString("name"));
                list.add(rs.getString("email"));
            //status = rs.next();  
            }
        } catch (Exception e) {  
            System.out.println(e);  
        } finally {  
            if (conn != null) {  
                try {  
                    conn.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (pst != null) {  
                try {  
                    pst.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (rs != null) {  
                try {  
                    rs.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
        }  
        return list;
    } 
}  
