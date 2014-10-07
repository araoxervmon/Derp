package com.amzi.dao;
import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.PreparedStatement;  
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.sql.*;

public class RegistrationDao {
	public static boolean registration(String name, String pass, String email) {          
        boolean status = false;  
        Connection conn = null;  
        PreparedStatement pst = null; 
  
        String url = "jdbc:mysql://localhost:3306/";  
        String dbName = "derp";  
        String driver = "com.mysql.jdbc.Driver";  
        String userName = "root";  
        String password = "";  
        ResultSet rs = null;
        try {  
            Class.forName(driver).newInstance();  
            conn = DriverManager  
                    .getConnection(url + dbName, userName, password);  
            Statement st = conn.createStatement();
            String queryPattern = "insert into derpuser(user, password,  email, regdate) values ('" + name + "','" + pass + "','" + email + "', CURDATE())";
 
              st.executeUpdate(queryPattern);
  
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
}
