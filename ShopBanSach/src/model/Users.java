package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

//import org.omg.PortableServer.POAManagerPackage.State;

public class Users {
	public static void main(String[] args) {
		User u = Users.findByEmail("taiha201.it@gmail.com");
		u.setPassword("123456");
		System.out.println(Users.updateCustomer(u));
	}
	public static ArrayList<User> listUser(){
		ArrayList<User> list = new ArrayList<>();
		try {
			Connection con = DBconnect.getConnection();
			String sql = "SELECT * FROM account a JOIN users u ON a.username LIKE u.id";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				User u =  new User();
				u.setUsername(rs.getString("a.username"));
				u.setPassword(rs.getString("a.password"));
				u.setEmail(rs.getString("u.email"));
				u.setName(rs.getString("u.name"));
				u.setPhone(rs.getString("u.phone"));
				u.setAddress(rs.getString("u.address"));
				u.setRole_id(rs.getInt("a.role_id"));
				list.add(u);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public static int addUser(User u) {
		Connection con = DBconnect.getConnection();
		
		try {
			if(con!=null) {
				String sql = "INSERT INTO users(id , name , email , phone , address ) VALUES ('"+ u.getUsername()+"' , '"+u.getName()+"' , '"+u.getEmail()+"' , '"+u.getPhone()+"' , '"+u.getAddress()+"')";
				String sql1 = "INSERT INTO account(username , password , role_id) VALUES ('"+ u.getUsername()+"','"+ u.getPassword()+"' , "+2+")";
				Statement st1 = con.createStatement();
				int i = st1.executeUpdate(sql);
				if(i>0) {
					int j= st1.executeUpdate(sql1);
					return j;
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	public static User findByPhone(String phone){
		Connection con = DBconnect.getConnection();
		User u = new User();
		try{
			if(con!=null){
				String sql = "SELECT * FROM  users JOIN account ON users.id LIKE account.username WHERE users.phone LIKE'%"+phone+"%'";
				Statement st = con.createStatement(); 
				ResultSet rs = st.executeQuery(sql);
				while(rs.next()) {
				u.setUsername(rs.getString("id"));
				u.setPassword(rs.getString("account.password"));
				u.setRole_id(rs.getInt("account.role_id"));
				u.setName(rs.getString("users.name"));
				u.setEmail(rs.getString("users.email"));
				u.setPhone(rs.getString("users.phone"));
				u.setAddress(rs.getString("users.address"));
				}
				return u;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	public static User findByEmail(String email){
		Connection con = DBconnect.getConnection();
		User u = new User();
		try{
			if(con!=null){
				String sql = "SELECT * FROM  users JOIN account ON users.id LIKE account.username WHERE users.email LIKE'%"+email+"%'";
				Statement st = con.createStatement(); 
				ResultSet rs = st.executeQuery(sql);
				while(rs.next()) {
				u.setUsername(rs.getString("id"));
				u.setPassword(rs.getString("account.password"));
				u.setRole_id(rs.getInt("account.role_id"));
				u.setName(rs.getString("users.name"));
				u.setEmail(rs.getString("users.email"));
				u.setPhone(rs.getString("users.phone"));
				u.setAddress(rs.getString("users.address"));
				}
				return u;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	public static int updateCustomer(User u) {
		Connection con= DBconnect.getConnection();
		try {
			String sql="UPDATE users SET name='"+u.getName()+"',email='"+u.getEmail()+"',phone="+u.getPhone()+",address='"+u.getAddress()+"' where id LIKE '%"+u.getUsername()+"%'";
			String sql1="UPDATE account SET password='"+u.getPassword()+"' where username LIKE '%"+u.getUsername()+"%'";
			Statement st=con.createStatement();
			int i=st.executeUpdate(sql);
			int j=st.executeUpdate(sql1);
			return i+j;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	public static User findByUsername(String username) {
		Connection	con  =  DBconnect.getConnection();
		User u = new User();
		try {
		if(con != null) {
			String sql = "SELECT * FROM  users JOIN account ON users.id LIKE account.username  WHERE account.username  LIKE '"+username+"'";
			Statement ps = con.createStatement();
			ResultSet rs = ps.executeQuery(sql);
			while(rs.next()) {
				u.setUsername(rs.getString("users.id"));
				u.setPassword(rs.getString("account.password"));
				u.setRole_id(rs.getInt("account.role_id"));
				u.setName(rs.getString("users.name"));
				u.setEmail(rs.getString("users.email"));
				u.setPhone(rs.getString("users.phone"));
				u.setAddress(rs.getString("users.address"));
				return u;
			}
		}
		else System.out.println("Lỗi truy vấn");
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return null;	
		
	}
}
