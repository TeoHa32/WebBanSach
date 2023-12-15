package controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.oderDAO;

/**
 * Servlet implementation class statisticalServlet
 */
@WebServlet("/statisticalServlet")
public class statisticalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public statisticalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	req.setCharacterEncoding("UTF-8");
    	resp.setCharacterEncoding("UTF-8");
    	String action = req.getParameter("action");
    	if(action.equalsIgnoreCase("Xem")) {
    		String date = req.getParameter("date");
    		LocalDate ld = LocalDate.parse(date);
    		req.setAttribute("date", ld);
    		this.monthbycategoryid(req, resp);
    		this.threemonthbycategoryid(req, resp);
    		this.day(req, resp);
    		this.monthinyear(req, resp);
    		 req.getRequestDispatcher("/view/admin.jsp?page=statistical").forward(req, resp);
    	}
    	
    }
    private void day(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
   	 String date = req.getParameter("date");
	    	 double total_date = oderDAO.day(date);
	    	 req.setAttribute("total_date",total_date);
	    	
   }
    private void monthbycategoryid(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
    	 String date = req.getParameter("date");
    	 if(date!=null) {
    	 LocalDate ld = LocalDate.parse(date);
    	 int month = ld.getMonthValue();
    	 int year = ld.getYear();
	    	 double total_sgk = oderDAO.sumByCategory_id(1, month, year);
	    	 double total_snn = oderDAO.sumByCategory_id(2, month, year);
	    	 double total_tn = oderDAO.sumByCategory_id(3, month, year);
	    	 double total_vh = oderDAO.sumByCategory_id(4, month, year);
	    	 
	    	 double total = total_sgk+total_snn+total_tn+total_vh;
	    	 double sgk = (total_sgk/total)*100;
	    	 double snn = (total_snn/total)*100;
	    	 double tn = (total_tn/total)*100;
	    	 double vh = (total_vh/total)*100;
	    	 req.setAttribute("total", total);
	    	 req.setAttribute("sgk",sgk);
	    	 req.setAttribute("snn",snn);
	    	 req.setAttribute("tn",tn);
	    	 req.setAttribute("vh",vh);
    	 }
	    	
    }
    private void monthinyear(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
   	 String date = req.getParameter("date");
   	 if(date!=null) {
   	 LocalDate ld = LocalDate.parse(date);
   	 int year = ld.getYear();
	    	 double total_1 = oderDAO.monthinyear(1, year);
	    	 double total_2 = oderDAO.monthinyear(2, year);
	    	 double total_3 = oderDAO.monthinyear(3, year);
	    	 double total_4 = oderDAO.monthinyear(4, year);
	    	 double total_5 = oderDAO.monthinyear(5, year);
	    	 double total_6 = oderDAO.monthinyear(6, year);
	    	 double total_7 = oderDAO.monthinyear(7, year);
	    	 double total_8 = oderDAO.monthinyear(8, year);
	    	 double total_9 = oderDAO.monthinyear(9, year);
	    	 double total_10 = oderDAO.monthinyear(10, year);
	    	 double total_11 = oderDAO.monthinyear(11, year);
	    	 double total_12 = oderDAO.monthinyear(12, year);
	    	 double total = total_1+total_2+total_3+total_4+total_5+total_6+total_7+total_8+total_9+total_10+total_11+total_12;
	    	 req.setAttribute("total_1", total_1);
	    	 req.setAttribute("total_2", total_2);
	    	 req.setAttribute("total_3", total_3);
	    	 req.setAttribute("total_4", total_4);
	    	 req.setAttribute("total_5", total_5);
	    	 req.setAttribute("total_6", total_6);
	    	 req.setAttribute("total_7", total_7);
	    	 req.setAttribute("total_8", total_8);
	    	 req.setAttribute("total_9", total_9);
	    	 req.setAttribute("total_10", total_10);
	    	 req.setAttribute("total_11", total_11);
	    	 req.setAttribute("total_12", total_12);
	    	 req.setAttribute("totalYear", total);
   	 }
	    	
   }
    private void threemonthbycategoryid(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
   	 String date = req.getParameter("date");
   	 if(date!=null) {
   	 LocalDate ld = LocalDate.parse(date);
   	 int month = ld.getMonthValue();
   	 int year = ld.getYear();
   	 int quarter = 0;
   	 if(month == 1 || month==2 || month == 3) quarter=1;
   	if(month == 4 || month==5 || month == 6) quarter=2;
   	if(month == 7 || month==8 || month == 9) quarter=3;
   	if(month == 10 || month==11 || month == 12) quarter=4;
	    	 double total_sgk = oderDAO.threesumByCategory_id(1, quarter, year);
	    	 double total_snn = oderDAO.threesumByCategory_id(2, quarter, year);
	    	 double total_tn = oderDAO.threesumByCategory_id(3, quarter, year);
	    	 double total_vh = oderDAO.threesumByCategory_id(4, quarter , year);
	    	 double total = total_sgk+total_snn+total_tn+total_vh;
	    	 System.out.println(total);
	    	 double sgk = (total_sgk/total)*100;
	    	 double snn = (total_snn/total)*100;
	    	 double tn = (total_tn/total)*100;
	    	 double vh = (total_vh/total)*100;
	    	 req.setAttribute("total_quarter", total);
	    	 req.setAttribute("quarter",quarter);
	    	 req.setAttribute("sgk_quarter",sgk);
	    	 req.setAttribute("snn_quarter",snn);
	    	 req.setAttribute("tn_quarter",tn);
	    	 req.setAttribute("vh_quarter",vh);
   	 }
	    	
   }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
