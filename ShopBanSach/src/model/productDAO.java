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
	
	
	//Đếm tổng số lượng các sp trong db
	
	public int numRows() {
		int count = 0;
		String query = "select count(products.id) from products;";
		
		try {
			conn = DBconnect.getConnection();
			ps = conn.prepareStatement(query);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}
			return count;
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.print("Lỗi truy vấn!");
		}
		
		return count;
	
	}
	
	//lọc sp thấp -> cao
	public List<product> sortPriceLowToHigh(){
		List<product> list = new ArrayList<product>();
		String query = "select * from products order by price asc";
		
		try {
			conn = DBconnect.getConnection();
			ps = conn.prepareStatement(query);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				product p = new product();
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
	
	//Sản phẩm trên 100.000VNĐ
	public List<product> higherPrice(){
		List<product> list = new ArrayList<product>();
		String query = "SELECT * from products where products.price > 100000";
		
		try {
			conn = DBconnect.getConnection();
			ps = conn.prepareStatement(query);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				product p = new product();
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
	
	
	//Sản phẩm dưới 100.000VNĐ
		public List<product> lowerPrice(){
			List<product> list = new ArrayList<product>();
			String query = "SELECT * from products where products.price < 100000";
			
			try {
				conn = DBconnect.getConnection();
				ps = conn.prepareStatement(query);
				
				rs = ps.executeQuery();
				while(rs.next()) {
					product p = new product();
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
	//lọc sp cao -> thấp
	public List<product> sortPriceHighToLow(){
		List<product> list = new ArrayList<product>();
		String query = "select * from products order by price desc ";
		
		try {
			conn = DBconnect.getConnection();
			ps = conn.prepareStatement(query);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				product p = new product();
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
	
	
	public static void main(String[] args) {

		
		productDAO dao = new productDAO();
		List<product> list = dao.higherPrice();
		for(product p : list) {
			System.out.println(p.name);
			System.out.println(p.author);
			System.out.println(p.publisher);
			System.out.println(p.price);
			System.out.println("=================================");
			
		}
		
//		productDAO dao = new productDAO();
//		List<product> sp = dao.getBestSeller();
//		System.out.println(sp.size());
		
//		System.out.println(dao.numRows());
		
		
	}
}
