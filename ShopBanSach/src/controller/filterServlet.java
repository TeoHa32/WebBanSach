package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.product;
import model.productDAO;

/**
 * Servlet implementation class filterServlet
 */
@WebServlet("/filterServlet")
public class filterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public filterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String gia = request.getParameter("gia").toString();
		int id_loai = 0;
		productDAO dao = new productDAO();
		List<product> products = new ArrayList<product>();
		List<product> Products = new ArrayList<product>();
		
		 if(request.getParameter("id")!=null) {
			 id_loai = Integer.parseInt(request.getParameter("id").toString());
			 if (id_loai > 0)
					Products = dao.getAllByCategory(id_loai);
				else {
					Products = dao.getAll();
				}
		 }
		
		if (request.getParameter("gia") != null) {
			// Products = dao.getAll();
			if (gia.equals("tren")) {
				for (product c : Products) {
					if (c.getPrice() > 100000)
						products.add(c);
				}
			} else {
				for (product c : Products) {
					if (c.getPrice() < 100000)
						products.add(c);
				}
			}

		}
		if (products.size() == 0) {
			request.setAttribute("error", "Không tìm thấy sản phẩm!");
		} else
			request.setAttribute("sapxepsanpham", 1);
		if (request.getParameter("id_page") != null) {
			int id = Integer.parseInt(request.getParameter("id_page"));
			request.setAttribute("int_page", id);
		}
		if(id_loai > 0) {
			request.setAttribute("id_loaisp", id_loai);
		}
		request.setAttribute("gia", gia);
		request.setAttribute("products", products);

		request.getRequestDispatcher("/view/product.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String gia = request.getParameter("gia").toString();
		List<product> products = new ArrayList<product>();
		List<product> Products = new ArrayList<product>();
		// List<product> Products1 = new ArrayList<product>();
		productDAO dao = new productDAO();
		int id_loai = 0;
		if (request.getParameter("txtloai") != null) {
			id_loai = Integer.parseInt(request.getParameter("txtloai").toString());
			if (id_loai > 0)
				Products = dao.getAllByCategory(id_loai);
			else {
				Products = dao.getAll();
			}
		}

		if (request.getParameter("gia") != null) {
			if (gia.equals("tren")) {
				for (product c : Products) {
					if (c.getPrice() > 100000)
						products.add(c);
				}
			} else {
				for (product c : Products) {
					if (c.getPrice() < 100000)
						products.add(c);
				}
			}

		}
		if (products.size() == 0) {
			request.setAttribute("error", "Không tìm thấy sản phẩm!");
		} else
			request.setAttribute("sapxepsanpham", 1); /* dùng để phân trang */ 
		if (request.getParameter("id_page") != null) { // đã nhấn vào nút trang dưới phần phân trang
			int id = Integer.parseInt(request.getParameter("id_page"));
			request.setAttribute("int_page", id);
		}
		request.setAttribute("gia", gia); 
		if (request.getParameter("txtloai") != null) {
			request.setAttribute("id_loaisp", id_loai);
		}

		request.setAttribute("products", products);

		request.getRequestDispatcher("/view/product.jsp").forward(request, response);
	}

}
