package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.product;
import model.productDAO;

/**
 * Servlet implementation class searchServlet
 */
@WebServlet("/searchServlet")
public class searchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* response.setContentType("text/html;charset=UTF-8"); */
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		productDAO dao = new productDAO();
    	String txtSearch = request.getParameter("search");
    	List<product> products = dao.searchByName(txtSearch);
    	request.setAttribute("products", products);
    	if(products.size() == 0 ) {
    		request.setAttribute("error", "Không tìm thấy sản phẩm!");
    	}
    	
		request.getRequestDispatcher("/view/product.jsp").forward(request, response);
	}

}
