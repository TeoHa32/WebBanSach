package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.order;
import model.oderDAO;
/**
 * Servlet implementation class ordersAdminServlet
 */
@WebServlet("/ordersAdminServlet")
public class ordersAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ordersAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		 String Action=request.getParameter("action");
		
		if(Action!=null) {
			CheckConfirm(request, response);
		}
		
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String searchUser_id=request.getParameter("btnSearch");
		String Delete =request.getParameter("btn-delete");
		if(searchUser_id!=null) {
			searchUser_id(request,response);
		}
		else if(Delete!=null) {
			deleteOrder(request,response);
		}
		
	}
	private void deleteOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int id=Integer.parseInt(request.getParameter("id"));
		if(oderDAO.deleteOrder(id)>0) {
			response.sendRedirect("/ShopBanSach/view/admin.jsp?page=orders");
		}
	}

	private void searchUser_id(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String searchOrder=request.getParameter("search");
		
		if(searchOrder!=null) {
			if(!searchOrder.equals("")) {
				List<order>list=oderDAO.searchOrders(searchOrder);
				List<order>listDate=oderDAO.searchOrder_date(searchOrder);
				 if(!list.isEmpty()) {
				    	request.setAttribute("listSearch", list);
				    	request.setAttribute("search", "true");
				    	request.getRequestDispatcher("/view/admin.jsp?page=orders").forward(request, response);
				    	
				    }
				 else if(!listDate.isEmpty()) {
					 request.setAttribute("listSearch", listDate);
				    	request.setAttribute("search", "true");
				    	request.getRequestDispatcher("/view/admin.jsp?page=orders").forward(request, response);
				 }

				    else {
				    	request.setAttribute("search", "false");
				    	request.getRequestDispatcher("/view/admin.jsp?page=orders").forward(request, response);
				    }
			}else {
				response.sendRedirect("/ShopBanSach/view/admin.jsp?page=orders ");
			}
		}
	}

	protected void CheckConfirm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ArrayList<order>listOrder=oderDAO.loadOrders();
		int id=Integer.parseInt(request.getParameter("id"));
		for(order order:listOrder) {
			if (order.getId()==id) {
					order.setConfirm(1);
					oderDAO.updateConfirm(order);
					response.sendRedirect("/ShopBanSach/view/admin.jsp?page=orders");
					break;
			}
			
		}
			
		
	}
}
