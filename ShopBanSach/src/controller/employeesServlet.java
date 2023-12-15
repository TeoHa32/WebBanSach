package controller;

import java.util.ArrayList;
import java.util.List;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;

import model.User;
import model.Users;

/**
 * Servlet implementation class employeesServlet
 */
@WebServlet("/employeesServlet")
public class employeesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public employeesServlet() {
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
		String add = request.getParameter("btnEmployee");
		String delete =request.getParameter("btn-delete");
		String  update=request.getParameter("btnUpdateEmployee");
		String searchName=request.getParameter("btnSearch");
		if(add!=null) {
			addEmployees(request, response);
		}
		else if (delete!=null){
			deleteUser(request,response);
		}
		else if(update!=null) {
			update(request,response);
		}
		else if(searchName!=null) {
			searchName(request,response);
		}
	}
	

	private void searchName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String name=request.getParameter("search");
		String username=request.getParameter("search");
		if(name!=null) {
			if(!name.equals("")) {
			List<User> listUser = Users.serchUserByNameEmployees(name);
			List<User> listUsername=Users.serchUserByUserNameEmployees(username);
			
				if(!listUser.isEmpty()) {
					request.setAttribute("listSearch", listUser);
					request.setAttribute("search", "true");
					request.getRequestDispatcher("/view/admin.jsp?page=employees").forward(request, response);
				}
				else if(!listUsername.isEmpty()) {
					request.setAttribute("listSearch", listUsername);
					request.setAttribute("search", "true");
					request.getRequestDispatcher("/view/admin.jsp?page=employees").forward(request, response);
				}
				
				else {
					request.setAttribute("search", "false");
					request.getRequestDispatcher("/view/admin.jsp?page=employees").forward(request, response);
				}
			}else {
			response.sendRedirect("/ShopBanSach/view/admin.jsp?page=employees");
		}
			
		}
	}

	private void update(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String userName= request.getParameter("username");
		String name= request.getParameter("fullname");
		String passWord= request.getParameter("password");
		String email= request.getParameter("Email");
		String address= request.getParameter("Address");
		String phone=request.getParameter("phone");
		User u = new User(userName,passWord,email,address,3,phone,name);
		if(Users.updateEmployees(u)>0) {
			response.sendRedirect("/ShopBanSach/view/admin.jsp?page=employees");
		}
	}

	private void deleteUser(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String username=request.getParameter("username");
		if(Users.deleteUser(username)>0) {
			response.sendRedirect("/ShopBanSach/view/admin.jsp?page=employees");
		}
		
	}
	public void addEmployees(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String userName= request.getParameter("username");
		String name= request.getParameter("fullname");
		String passWord= request.getParameter("password");
		String email= request.getParameter("Email");
		String address= request.getParameter("Address");
		String phone=request.getParameter("phone");
		User u = new User(userName,passWord,email,address,3,phone,name);
		if(Users.addEmployees(u)>0) {
		response.sendRedirect("/ShopBanSach/view/admin.jsp?page=employees");
		}
	}
	
	

}
