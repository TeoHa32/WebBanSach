<%@ page language="java" 
    pageEncoding="UTF-8"%>
    <%@ page import="model.category" %>
    <%@ page import="model.sub_category" %>
    <%@ page import="model.categories" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/ShopBanSach/view/css/admin.css">
    <link rel="stylesheet" href="/ShopBanSach/view/fonts/fontawesome/css/all.css">
    <title>Trang Admin</title>
</head>
<body>
	 <c:choose>
        <c:when test="${not empty sessionScope['admin'] or not empty sessionScope['employee']}">
            <c:if test="${not empty sessionScope['admin']}">
                <header> TRANG QUẢN TRỊ</header>
    <div class="content"> </div>
    <div class="left-content">
        <ul id="menu">
            <li><a href="/ShopBanSach/view/admin.jsp?page=products"> Quản lý sản phẩm</a></li>
            <li ><a href="/ShopBanSach/view/admin.jsp?page=employees">Quản lý nhân viên</a></li>
            <li ><a href="/ShopBanSach/view/admin.jsp?page=customers">Quản lý khách hàng</a></li>
            <li ><a href="/ShopBanSach/view/admin.jsp?page=orders">Quản lý đơn hàng</a></li>
            <li ><a href="/ShopBanSach/statisticalServlet?page=statistical&date=<%= java.time.LocalDate.now() %>&action=Xem">Thống kê</a></li>
            <li ><a href="/ShopBanSach/accountServlet?action=exit">Thoát</a></li>
        </ul>
    </div>
    <% 
    String pageParam = request.getParameter("page");
    if(pageParam != null){
    if ( pageParam.equals("products")) {
        %>
        <%@include file="/view/template/product.jsp" %>
        <% 
    } 
    else if(pageParam.equals("employees")){ %>
    	<%@include file="/view/template/employees.jsp" %>
   <%  }
    else if(pageParam.equals("customers")){ %>
	<%@include file="/view/template/customers.jsp" %>
<%  }
    else if(pageParam.equals("orders")){ %>
	<%@include file="/view/template/orders.jsp" %>
<%  }
    else if(pageParam.equals("statistical")){ %>
	<%@include file="/view/template/statistical.jsp" %>
<%  }
    }
%>
            </c:if>
            <c:if test="${not empty sessionScope['employee']}">
                <header> TRANG QUẢN TRỊ</header>
    <div class="content"> </div>
    <div class="left-content">
        <ul id="menu">
            <li><a href="/ShopBanSach/view/admin.jsp?page=products"> Quản lý sản phẩm</a></li>
            <li ><a href="/ShopBanSach/view/admin.jsp?page=employees">Quản lý nhân viên</a></li>
            <li ><a href="/ShopBanSach/view/admin.jsp?page=customers">Quản lý khách hàng</a></li>
            <li ><a href="/ShopBanSach/view/admin.jsp?page=orders">Quản lý đơn hàng</a></li>
            <li ><a href="/ShopBanSach/view/admin.jsp?page=statistical">Thống kê</a></li>
            <li ><a href="/ShopBanSach/accountServlet?action=exit">Thoát</a></li>
        </ul>
    </div>
    <% 
    String pageParam = request.getParameter("page");
    if(pageParam != null){
    if ( pageParam.equals("products")) {
        %>
        <%@include file="/view/template/product.jsp" %>
        <% 
    } 
    else if(pageParam.equals("employees")){ %>
    	<%@include file="/view/template/employees.jsp" %>
   <%  }
    else if(pageParam.equals("customers")){ %>
	<%@include file="/view/template/customers.jsp" %>
<%  }
    else if(pageParam.equals("orders")){ %>
	<%@include file="/view/template/orders.jsp" %>
<%  }
    else if(pageParam.equals("statistical")){ %>
	<%@include file="/view/template/statistical.jsp" %>
<%  }
    }
%>
            </c:if>
        </c:when>
        <c:otherwise>
            
            <% response.sendRedirect("/ShopBanSach/view/login.jsp"); %>
        </c:otherwise>
    </c:choose>
    
</body>
</html>

