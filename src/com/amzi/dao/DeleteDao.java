package com.amzi.dao;
import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.PreparedStatement;  
import java.sql.ResultSet;  
import java.sql.SQLException;  
import java.sql.*;


public class DeleteDao {

	public static boolean deleteFriend(String id) {    
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
		            String queryPattern = "delete from derpmembers where id='"+id+"'" ;
		 
		              st.executeUpdate(queryPattern);
		              System.out.println(queryPattern);
		  
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
