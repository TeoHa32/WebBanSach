<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="model.User" %>
    <%@ page import="model.Users" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.util.List" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="right-content">
       <form action="/ShopBanSach/employeesServlet" method="POST">
<input type="text" id="txtsearch" name="search"/>
        <button id="btSearch"name="btnSearch">Tìm kiếm</button>
</form>   
        <section id="employee" >
        <c:choose>
        <c:when test="${empty requestScope.search}">
        
            <div id="table-employee" >
                <div class="table">
                    <table>
                        <thead>
                           <tr>
                            <th>STT</th>
                            <th>Tên nhân viên</th>
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
                           ArrayList<User> listEmployees= Users.loadEmployees();
                           int count= 0;
                           for (User u:listEmployees){
                        	   count++;
                        	   out.print(" <tr>");
                        	   
                        	   out.print("<td>"+count+"</td>");
                        	   out.print("<td>"+u.getName()+"</td>");
                        	   out.print("<td>"+u.getUsername()+"</td>");
                        	   out.print("<td>"+u.getPassword()+"</td>");
                        	   out.print("<td>"+u.getEmail()+"</td>");
                        	   out.print("<td>"+u.getPhone()+"</td>");
                        	   out.print("<td>"+u.getAddress()+"</td>");
                        	   out.print("<td>");
                        	   out.print("<div style='display: flex;'>");
                   			out.print("<div class='edit'>");
                   			out.print("<a href='?page=employees&username="+u.getUsername()+"'><i class='fa-solid fa-circle-info'></i></a>");
                   			out.print("</div>");
                   			if(request.getSession()!=null){
                   				if(request.getSession().getAttribute("admin")!=null){
                   					out.print("<div>");
                           			out.print("<form action='/ShopBanSach/employeesServlet' class='form-delete' method='POST'>");
                           			out.print("<input type='hidden' value='"+u.getUsername()+"' name='username'> ");
                           			out.print("<button class='delete' name='btn-delete'><i class='fa-solid fa-trash'></i> </button>");
                           			out.print("</form>");
                           			out.print("</div>");
                   				}
                   			}
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
                            <th>Tên nhân viên</th>
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
        <c:set var="count" value="${count+1}" />
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
                   			<a href="?page=employees&username=${User.username}"><i class='fa-solid fa-circle-info'></i></a>
                   			</div>
                   			<c:if test="${not empty sessionScope['admin']}">
                			<div>
                   			<form action='/ShopBanSach/employeesServlet' class='form-delete' method='POST'>
                   			<input type='hidden' value="${User.username}" name='username'> 
                   			<button class='delete' name='btn-delete'><i class='fa-solid fa-trash'></i> </button>
                   			</form>
                   			</div>
            				</c:if>
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
        
<%
String usernameEdit=request.getParameter("username");
String name=null;
String password=null;
String email=null;
String address=null;
String phone=null;
if(usernameEdit != null){
	User u =Users.findByUsername(usernameEdit);
	name=u.getName();
	password=u.getPassword();
	email=u.getEmail();
	address=u.getAddress();
	phone=u.getPhone();
}
%>
            <div id="from-employee">
                <div class="form">
                    <h2>THÊM NHÂN VIÊN</h2>
                    <form action="/ShopBanSach/employeesServlet" method="POST" >
                     
                        <div class="flex ">
                            <label> Họ và tên</label>
                            <input type="text" name="fullname" value="<%if(name != null)out.print(name);%>"/>
                        </div>
                        <div class="flex">
                            <label> Username</label>
                            <input type="text" name="username" value="<%if(usernameEdit != null)out.print(usernameEdit);%>"/>
                        </div>
                        <div class="flex">
                            <label> Password</label>
                            <input type="password" name="password" value="<%if(password != null)out.print(password);%>"/>
                        </div>
						<div class="flex">
                            <label> Email</label>
                            <input type="text" name="Email" value="<%if(email != null)out.print(email);%> "/>
                        </div>
                            <div class="flex">
                            <label> Address</label>
                            <input type="text" name="Address" value="<%if(address != null)out.print(address);%>"/>
                        </div>
                        <c:if test="${not empty sessionScope['admin']}">
               
           				 </c:if>
                            <div class="flex">
                                <label>Phone</label>
                                <input type="number" name="phone" value="<%if(phone!=null)out.print(phone);%>"/>
                            </div >
                            <c:if test="${not empty sessionScope['admin']}">
              				 <div class="block"></div>
							<button id="btAddEmployee" name="btnEmployee" class="btnAdd">Thêm</button>
							<button id="btupdateEmployee" name="btnUpdateEmployee" class="btnAdd">Sửa</button>
            				</c:if>
					
                    </form>
                </div>
            </div>
        </section>
        
    </div>
