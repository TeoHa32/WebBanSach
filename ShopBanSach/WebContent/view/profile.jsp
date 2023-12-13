<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tài Khoản</title>
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
        <div class="content-user-banner">
                <div class="menu-profile">
					<ul>
                    <li> <a href="profile.jsp?page=myProfile">Thông tin tài khoản</a></li>
                    <li> <a href="profile.jsp?page=changePassword">Đổi mật khẩu </a></li>
                    </ul>
				</div>
            </div>
            <div class="content-user-form ">
            <% String pageParam = request.getParameter("page");
            if(pageParam!=null){
            if(pageParam.equalsIgnoreCase("myProfile"))
            {%>
            	<%@include file="/view/template/myProfile.jsp" %>
           <% }
            else if(pageParam.equalsIgnoreCase("changePassword")){
            	%>
            	<%@include file="/view/template/changePassword.jsp" %>
             <%}
            }
            %>
            </div>
        </div>
        
        <!-- FOOTER -->
        <%@include file="/view/template/footer.jsp" %>
    <script src="/ShopBanSach/view/js/account.js"></script>
</body>
</html>

