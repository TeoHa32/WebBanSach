<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/view/css/style.css">
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/view/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/view//fonts/fontawesome/css/all.css">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./fonts/fontawesome/css/all.css">
</head>
<body>

    <div id="wrapper">
        <!-- HEADER -->
        <%@include file="/view/template/header.jsp" %>
        <div id="wpcontent-user">
		<c:choose>
    <c:when test="${not empty sessionScope.user}">
        <h2>Bạn đã đăng nhập rồi!!</h2>
    </c:when>
    <c:otherwise>
        <div class="content-user-banner">
                <div class="banner-user">
					<img
						src="<%if( request.getContextPath()!=null) out.print(request.getContextPath()); %>/view/image/login.png"
						alt="">
				</div>
            </div>
            <div class="content-user-form ">
                
                <form action="/ShopBanSach/accountServlet" method="post">
                    <h1>Đăng nhập</h1>
                <p class="error">${error } </p>
                    <div>
                        <label for="username">Tên đăng nhập</label>
                        <input type="text" name="username" id="username" placeholder="Username?" value="${username}" required>
                    </div>
                    <div class="pw">
                        <label for="password">Mật khẩu</label>
                        <input type="password" name="password" id="password" placeholder="******" value="${password}" required>
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="eye eye-close">
  <path stroke-linecap="round" stroke-linejoin="round" d="M3.98 8.223A10.477 10.477 0 001.934 12C3.226 16.338 7.244 19.5 12 19.5c.993 0 1.953-.138 2.863-.395M6.228 6.228A10.45 10.45 0 0112 4.5c4.756 0 8.773 3.162 10.065 7.498a10.523 10.523 0 01-4.293 5.774M6.228 6.228L3 3m3.228 3.228l3.65 3.65m7.894 7.894L21 21m-3.228-3.228l-3.65-3.65m0 0a3 3 0 10-4.243-4.243m4.242 4.242L9.88 9.88" />
</svg>
                        
                       <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="eye eye-open hidden">
  <path stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178z" />
  <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
</svg> 

                    </div>
                    <div class="btn-user"><input type="submit" name="action" value="Đăng nhập"></div>
                </form>
                <div class="user-bottom">
                    <div class="forgot-password"><a href="/ShopBanSach/view/forgot-password.jsp">Quên mật khẩu?</a></div>
                    <div class="register-link"><a href="/ShopBanSach/view/register.jsp">Đăng ký</a></div>
                </div>
    </c:otherwise>
	</c:choose>
            </div>
        </div>
        
        <!-- FOOTER -->
        <%@include file="/view/template/footer.jsp" %>
    <script src="/ShopBanSach/view/js/account.js"></script>
</body>
</html>

