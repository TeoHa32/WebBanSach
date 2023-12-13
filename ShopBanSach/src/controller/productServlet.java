package controller;


import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.product;
import model.products;

@MultipartConfig
@WebServlet("/productServlet")
public class productServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("/view/admin.jsp").forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String add = request.getParameter("btAddProduct");
		String delete = request.getParameter("btn-delete");
		String update = request.getParameter("btEditProduct");
		if(add!=null) {
			addProduct(request, response);
		}
		else if(delete!=null){
			deleteProduct(request, response);
		}
		else if(update!=null){
			updateProduct(request, response);
		}
	}
	public void addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
	    String name = request.getParameter("txtName-product");
	    String author = request.getParameter("txtauthor-product");
	    String publisher = request.getParameter("txtpublisher-product");
	    File dir = new File("C:\\Users\\it200\\git\\doanj2ee\\j2ee\\ShopBanSach\\WebContent\\view\\image");
	    Part photo = request.getPart("img-product");
	        File photoFile = new File(dir, photo.getSubmittedFileName());
	        photoFile.createNewFile();
	        photo.write(photoFile.getAbsolutePath());
	    double price = Double.parseDouble(request.getParameter("price-product"));
	    double on_sale = Double.parseDouble(request.getParameter("onsale-product"));
	    int quantity = Integer.parseInt(request.getParameter("quantity-product"));
	    String description = request.getParameter("txtDescription-product");
	    int category_id = Integer.parseInt(request.getParameter("category"));
	    int sub_category_id = Integer.parseInt(request.getParameter("sub_category"));
	    product p = new product(name, author, publisher, photoFile.getName(), description, price, quantity, on_sale, category_id, sub_category_id);
	    products.addProduct(p);
	    response.sendRedirect("/ShopBanSach/view/admin.jsp?page=products");
	}
	public void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
	    int id = Integer.parseInt(request.getParameter("id"));
	    if(products.deleteProduct(id) >0) {
	    	response.sendRedirect("/ShopBanSach/view/admin.jsp?page=products");
	    }
	}
	public void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
	    int id = Integer.parseInt(request.getParameter("id_product"));
	    String name = request.getParameter("txtName-product");
	    String author = request.getParameter("txtauthor-product");
	    String publisher = request.getParameter("txtpublisher-product");
	    double price = Double.parseDouble(request.getParameter("price-product"));
	    double on_sale = Double.parseDouble(request.getParameter("onsale-product"));
	    int quantity = Integer.parseInt(request.getParameter("quantity-product"));
	    String description = request.getParameter("txtDescription-product");
	    int category_id = Integer.parseInt(request.getParameter("category"));
	    int sub_category_id = Integer.parseInt(request.getParameter("sub_category"));
	    
	    Part photo = request.getPart("img-product");
	    if(photo != null ) {
	    	File dir = new File("C:\\Users\\it200\\git\\doanj2ee\\j2ee\\ShopBanSach\\WebContent\\view\\image");
	        File photoFile = new File(dir, photo.getSubmittedFileName());
	        photoFile.createNewFile();
	        photo.write(photoFile.getAbsolutePath());
	    	product p = new product(id,name, author, publisher, photoFile.getName(), description, price, quantity, on_sale, category_id, sub_category_id);
		    if(products.updateProduct(p) >0) {
		    	response.sendRedirect("/ShopBanSach/view/admin.jsp?page=products");
		    }
	    }
	    else {
	    	String img  = products.searchProductById(id).getImg();
	    	product p = new product(id,name, author, publisher, img, description, price, quantity, on_sale, category_id, sub_category_id);
		    if(products.updateProduct(p) >0) {
		    	response.sendRedirect("/ShopBanSach/view/admin.jsp?page=products");
		    }
	    }
	}

}
