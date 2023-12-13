package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DBconnect;
import model.User;
import model.cartItem;

/**
 * Servlet implementation class xulycart
 */
//@WebServlet("/xulycart")
@WebServlet(urlPatterns = {
		"/xulycart",
		"/deleteSL",
		"/delete",
		"/dathang",
})
public class xulycart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xulycart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		ArrayList<cartItem> cart_list = (ArrayList<cartItem>)session.getAttribute("cart-list");
		String uri = request.getRequestURI();
		if(uri.equals("/ShopBanSach/dathang")){
			HttpSession s = request.getSession();
			if(s !=null) {
				User username =  (User) s.getAttribute("user");
				if(!username.getUsername().equals("")) {
					 request.setAttribute("username",username.getUsername());
//					 request.get
//					 response.sendRedirect("/ShopBanSach/view/order-detail.jsp");
				 }
				 else {
					 request.setAttribute("username","123");
				 }
			}
			 
			 
		}
		else {
			int id = Integer.parseInt(request.getParameter("id"));
			int sl = Integer.parseInt(request.getParameter("sl"));
			for (cartItem c : cart_list) {
				System.out.println(c.getName());
			}
			for (cartItem c : cart_list) {
				
				if (c.getId() == id) {
					if(uri.equals("/ShopBanSach/xulycart"))
					{
						c.setQuantity(c.getQuantity() + 1);
						
					}
					else if(uri.equals("/ShopBanSach/deleteSL"))
					{
						if(c.getQuantity()!=1) {
							c.setQuantity(c.getQuantity() - 1);
						}
						
					}
					
				}
					
				}
			if(uri.equals("/ShopBanSach/delete")) {
				for(int i =0; i<cart_list.size();i++) {
					if(cart_list.get(i).getId()==id) 
						cart_list.remove(i);
					
				}
			}
				session.setAttribute("cart-list",cart_list);
				cart_list = (ArrayList<cartItem>)session.getAttribute("cart-list");
		}
	response.sendRedirect("/ShopBanSach/view/order-detail.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
