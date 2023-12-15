package model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class products {
	public static void main(String[] args) {
	for(product p: products.searchProductByAuthor("Hà Bin dịch")) {
		System.out.println(p.name);
	}
	}
	public static List<product> searchProductByName(String name){
		Connection con = DBconnect.getConnection();
		try {
			String sql="SELECT * FROM products where name LIKE '%"+name+"%'";
			Statement stm = con.createStatement();
			List<product> listProduct = new ArrayList<product>();
			ResultSet rs = stm.executeQuery(sql);
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
				p.setOnsale(rs.getDouble("onsale"));
				p.setCategory_id(rs.getInt("category_id"));
				p.setSub_category_id(rs.getInt("Sub_category_id"));
				listProduct.add(p);
			}
			return listProduct;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static List<product> searchProductByAuthor(String author){
		
		Connection con = DBconnect.getConnection();
		try {
			String sql="SELECT * FROM products where author LIKE '%"+author+"%'";
			Statement stm = con.createStatement();
			List<product> listProduct = new ArrayList<product>();
			ResultSet rs = stm.executeQuery(sql);
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
				p.setOnsale(rs.getDouble("onsale"));
				p.setCategory_id(rs.getInt("category_id"));
				p.setSub_category_id(rs.getInt("Sub_category_id"));
				listProduct.add(p);
			}
			return listProduct;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public static List<product> loadProduct(){
		Connection con = DBconnect.getConnection();
		try {
			String sql="SELECT * FROM products";
			Statement stm = con.createStatement();
			List<product> listProduct = new ArrayList<product>();
			ResultSet rs = stm.executeQuery(sql);
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
				p.setOnsale(rs.getDouble("onsale"));
				p.setCategory_id(rs.getInt("category_id"));
				p.setSub_category_id(rs.getInt("Sub_category_id"));
				listProduct.add(p);
			}
			return listProduct;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public static int updateProduct(product p) {
		Connection con = DBconnect.getConnection();
		try {
			String sql = "UPDATE products SET name='"+p.getName()+"' , "+
						"author='"+p.getAuthor()+"' , "+
								"publisher='"+p.getPublisher()+"' , "+
										"img='"+p.getImg()+"' , "+
												"price="+p.getPrice()+" , "+
														"quantity="+p.getQuantity()+" , "+
																"description='"+p.getDescription()+"' , "+
																		"onsale="+p.getOnsale()+" , "+
																				"category_id="+p.getCategory_id()+" , "+
																						"Sub_category_id="+p.getSub_category_id()+" WHERE id="+p.getId();
			Statement st = con.createStatement();
			int i = st.executeUpdate(sql);
			 return i;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	public static int addProduct(product p) {
		Connection con = DBconnect.getConnection();
		try {
			String sql="INSERT INTO products (name, author, publisher, img, price, quantity, description, onsale, category_id, sub_category_id) VALUES ('"+p.getName()+"' , '"+p.getAuthor()+"' , '"+p.getPublisher()+"' , '"+p.getImg()+"' , "+p.getPrice()+" , "+p.getQuantity()+" , '"+p.getDescription()+"' , "+p.getOnsale()+" , "+p.getCategory_id()+" , "+p.getSub_category_id()+")";
			Statement stm = con.createStatement();
			int i=stm.executeUpdate(sql);
			return i;
		} catch(Exception e) {
			System.out.println("Lá»—i truy váº¥n");
		}
		return 0;
	}
	public static int deleteProduct(int id) {
		Connection con = DBconnect.getConnection();
		try {
			String sql = "DELETE from products where id="+id;
			Statement st = con.createStatement();
			int i = st.executeUpdate(sql);
			return i;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	public static product searchProductById(int idSearch){
		
		Connection con=DBconnect.getConnection();
		try {
			String sql="SELECT * FROM products WHERE id="+idSearch;
			Statement stm=con.createStatement();
			ResultSet rs=stm.executeQuery(sql);
			while(rs.next()) {
				int id=rs.getInt("id");
				String name =rs.getString("name");
				String author =rs.getString("author");
				String publisher =rs.getString("publisher");
				String img =rs.getString("img");
				String description =rs.getString("description");
				double price = rs.getDouble("price");
	            double onsale = rs.getDouble("onsale");
	            int quantity = rs.getInt("quantity");
	            int category_id = rs.getInt("category_id");
	            int sub_category_id = rs.getInt("sub_category_id");
	            product product=new product(id,name,author,publisher,img,description,price,quantity,onsale,
	            		category_id,sub_category_id);
	            return product;
			}
			rs.close();
			stm.close();
			con.close();
		}catch(Exception e){
			System.out.println("Lỗi truy vấn");
		}
		return null;
		
	}
}
