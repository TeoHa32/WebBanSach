<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import="model.User" %>
    <%@ page import="model.Users" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.util.List" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="right-content">
        <form action="/ShopBanSach/customersServlet" method="POST">
<input type="text" id="txtsearch" name="search"/>
        <button id="btSearch"name="btnSearch">Tìm kiếm</button>
</form>   

        <section id="Customer" >
        <c:choose>
        <c:when test="${empty requestScope.search}">
            <div id="table-customer" >
                <div class="table">
                    <table>
                        <thead>
                           <tr>
                            <th>STT</th>
                            <th>Tên khách hàng</th>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Select</th>
                           </tr> 
                        </thead>
                        <tbody>
                        <%
                        List<User> listCustomers = Users.loadCustomers();
                       // List<User>listCustomers=Users.loadCustomers();
                        int count=0;
                        for(User u:listCustomers){
                        	count++;
                        	out.print("<tr>");
                        	out.print("<td>"+count+"</td>");
                        	out.print(" <td>"+u.getName()+"</td>");
                        	out.print(" <td>"+u.getUsername()+"</td>");
                        	out.print(" <td> "+u.getPassword()+"</td>");
                        	out.print(" <td>"+u.getEmail()+"</td>");
                        	out.print(" <td>"+u.getPhone()+"</td>");
                        	out.print("<td>"+u.getAddress()+"</td>");
                        	out.print("<td>");
                        	 out.print("<div style='display: flex;'>");
                    			out.print("<div class='edit'>");
                    			out.print("<a href='?page=customers&id="+u.getUsername()+"'><i class='fa-solid fa-circle-info'></i></a>");
                    			out.print("</div>");
                    			out.print("<div>");
                    			out.print("<form action='/ShopBanSach/customersServlet' class='form-delete' method='POST'>");
                    			out.print("<input type='hidden' value='"+u.getUsername()+"' name='username'> ");
                    			out.print("<button class='delete' name='btn-delete'><i class='fa-solid fa-trash'></i> </button>");
                    			out.print("</form>");
                    			out.print("</div>");
                    			out.print("</div>");
                    			out.print("</td>");
                    			out.print("</tr>");
                        }
                        %>
                           
                        </tbody>
                    </table>
                </div> 
            </div>
             </c:when>
<c:otherwise>
    <c:if test="${requestScope.search eq 'true'}">
           <div id="table-employee" >
                <div class="table">
                    <table>
                        <thead>
                           <tr>
                            <th>STT</th>
                            <th>Tên khách hàng</th>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Select</th>
                           </tr> 
                        </thead>
                        <tbody>
                         <c:set var="count" value="${0}"/>
					    <c:forEach var="User" items="${requestScope.listSearch}">
					        <c:set var="count" value="${count+1}"/>
					        <tr>
                        	  <td>${count}</td>
                        	  <td>${User.name }</td>
                        	  <td>${User.username }</td>
                        	  <td>${User.password }</td>
                        	  <td>${User.email }</td>
                        	  <td>${User.phone }</td>
                        	  <td>${User.address }</td>
                        	  <td>
                        	<div style='display: flex;'>
                   			<div class='edit'>
                   			<a href="?page=customers&username=${User.username}"><i class='fa-solid fa-circle-info'></i></a>
                   			</div>
                   			<div>
                   		<form action='/ShopBanSach/customersServlet' class='form-delete' method='POST'>
                   			<input type='hidden' value="${User.username}" name='username'> 
                   			<button class='delete' name='btn-delete'><i class='fa-solid fa-trash'></i> </button>
                   			</form>
                   			</div>
                   			</div>
                   			</td>
                   			</tr>
 </c:forEach>
</tbody>
 </table>
 </div> 
</div>
</c:if>
<c:if test="${requestScope.search eq 'false'}">
    <h2>Search Results</h2>
        <p>my heo</p>
</c:if>  
  </c:otherwise>
</c:choose>
        </section>
        
    </div>
