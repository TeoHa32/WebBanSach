package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;

public class oderDAO {
	public static void main(String[] args) {
		System.out.println(oderDAO.threesumByCategory_id(1, 4,2023));
	}

	public static int addorder(order d) {
		String sql = "INSERT INTO orders (user_id, order_date, confirm, payments, shipping_method,diachinhanhang) VALUES ('"
				+ d.getUser_id() + "','" + d.getOrder_date() + "','" + d.getconfirm() + "','sau khi nhan hang','"
				+ d.getShipping_method() + "','" + d.getDiachinhanhang() + "')";
		try {
			Connection con = DBconnect.getConnection();
			Statement s = con.createStatement();
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

	public static ArrayList<order> loadOrders() {

		Connection con = DBconnect.getConnection();
		try {

			String sql = "SELECT * FROM orders JOIN order_detail ON orders.id = order_detail.order_id GROUP BY orders.id";
			Statement st = con.createStatement();
			ArrayList<order> listOrders = new ArrayList<order>();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				Timestamp timestamp = rs.getTimestamp("order_date");
				LocalDateTime order_date = timestamp.toLocalDateTime();
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
				String formattedOrderDate = order_date.format(formatter);
				LocalDateTime convertedDateTime = LocalDateTime.parse(formattedOrderDate, formatter);
				order order = new order();
				order.setId(rs.getInt("id"));
				order.setUser_id(rs.getString("user_id"));
				order.setOrder_date(convertedDateTime);
				order.setConfirm(rs.getInt("confirm"));
				order.setShipping_method(rs.getString("shipping_method"));
				listOrders.add(order);
			}
			return listOrders;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static int updateConfirm(order order) {
		Connection con = DBconnect.getConnection();
		try {
			String sql = "UPDATE orders SET confirm='" + order.getConfirm() + "'WHERE id=" + order.getId();

			Statement st = con.createStatement();
			int i = st.executeUpdate(sql);
			return i;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public static int deleteOrder(int id) {
		Connection con = DBconnect.getConnection();
		try {
			String sql = "DELETE FROM order_detail WHERE order_id =" + id + "";
			String sql1 = "DELETE FROM orders WHERE id =" + id + "";
			Statement st = con.createStatement();
			int i = st.executeUpdate(sql);
			if (i > 0) {
				int j = st.executeUpdate(sql1);
				return j;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public static ArrayList<order> searchOrders(String user_id) {

		Connection con = DBconnect.getConnection();
		try {

			String sql = "SELECT * FROM  orders JOIN order_detail ON orders.id = order_detail.order_id where orders.user_id LIKE '%"
					+ user_id + "%' GROUP BY orders.id ";
			Statement st = con.createStatement();
			ArrayList<order> listOrders = new ArrayList<order>();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				Timestamp timestamp = rs.getTimestamp("order_date");
				LocalDateTime order_date = timestamp.toLocalDateTime();
				order order = new order();
				order.setId(rs.getInt("id"));
				order.setUser_id(rs.getString("user_id"));
				order.setOrder_date(order_date);
				order.setConfirm(rs.getInt("confirm"));
				order.setShipping_method(rs.getString("shipping_method"));
				listOrders.add(order);
			}
			return listOrders;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static double sumByCategory_id(int id, int month , int year) {
		Connection con = DBconnect.getConnection();
		double total = 0;
		try {
			String sql = "SELECT SUM(order_detail.quantity * order_detail.price) AS total FROM products JOIN order_detail "+
						"ON order_detail.product_id = products.id JOIN categories ON products.category_id = categories.id "+
					"JOIN orders ON orders.id = order_detail.order_id WHERE categories.id = "+id
					+" AND MONTH(orders.order_date)= "+month+" AND YEAR(orders.order_date) = "+year+"";
			Statement st = con.createStatement();
			ResultSet  rs = st.executeQuery(sql);
			while(rs.next()) {
				total = rs.getDouble("total");
			}
			return total;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return total;
	}
	public static double threesumByCategory_id(int id, int QUARTER , int year) {
		Connection con = DBconnect.getConnection();
		double total = 0;
		try {
			String sql = "SELECT SUM(order_detail.quantity * order_detail.price) AS total FROM products JOIN order_detail ON"
					+" order_detail.product_id = products.id JOIN categories ON products.category_id = categories.id "
					+"JOIN orders ON orders.id = order_detail.order_id WHERE categories.id = "+id+" AND (QUARTER(orders.order_date) = "+QUARTER+" ) "
					+"AND YEAR(orders.order_date) = "+year+"";
			Statement st = con.createStatement();
			ResultSet  rs = st.executeQuery(sql);
			while(rs.next()) {
				total = rs.getDouble("total");
			}
			return total;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return total;
	}
	public static double day(String date) {
		Connection con = DBconnect.getConnection();
		double total = 0;
		try {
			String sql = "SELECT SUM(order_detail.quantity * order_detail.price) AS total FROM products JOIN order_detail ON order_detail.product_id = products.id JOIN orders ON orders.id = order_detail.order_id WHERE orders.order_date LIKE '%"+date+"%'";
			Statement st = con.createStatement();
			ResultSet  rs = st.executeQuery(sql);
			while(rs.next()) {
				total = rs.getDouble("total");
			}
			return total;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return total;
	}
	public static double monthinyear(int month, int year) {
		Connection con = DBconnect.getConnection();
		double total = 0;
		try {
			String sql = "SELECT SUM(order_detail.quantity * order_detail.price) AS total FROM products JOIN order_detail ON order_detail.product_id = products.id JOIN orders ON orders.id = order_detail.order_id WHERE MONTH(orders.order_date) = "+month+" AND YEAR(orders.order_date)="+year+"";
			Statement st = con.createStatement();
			ResultSet  rs = st.executeQuery(sql);
			while(rs.next()) {
				total = rs.getDouble("total");
			}
			return total;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return total;
	}
	public static ArrayList<order> searchOrder_date(String Order_date) {

		Connection con = DBconnect.getConnection();
		try {

			String sql = "SELECT * FROM orders where order_date LIKE '%" + Order_date + "%'";
			Statement st = con.createStatement();
			ArrayList<order> listOrders = new ArrayList<order>();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				Timestamp timestamp = rs.getTimestamp("order_date");
				LocalDateTime order_date = timestamp.toLocalDateTime();
				order order = new order();
				order.setId(rs.getInt("id"));
				order.setUser_id(rs.getString("user_id"));
				order.setOrder_date(order_date);
				order.setConfirm(rs.getInt("confirm"));
				order.setShipping_method(rs.getString("shipping_method"));
				listOrders.add(order);

			}
			return listOrders;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static int addorderdetail(order d, orderDetail r) {

		String string = "SELECT 	id FROM orders ORDER BY id DESC LIMIT 1";
		try {
			Connection con = DBconnect.getConnection();
			Statement s = con.createStatement();
			ResultSet resultSet = s.executeQuery(string);
			int i = 0;
			while (resultSet.next()) {
				i = resultSet.getInt("id");
			}
			int j = 0;
			if (i > 0) {
				String sql1 = "INSERT INTO order_detail (order_id, product_id, quantity, price) VALUES ('" + i + "','"
						+ r.getId() + "','" + r.getQuantity() + "','" + r.getPrice() + "')";
				j = s.executeUpdate(sql1);
			}
			return j;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public static List<orderDetail> getALLOrder() {
		List<orderDetail> o = new ArrayList<orderDetail>();
		String sql = "SELECT * FROM orders INNER JOIN order_detail ON orders.id = order_detail.order_id JOIN products ON order_detail.product_id = products.id;";
		try {
			Connection con = DBconnect.getConnection();
			Statement s = con.createStatement();
			ResultSet resultSet = s.executeQuery(sql);

			while (resultSet.next()) {
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
		String sql = "select * from users where id = '" + id + "'";
		String diachi = null;
		try {
			Connection con = DBconnect.getConnection();
			Statement s = con.createStatement();
			ResultSet resultSet = s.executeQuery(sql);

			while (resultSet.next()) {
				diachi = resultSet.getString("address");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return diachi;
	}

	public static int deleteDH(int id) {
		String sql = "DELETE FROM order_detail where order_id = '" + id + "' ";
		int i = 0;
		try {
			Connection con = DBconnect.getConnection();
			Statement s = con.createStatement();
			i = s.executeUpdate(sql);
			int j = 0;
			if (i > 0) {
				String sql1 = "DELETE FROM orders where id = '" + id + "'";
				j = s.executeUpdate(sql);
				return i + j;
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
	// lấy 8 sản phẩm bán chạy nhất
	public static List<product> getBestSeller() {
		List<product> list = new ArrayList<product>();
		String query = "select * from products, order_detail " + "where products.id = order_detail.product_id"
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

}
