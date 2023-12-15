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

import model.User;
import model.Users;

/**
 * Servlet implementation class customersServlet
 */
@WebServlet("/customersServlet")
public class customersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public customersServlet() {
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
		request.getRequestDispatcher("/view/admin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String delete =request.getParameter("btn-delete");
		String searchName=request.getParameter("btnSearch");
		 if(delete!=null) {
			deleteUser(request,response);
		}
		 else if(searchName!=null) {
				searchName(request,response);
			}
	}

	private void searchName(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String name=request.getParameter("search");
		
		if(name!=null) {
			if(!name.equals("")) {
			List<User> listUser = Users.serchUserByNameCustomers(name);
			List<User>listUserName=Users.serchUserByUserNameCustomers(name);
				if(!listUser.isEmpty()) {
					request.setAttribute("listSearch", listUser);
					request.setAttribute("search", "true");
					request.getRequestDispatcher("/view/admin.jsp?page=customers").forward(request, response);
				}
				else if(!listUserName.isEmpty()) {
					request.setAttribute("listSearch", listUserName);
					request.setAttribute("search", "true");
					request.getRequestDispatcher("/view/admin.jsp?page=customers").forward(request, response);
				}
				
				else {
					request.setAttribute("search", "false");
					request.getRequestDispatcher("/view/admin.jsp?page=customers").forward(request, response);
				}
			}else {
			response.sendRedirect("/ShopBanSach/view/admin.jsp?page=customers");
		}
			
		}
	}

	private void deleteUser(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String username=request.getParameter("username");
		if(Users.deleteUser(username)>0) {
			response.sendRedirect("/ShopBanSach/view/admin.jsp?page=customers");
		}
	}


	
}
