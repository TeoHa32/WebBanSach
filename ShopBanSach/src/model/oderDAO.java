package model;

import java.security.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class oderDAO {
	
	public static int addorder(order d) {
		String sql = "INSERT INTO orders (user_id, order_date, confirm, payments, shipping_method,diachinhanhang) VALUES ('"+d.getUser_id()+"','"+d.getOrder_date()+"','"+d.getconfirm()+"','sau khi nhan hang','"+d.getShipping_method()+"','"+d.getDiachinhanhang()+"')";
		try {
			Connection con = DBconnect.getConnection();
			Statement s= con.createStatement();
			int i = s.executeUpdate(sql);
//			if(i>0) {
//				String sql1 = "select * from users where id = '"+d.getUser_id()+"' and ";
//				
//			}
			return i;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	
	}
	public static int addorderdetail(order d, orderDetail r) {
		
		String string ="SELECT 	id FROM orders ORDER BY id DESC LIMIT 1";
		try {
			Connection con = DBconnect.getConnection();
			Statement s= con.createStatement();
			ResultSet resultSet = s.executeQuery(string);
			int i = 0;
			while(resultSet.next()) {
				i = resultSet.getInt("id");
			}
			int j =0;
			if(i>0) {
				String sql1 = "INSERT INTO order_detail (order_id, product_id, quantity, price) VALUES ('"+i+"','"+r.getId()+"','"+r.getQuantity()+"','"+r.getPrice()+"')";
				 j =s.executeUpdate(sql1);
			}
			return j;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	public static List<orderDetail> getALLOrder(){
		List<orderDetail> o = new ArrayList<orderDetail>();
		String sql = "SELECT * FROM orders INNER JOIN order_detail ON orders.id = order_detail.order_id JOIN products ON order_detail.product_id = products.id;";
		try {
			Connection con = DBconnect.getConnection();
			Statement s= con.createStatement();
			ResultSet resultSet = s.executeQuery(sql);
			
			while(resultSet.next()) {
				orderDetail od = new orderDetail();
				od.setId_od(resultSet.getInt("id"));
				od.setOrder_id(resultSet.getInt("order_id"));
				od.setId(resultSet.getInt("product_id"));
				od.setName(resultSet.getString("name"));
				od.setQuantity(resultSet.getInt("quantity"));
				od.setPrice(resultSet.getDouble("price"));
				order Order = new order();
				Order.setUser_id(resultSet.getString("user_id"));
				Order.setConfirm(resultSet.getInt("confirm"));
				Order.setDiachinhanhang(resultSet.getString("diachinhanhang"));
				java.sql.Timestamp timestamp = resultSet.getTimestamp("order_date");
				 LocalDateTime localDateTime = timestamp.toLocalDateTime();	
				Order.setOrder_date(localDateTime);
				Order.setShipping_method(resultSet.getString("shipping_method"));
				Order.setId(resultSet.getInt("id"));
				od.setOd(Order);
				od.setQuantity(resultSet.getInt("quantity"));	
				o.add(od);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return o;
	}
	public static String diachi(String id) {
		String sql = "select * from users where id = '"+id+"'";
		String diachi = null;
		try {
			Connection con = DBconnect.getConnection();
			Statement s= con.createStatement();
			ResultSet resultSet = s.executeQuery(sql);
			
			while(resultSet.next()) {
				diachi = resultSet.getString("address");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return diachi;
	}
	public static int deleteDH(int id) {
		String sql = "DELETE FROM order_detail where order_id = '"+id+"' ";
		int i =0;
		try {
			Connection con = DBconnect.getConnection();
			Statement s= con.createStatement();
			i = s.executeUpdate(sql);
			int j =0;
			if(i >0) {
				String sql1 = "DELETE FROM orders where id = '"+id+"'";
				j = s.executeUpdate(sql);
				return i+j;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
//	public static List<product> getBestSeller() {
//		List<product> list = new ArrayList<product>();
//		String query = "select * from products, order_detail"
//				+ " where products.id = order_detail.product_id"
//				+ " group by order_detail.quantity DESC LIMIT 8";
//
//		try {
//			Connection con = DBconnect.getConnection();
////			ps = conn.prepareStatement(query);
////
////			rs = ps.executeQuery();
//			Statement s= con.createStatement();
//			ResultSet rs = s.executeQuery(query);
//			while (rs.next()) {
//				product p = new product();
//				p.setId(rs.getInt("id"));
//				p.setName(rs.getString("name"));
//				p.setAuthor(rs.getString("author"));
//				p.setPublisher(rs.getString("publisher"));
//				p.setImg(rs.getString("img"));
//				p.setPrice(rs.getFloat("price"));
//				p.setQuantity(rs.getInt("quantity"));
//				p.setDescription(rs.getString("description"));
//				list.add(p);
//			}
//			return list;
//		} catch (Exception e) {
//			// TODO: handle exception
//			System.out.print(e.getMessage());
//		}

//		return null;
//	}
	//lấy 8 sản phẩm bán chạy nhất
	public static List<product> getBestSeller() {
			List<product> list = new ArrayList<product>();
			String query = "select * from products, order_detail "
					+ "where products.id = order_detail.product_id"
					+ " group by order_detail.quantity DESC LIMIT 8";

			try {
				Connection con = DBconnect.getConnection();
				PreparedStatement ps = con.prepareStatement(query);
				
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					product p = new product();
					p.setId(rs.getInt("id"));
					p.setName(rs.getString("name"));
					p.setAuthor(rs.getString("author"));
					p.setPublisher(rs.getString("publisher"));
					p.setImg(rs.getString("img"));
					p.setPrice(rs.getFloat("price"));
					p.setQuantity(rs.getInt("quantity"));
					p.setDescription(rs.getString("description"));
					list.add(p);
				}
				return list;
			} catch (Exception e) {
				// TODO: handle exception
				System.out.print(e.getMessage());
			}

			return null;
		}

	public static void main(String[] args) {
		System.out.println(oderDAO.getBestSeller().size());
	}
}
