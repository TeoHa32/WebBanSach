package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class productDAO {

	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	
	public List<product> getAll(){
		if(conn !=null) {
			DBconnect.closeConnection(conn);
		}
		List<product> list = new ArrayList<product>();
		String query = "select * from products";
		
		try {
			conn = DBconnect.getConnection();
			ps = conn.prepareStatement(query);
			
			rs = ps.executeQuery();
			while(rs.next()) {
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
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.print("Lỗi truy vấn!");
		}
		
		return null;
	}
	
	//Tìm kiếm sản phẩm theo tên
	public List<product> searchByName(String input){
		if(conn !=null) {
			DBconnect.closeConnection(conn);
		}
		List<product> list = new ArrayList<product>();
		String query = "select * from products where products.name like '%" +input+" %'";
		
		try {
			conn = DBconnect.getConnection();
			ps = conn.prepareStatement(query);
			
			rs = ps.executeQuery();
		
			while(rs.next()) {
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
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.print("Lỗi truy vấn!");
		}
		
		return null;
	}
	
	// Lấy 8 sản phẩm mới nhất
	public List<product> getLatestProducts() {
		List<product> list = new ArrayList<product>();
		String query = "SELECT * FROM products ORDER BY id DESC LIMIT 8";

		try {
			conn = DBconnect.getConnection();
			ps = conn.prepareStatement(query);

			rs = ps.executeQuery();
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
			System.out.print("Lỗi truy vấn!");
		}

		return null;
	}
	
	//lấy 8 sản phẩm bán chạy nhất
	public List<product> getBestSeller() {
		List<product> list = new ArrayList<product>();
		String query = "select *, sum(order_detail.quantity) as total from products, order_detail where products.id = order_detail.product_id group by products.name order by total DESC LIMIT 8";

		try {
			conn = DBconnect.getConnection();
			ps = conn.prepareStatement(query);

			rs = ps.executeQuery();
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
			System.out.print("Lỗi truy vấn!");
		}

		return null;
	}
	
	public List<product> getAllByCategory(int id){
		if(conn !=null) {
			DBconnect.closeConnection(conn);
		}
		List<product> list = new ArrayList<product>();
		String query = "select * from products where Sub_category_id = " + id;
		
		try {
			conn = DBconnect.getConnection();
			ps = conn.prepareStatement(query);
			
			rs = ps.executeQuery();
			while(rs.next()) {
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
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.print("Lỗi truy vấn!");
		}
		
		return null;
	}
	
	
	public product getDetail(String id){
		
		String query = "select * from products where id = " +id;
		product p = new product();

		try {
			conn = DBconnect.getConnection();
			ps = conn.prepareStatement(query);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				p.setName(rs.getString("name"));
				p.setAuthor(rs.getString("author"));
				p.setPublisher(rs.getString("publisher"));
				p.setImg(rs.getString("img"));
				p.setPrice(rs.getFloat("price"));
				p.setQuantity(rs.getInt("quantity"));
				p.setDescription(rs.getString("description"));
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.print("Lỗi truy vấn!");
		}
		
		return p;
	}
	public static List<cartItem> getCartProducts(ArrayList<cartItem> item){
		List<cartItem> pr = new ArrayList<cartItem>();
		Connection conn = DBconnect.getConnection();
		try {
			if(item.size()>0) {
				for(cartItem ci : item) {
					String query = "select * from products where id=?";
					PreparedStatement ps = conn.prepareStatement(query);
					ps.setInt(1, ci.getId());
					ResultSet rs = ps.executeQuery();
					while(rs.next()) {
						cartItem row = new cartItem();
						row.setId(rs.getInt("id"));		
						row.setAuthor(rs.getString("author"));
						row.setImg(rs.getString("img"));
						row.setName(rs.getString("name"));
						row.setQuantity(rs.getInt("quantity"));
						row.setPrice(rs.getDouble("price"));
						row.setQuantity(ci.getQuantity());
						pr.add(row);
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return pr;		
	}

}
