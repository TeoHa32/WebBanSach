<%@page import="model.cartItem"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.User" %>
    
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <div id="header">
            <div class="logo"><a href="/ShopBanSach/view/index.jsp"><img class="img-logo" src="<%if( request.getContextPath()!=null) out.print(request.getContextPath()); %>/view/image/logo.png" alt=""></a></div>
            <div class="header-menu">
                <ul class="menu">
                    <li><a href="/ShopBanSach/view/index.jsp">Trang chủ</a></li>
                    <li><a href="/ShopBanSach/view/introduce.jsp">Giới thiệu</a></li>
                    <li><a href="/ShopBanSach/view/contact.jsp">Liên hệ</a></li>
                    <li><a href="/ShopBanSach/products/sanpham">Sản phẩm</a></li>
                </ul>
            </div>
            <div class="header-search">
                <form action="/ShopBanSach/searchServlet" method="post">
	                <input type="text" name="search" placeholder="Nhập thông tin tìm kiếm..." id="search-box" >
	                	<button type="submit" class="btn-search">
		                 <i class="fa-solid fa-magnifying-glass"></i>
                		</button>
                </form>
            </div>
            <div class="header-right">
                <div class="shopping-cart"><a href="/ShopBanSach/view/order-detail.jsp"><i class="fa-solid fa-cart-shopping"><span class="badge bg-danger px-1 py-0" style="position: relative; top: -10px;"><%
                		HttpSession se  = request.getSession();
    				if(se !=null) 
                		if(se.getAttribute("cart-list")!= null)
                		{ %>
                			${cart_list.size() }
                		<%}
                		else out.print(" ");
    				%></span></i></a></div>
                <%
                	HttpSession s = request.getSession();
                if(s!=null ){
                	if(s.getAttribute("user")!=null){
                		User u = (User) s.getAttribute("user");
                		out.print("<div class='user'>");
                		out.print("<div class='username' onclick='toggleDropdown()'><span>"+u.getName()+"</span> <i class='fa-solid fa-caret-down'>"+"</i></div>");
                		out.print("<div id='myDropdown' class='dropdown-content'>");
                		out.print("<div class='user-content'><span><a href='/ShopBanSach/view/profile.jsp'>Tài khoản</a></span> <i class='fa-solid fa-user'></i></div>");
                		out.print("<div class='user-content'><span><a href='/ShopBanSach/view/history.jsp'>Lịch sử đặt hàng</a></span> <i class='fa-solid fa-clock-rotate-left'></i></div>");
                		out.print("<div class='user-content'><span><a href='/ShopBanSach/accountServlet?action=logout'>Đăng xuất</a></span><i class='fa-solid fa-right-from-bracket'></i></div>");
                		out.print("</div>");
                		out.print("</div>");
                	}
                	else{
                		out.print("<div class='user'><a href='/ShopBanSach/view/login.jsp'> <i class='fa-regular fa-user'></i></a></div>");
                	}
                	
                }

                %>
           
            </div>
        </div>
       

    