package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnect {
	public static Connection getConnection() {
		Connection con=null;
		String name="root";
		String pass="";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookshop",name,pass);
			System.out.println("thanh cong");
		}catch(Exception e) {
			System.out.println(e);
		}
		return con;
	}
	public static void closeConnection(Connection con) {
		try {
			if(con != null) {
				con.close();
			}
		}catch(SQLException e) {
			System.out.println(e);
		}
	}
	
}
