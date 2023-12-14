package controller;


import java.io.IOException;
//import jakarta.servlet.ServletException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;
import java.util.Random;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/*import com.mysql.cj.Session;*/
import model.User;
import model.Users;
import model.cartItem;

@WebServlet({"/accountServlet"})
public class accountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String OTP;
	@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
			switch(action) {
			case "Đăng nhập": this.doSignIn(req, resp); break;
			case "Đăng ký" : this.doSignUp(req,resp); break;
			case "Đăng xuất" : this.doLogout(req, resp); break;
			case "generateOTP": this.sendOTP(req, resp); break;
			case "Xác nhận": this.forgotPassword(req, resp); break;
			case "Cập nhật" : this.changProfile(req,resp); break;
			default: this.doPost(req, resp);
			}
		}
	private void changProfile(HttpServletRequest req, HttpServletResponse resp) {
	}
	private void doLogout(HttpServletRequest req, HttpServletResponse resp) {
		try {
			HttpSession session = req.getSession();
			if(session !=null) {
				session.removeAttribute("user");
				resp.sendRedirect("/ShopBanSach/view/login.jsp");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		}
		private String generateOTP() {
        
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000);
        return String.valueOf(otp);
    }
	private void sendOTP(HttpServletRequest req, HttpServletResponse resp) throws IOException {
			
			try {
			String email = req.getParameter("email");
			 OTP = generateOTP();
			 System.out.println(OTP);
			String from = "ShopBanSachNhom9@gmail.com";
			String pass = "bxux rtqq uhso hjzi";
			Properties props = new Properties();
			props.put("mail.smtp.host","smtp.gmail.com");
			props.put("mail.smtp.port","587");
			props.put("mail.smtp.auth","true");
			props.put("mail.smtp.starttls.enable","true");
			Authenticator auth = new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(from, pass);
				}
			};
			Session session = Session.getInstance(props,auth);
			MimeMessage msg = new MimeMessage(session);
			msg.addHeader("Content-type", "text/HTML;charset=UTF-8");
			msg.setFrom(from);
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
			msg.setSubject("OTP lấy lại mật khẩu");
			msg.setSentDate(new Date());
			msg.setText("Mã OTP : "+OTP,"UTF-8");
			resp.setContentType("text/plain");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write("Mã OTP đã được gửi đến " + email);
			Transport.send(msg);
			
			}catch(Exception e){
				e.printStackTrace();
			}
	}
	private void forgotPassword(HttpServletRequest req, HttpServletResponse resp)throws IOException, ServletException{
		String MaOTP = req.getParameter("otp");
		String password = req.getParameter("password-new");
		String email = req.getParameter("email");
		if(MaOTP.equalsIgnoreCase(OTP)){
		if(Users.findByEmail(email)!=null){
			User u = Users.findByEmail(email);
			System.out.println(u.getPassword());
			u.setPassword(password);
			if(Users.updateCustomer(u)>0){
				System.out.println(u.getPassword());
				System.out.println(password);
				resp.sendRedirect("/ShopBanSach/view/login.jsp");
			}
		}
		}
		else{
			req.setAttribute("email", email);
			req.setAttribute("password", password);
			req.setAttribute("MaOTP", MaOTP);
			req.setAttribute("error", "Mã OTP không chính xác");
			req.getRequestDispatcher("/view/forgot-password.jsp").forward(req, resp);
		}
	}
	private void doSignUp(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		String fullname = req.getParameter("fullname");
		String username = req.getParameter("username");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String address = req.getParameter("address");
		String phone =req.getParameter("phone");
		User u = new User(username,password,email,address,2,phone,fullname);
	if(Users.findByUsername(username) == null) {
		{
			if(Users.findByEmail(email)!=null){
				if(Users.findByPhone(phone)!=null){
			if(Users.addUser(u)>0) {
			resp.sendRedirect("/ShopBanSach/view/login.jsp");
			}
		}else{
			req.setAttribute("username", username);
		req.setAttribute("password", password);
		req.setAttribute("fullname", fullname);
		req.setAttribute("email", email);
		req.setAttribute("re_password", username);
		req.setAttribute("address", password);
		req.setAttribute("phone", phone);
		req.setAttribute("error", "Sô điện thoại đã được đăng ký!");
		req.getRequestDispatcher("/view/register.jsp").include(req, resp);
		}
	}else{
		req.setAttribute("username", username);
		req.setAttribute("password", password);
		req.setAttribute("fullname", fullname);
		req.setAttribute("email", email);
		req.setAttribute("re_password", username);
		req.setAttribute("address", password);
		req.setAttribute("phone", phone);
		req.setAttribute("error", "Email này đã được đăng ký!");
		req.getRequestDispatcher("/view/register.jsp").include(req, resp);
			}
		}
	}
	else {
		req.setAttribute("username", username);
		req.setAttribute("password", password);
		req.setAttribute("fullname", fullname);
		req.setAttribute("email", email);
		req.setAttribute("re_password", username);
		req.setAttribute("address", password);
		req.setAttribute("phone", phone);
		req.setAttribute("error", "Tên đăng nhập đã tồn tại!");
		req.getRequestDispatcher("/view/register.jsp").include(req, resp);
	}
	}
    private void doSignIn(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
    	HttpSession session = req.getSession();
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		try {
		User u = Users.findByUsername(username);
		if(u.getPassword().equalsIgnoreCase(password)) {
			HttpSession s = req.getSession();
			s.setAttribute("role_id", u.getRole_id());
			switch(u.getRole_id()) {
			case 1: 
				session.setAttribute("admin", u);
				resp.sendRedirect("/ShopBanSach/view/admin.jsp");
				
					break;
			case 2: 
				HttpSession sa = req.getSession();
				ArrayList<cartItem> cart_list = (ArrayList<cartItem>)sa.getAttribute("cart-list");
				if(cart_list!=null) {
					session.setAttribute("user", u);
					resp.sendRedirect("/ShopBanSach/view/order-detail.jsp");
				}
				else {
					session.setAttribute("user", u);
					resp.sendRedirect("/ShopBanSach/view/index.jsp");
				}
					break;
			case 3: 
				
				session.setAttribute("employee", u);
				resp.sendRedirect("/ShopBanSach/view/admin.jsp");
					break;
			}
		} else {
			req.setAttribute("username", username);
			req.setAttribute("password", password);
			req.setAttribute("error", "Sai mật khẩu");
			req.getRequestDispatcher("/view/login.jsp").include(req, resp);
		}
		} catch(Exception  e) {
			req.setAttribute("username", username);
			req.setAttribute("password", password);
			req.setAttribute("error", "Sai tên đăng nhập");
			req.getRequestDispatcher("/view/login.jsp").include(req, resp);
		}
	}
	public accountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
