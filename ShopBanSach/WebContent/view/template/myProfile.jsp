<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<form action="/ShopBanSach/accountServlet" method="post">

                    <h1>Thông tin tài khoản</h1>
                    <%
                    User u = new User();
                    if(s!=null){
                    	if(s.getAttribute("user")!=null){
                    		u = (User)s.getAttribute("user");
                    	}
                    } %>
                    
                <p class="error">${error } </p>
                
                    <div>
                        <label for="username">Tên đăng nhập</label>
                        <label  ><%if(u.getUsername() !=null) out.print(u.getUsername()); %></label>
                    </div>
                   <div>
                        <label for="email">Email</label>
                        <input type="text" name="email" id="email"  value="<%if(u.getEmail() !=null) out.print(u.getEmail()); %>" >
                    </div>
                    <div>
                        <label for="phone">Số điện thoại</label>
                        <input type="text" name="phone" id="phone"  value="<%if(u.getPhone() !=null) out.print(u.getPhone()); %>" >
                    </div>
                    <div>
                        <label for="address">Địa chỉ</label>
                        <input type="text" name="address" id="address"  value="<%if(u.getAddress() !=null) out.print(u.getAddress()); %>">
                    </div>
                    <div class="btn-user"><input type="submit" name="action" value="Cập nhật"></div>
                </form>