package controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.oderDAO;

/**
 * Servlet implementation class historyServlet
 */
@WebServlet("/historyServlet")
public class historyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public historyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	request.getRequestDispatcher("/view/index.jsp").forward(request, response);
		int id = Integer.parseInt(request.getParameter("idod"));
		int i = oderDAO.deleteDH(id);
		String mess = null;
		if(i >0) {
			 mess ="successful";
			//request.setAttribute("mess",mess);
		}
		else {
			 mess ="Unable";
			//request.setAttribute("mess",mess);
		}
		 response.sendRedirect("/ShopBanSach/view/history.jsp?mess=" + URLEncoder.encode(mess, "UTF-8"));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
