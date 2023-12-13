package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.product;
import model.productDAO;

/**
 * Servlet implementation class productDetailServlet
 */

//@WebServlet("/productDetailServlet")
@WebServlet(urlPatterns = {
		"/products/sanpham",
		"/products/loai",
		"/products/trang",
		"/products/tieng-anh",
		"/products/tieng-nhat",
		"/products/truyen-tranh",
		"/products/ky-nang-song",
		"/products/tieu-thuyet",
		"/products/truyen-ngan",
		"/products/low-to-high",
		"/products/high-to-low",
		"/products/detail",
})
public class productDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    
			if(req.getAttribute("myList")!=null) {
				ArrayList<product> myList = (ArrayList<product>)req.getAttribute("myList");
				System.out.println(myList.size());
				myList.sort(Comparator.comparing(product::getPrice));
		        
				req.setAttribute("products", myList);
			}
			req.getRequestDispatcher("/view/product.jsp").forward(req, resp);
			
    }
    
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		productDAO dao = new productDAO();
		String uri = request.getRequestURI();
		if(uri.contains("productDetailServlet")) {
			List<product> products = dao.getAll();
			request.setAttribute("products", products);
			request.getRequestDispatcher("/view/product.jsp").forward(request, response);
		}
		else if(uri.contains("sanpham")) {
			//List<product> products = dao.getAllByCategory(1);
			List<product> products = dao.getAll();
			request.setAttribute("products", products);
			request.getRequestDispatcher("/view/product.jsp").forward(request, response);
		}
		else if(uri.contains("trang")) {
			List<product> products = dao.getAll();
			request.setAttribute("products", products);
			
			int id = Integer.parseInt(request.getParameter("id_page"));
			
			request.setAttribute("int_page", id);
			request.getRequestDispatcher("/view/product.jsp").forward(request, response);
		}
		else if(uri.contains("loai")) {
			int id = Integer.parseInt(request.getParameter("id"));
			if(request.getParameter("id_page")!=null ) {
				int id_page = Integer.parseInt(request.getParameter("id_page"));
				request.setAttribute("int_page", id_page);
			}
			List<product> products = dao.getAllByCategory(id);
			request.setAttribute("id_loaisp", id);
			request.setAttribute("loai", 1);
			request.setAttribute("products", products);
			request.getRequestDispatcher("/view/product.jsp").forward(request, response);
		}

		else if(uri.contains("low-to-high")) {
			String sort1 = request.getParameter("sort");
			List<product> products =null;
			if(sort1.equals("1")) {
				products = dao.getAll();
				products.sort(Comparator.comparing(product::getPrice));
				request.setAttribute("products", products);
				if(request.getParameter("id_page")!=null) {
					int id = Integer.parseInt(request.getParameter("id_page"));
					request.setAttribute("int_page", id);
				}
				
			}
			else if(sort1.equals("lowtohigh") ) {
				int id = Integer.parseInt(request.getParameter("id"));
				if(request.getParameter("id_page")!=null ) {
						int id_page = Integer.parseInt(request.getParameter("id_page"));
						request.setAttribute("int_page", id_page);
				}
				products = dao.getAllByCategory(id);
				products.sort(Comparator.comparing(product::getPrice));
				request.setAttribute("id_loaisp", id);
				request.setAttribute("loai", 1);
				request.setAttribute("products", products);
			}
			
			request.setAttribute("sapxep", "1");
			request.getRequestDispatcher("/view/product.jsp").forward(request, response);
		
		}
		else if(uri.contains("high-to-low")) {
			String sort1 = request.getParameter("sort");
			List<product> products =null; 
			if(sort1.equals("1")) {
				products = dao.getAll();
				products.sort(Comparator.comparing(product::getPrice).reversed());
				request.setAttribute("products", products);
				if(request.getParameter("id_page")!=null) {
					int id = Integer.parseInt(request.getParameter("id_page"));
					request.setAttribute("int_page", id);
				}
			}
			else if(sort1.equals("hightolow") ) {
				int id = Integer.parseInt(request.getParameter("id"));
				if(request.getParameter("id_page")!=null ) {
						int id_page = Integer.parseInt(request.getParameter("id_page"));
						request.setAttribute("int_page", id_page);
				}
				products = dao.getAllByCategory(id);
				products.sort(Comparator.comparing(product::getPrice).reversed());
				request.setAttribute("id_loaisp", id);
				request.setAttribute("loai", 1);
				request.setAttribute("products", products);
			}
			
//			String pageidStr = request.getParameter("pageid");
//			int pageid = Integer.parseInt(pageidStr);
//			int count = 8;
//			int numrows = dao.numRows();
//			
//			int maxPageid = (numrows / count ) ;
//			
//			if(pageid ==  1) {
//				
//			}
//			else {
//				pageid = pageid - 1;
//				pageid = pageid * count + 1;
//			}
//			
//			request.setAttribute("numpage", Integer.parseInt(pageidStr));
//			request.setAttribute("maxPageid", maxPageid);
			
			//List<product> products = dao.sortPriceHighToLow(pageid, count );
			request.setAttribute("high_to_low", 1);
			//request.setAttribute("products", products);
			request.getRequestDispatcher("/view/product.jsp").forward(request, response);
		}
		else if (uri.contains("detail")){
			String id = request.getParameter("id");
			product sp = new product();
			sp = dao.getDetail(id);
		//	request.setAttribute("high_to_low", 1);
			request.getRequestDispatcher("/view/product.jsp").forward(request, response);
		}
	}

	public static void main(String[] args) {
		
	}

}
