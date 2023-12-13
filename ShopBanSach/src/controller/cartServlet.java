package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.cartItem;
import model.product;


/**
 * Servlet implementation class cartServlet
 */
@WebServlet("/cartServlet")
public class cartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		try(PrintWriter out = response.getWriter()){
			ArrayList<cartItem> item = new ArrayList<>();
			int id = Integer.parseInt(request.getParameter("id"));
			int slsp = Integer.parseInt(request.getParameter("id_sl"));
			cartItem ct = new cartItem();
			ct.setId(id);
			if(slsp > 1)
				ct.setQuantity(slsp);
			else ct.setQuantity(1);
			HttpSession session = request.getSession();
			
			ArrayList<cartItem> cart_list = (ArrayList<cartItem>)session.getAttribute("cart-list");
			if (cart_list==null) {
				//Khong co san pham nao trong cart- Session dc tao
				item.add(ct);
				session.setAttribute("cart-list",item);	
				response.sendRedirect("./products/sanpham");
			} else {
				//Da co san pham trong cart				
				item = cart_list;
				boolean exist = false;	
				//fdffdfdf
				//Kt sp co ton tai khong
				for (cartItem c : cart_list) {
					if (c.getId() == id) {
						if(slsp >1) {
							c.setQuantity(c.getQuantity() + slsp);
							exist = true;
						}
						else {
							c.setQuantity(c.getQuantity() + 1);
							exist = true;
						}
						
					}
				}
				//Neu khong ton tai thi dc them
				if(!exist) {
					item.add(ct);					
					session.setAttribute("cart-list",item);					
				}
				response.sendRedirect("./products/sanpham");
			}						
		}		
	}
}