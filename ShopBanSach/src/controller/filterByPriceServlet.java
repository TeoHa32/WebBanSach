package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.product;
import model.productDAO;

/**
 * Servlet implementation class filterByPriceServlet
 */
@WebServlet("/filterByPriceServlet")
public class filterByPriceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		productDAO dao = new productDAO();
		
		String selectedOption = request.getParameter("gia");
		if (selectedOption != null) {
			if (selectedOption.equals("tren")) {
				List<product> products = dao.higherPrice();
				request.setAttribute("products", products);
			}
			else if (selectedOption.equals("duoi")) {
				List<product> products = dao.lowerPrice();
				request.setAttribute("products", products);
			}
		}
		request.getRequestDispatcher("/view/product.jsp").forward(request, response);
	}

}
