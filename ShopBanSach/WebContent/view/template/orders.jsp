<%@page import="model.oderDAO"%>
<%@page import="model.order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.User"%>
<%@ page import="model.Users"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="right-content">
	<form action="/ShopBanSach/ordersAdminServlet" method="POST">
		<input type="text" id="txtsearch" name="search" />
		<button id="btSearch" name="btnSearch">Tìm kiếm</button>
	</form>

	<section id="Orders">
		<c:choose>
			<c:when test="${empty requestScope.search}">
				<div id="table-Orders">
					<div class="table">
						<table>
							<thead>
								<tr>
									<th>STT</th>
									<th>User_id</th>
									<th>Order_date</th>
									<th>Confirm</th>
									<th>Shipping_method</th>
									
									<th>Select</th>
								</tr>
							</thead>
							<tbody>
								<%
									List<order> listOrders = oderDAO.loadOrders();

											int count = 0;
											for (order order : listOrders) {
												count++;
												out.print("<tr>");
												out.print("<td>" + count + "</td>");
												out.print(" <td>" + order.getUser_id() + "</td>");
												out.print(" <td>" + order.getOrder_date() + "</td>");
												if (order.getconfirm() == 0) {
													out.print("<td> <a href='/ShopBanSach/ordersAdminServlet?action=status&id=" + order.getId()
															+ "'> Chưa xác nhận </a> </td> ");
												} else {
													out.print("<td> Đã xác nhận</td>");
												}
												out.print(" <td>" + order.getShipping_method() + "</td>");
												

												out.print("<td>");
												out.print("<div style='display: flex;'>");
												out.print("<div class='edit'>");
												out.print("<a href='?page=orders&id=" + order.getId()
														+ "'><i class='fa-solid fa-circle-info'></i></a>");
												out.print("</div>");
												out.print("<div>");
												out.print("<form action='/ShopBanSach/ordersAdminServlet' class='form-delete' method='POST'>");
												out.print("<input type='hidden' value='" + order.getId() + "' name='id'> ");
												out.print(
														"<button class='delete' name='btn-delete'><i class='fa-solid fa-trash'></i> </button>");
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
					<div id="table-Orders">
						<div class="table">
							<table>
								<thead>
									<tr>
										<th>STT</th>
										<th>User_id</th>
										<th>Order_date</th>
										<th>Confirm</th>
										<th>Shipping_method</th>
										
										<th>Select</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="count" value="${0}" />
									<c:forEach var="order" items="${requestScope.listSearch}">
										<c:set var="count" value="${count+1}" />
										<tr>
											<td>${count}</td>
											<td>${order.user_id}</td>
											<td>${order.order_date }</td>
											<c:if test="${order.confirm==0}">
												<td><a
													href="/ShopBanSach/ordersAdminServlet?action=status&id=${order.id}">
														Chưa xác nhận </a></td>
											</c:if>
											<c:if test="${order.confirm==1}">
												<td>Đã xác nhận</td>
											</c:if>
											<td>${order.shipping_method }</td>
											
											<td>
												<div style='display: flex;'>
													<div class='edit'>
														<a href="?page=orders&id=${order.id}"><i
															class='fa-solid fa-circle-info'></i></a>
													</div>
													<div>
														<form action='/ShopBanSach/ordersAdminServlet'
															class='form-delete' method='POST'>
															<input type='hidden' value="${order.id}" name='id'>
															<button class='delete' name='btn-delete'>
																<i class='fa-solid fa-trash'></i>
															</button>
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
