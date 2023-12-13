package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class categories {
	
	/**
	 * @return
	 */
	public static ArrayList<category> loadCategories(){
			ArrayList<category> list =  new ArrayList<category>();
			Connection con = DBconnect.getConnection();
			if(con != null) {
			try {
				String sql = "SELECT * FROM categories";
				Statement stm = con.createStatement();
				ResultSet rs = stm.executeQuery(sql);
				while(rs.next()) {
					category c = new category();
					c.setName(rs.getString("name"));
					c.setId(rs.getInt("id"));
					list.add(c);
				}
				return list;
			}catch(Exception e) {
				System.out.println("Lỗi truy vấn");
			}
			}
			return null;
	}
	public static ArrayList<sub_category> loadSubCategories(){
		ArrayList<sub_category> list =  new ArrayList<sub_category>();
		Connection con = DBconnect.getConnection();
		if(con != null) {
		try {
			String sql = "SELECT * FROM sub_categories";
			Statement stm = con.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while(rs.next()) {
				sub_category c = new sub_category();
				c.setName(rs.getString("Name"));
				c.setId(rs.getInt("id"));
				c.setCategory_id(rs.getInt("category_id"));
				list.add(c);
			}
			return list;
		}catch(Exception e) {
			System.out.println("Lỗi truy vấn");
		}
		}
		return null;
}
	public static ArrayList<sub_category> loadSubCategories(int id){
		ArrayList<sub_category> list =  new ArrayList<sub_category>();
		Connection con = DBconnect.getConnection();
		if(con != null) {
		try {
			String sql = "SELECT * FROM sub_categories where category_id = '"+id+"'";
			Statement stm = con.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while(rs.next()) {
				sub_category c = new sub_category();
				c.setName(rs.getString("Name"));
				c.setId(rs.getInt("id"));
				c.setCategory_id(rs.getInt("category_id"));
				list.add(c);
			}
			return list;
		}catch(Exception e) {
			System.out.println("Lỗi truy vấn");
		}
		}
		return null;
}
	
	
}
