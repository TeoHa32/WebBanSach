<%@page import="model.User"%>
<%@page import="model.oderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.orderDetail"%>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Trang history</title>    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="icon" type="image/x-icon" href="../image/icon.png">
    <link rel="stylesheet" href="../view/css/history.css">  
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<%@include file="/view/template/header.jsp" %> <hr>
	<div class="title mt-5 mb-5">
		<h1>LỊCH SỬ ĐẶT HÀNG</h1>
	</div>
<%
	String mess = request.getParameter("mess");
	if(mess!=null){%>
		<input type="hidden" id ="thongbao" value=<%=mess %> >
	<%}
	else {%>
		<input type="hidden" id ="thongbao" value="khong ton tai">
<%}
	List<orderDetail> od = new ArrayList<orderDetail>();
	od = oderDAO.getALLOrder();
	HttpSession sess = request.getSession();
	int ship = 0;
	if(sess != null)
		if(sess.getAttribute("user")!=null){ //ngoặc 1
			User u = (User)sess.getAttribute("user");
				
%>

	<% int i= 0; int id = 0; int sl=1; int stt = 0, k=0, tong = 0; int id_sl = 0;
	if(od.size() >0){ // ngoặc 2 %>
	<div class="container-fluid ">
		<table class="table table-hover" border="1">
		<thead class="table-dark">
			<tr>
				<th>Đơn hàng</th>
				<th>Sản phẩm</th>
				<th>Số lượng</th>
				<th>Tình trạng đơn hàng</th>
				<th>Địa chỉ</th>
				<th>Ngày đặt đơn</th>
				<th>Phí ship</th>
				<th>Giá tiền</th>
				<th>Tổng tiền</th>
				<!-- <td >Tổng tiền</td> -->
			</tr>
		</thead>
		<% for(orderDetail o : od){ 
			if(o.getOd().getUser_id().equals(u.getUsername())){
			
			// ngoặc3%>
			<tbody>
			<tr>
			
			<% if(id != o.getOrder_id()){
				
				i = 0;
				stt++;
				sl=0;
			 }
			if(i == 0) {
				id = o.getOrder_id();
				for(orderDetail ode : od){
					if(id == ode.getOrder_id())
					{
						sl++;
						tong+= ode.getQuantity()*ode.getPrice();
						ship = Integer.parseInt(o.getOd().getShipping_method());
					}
						
				}
				i++;
				k=sl;
			%>
			<td rowspan='<%= sl%>'>đơn hàng <%=stt %></td>
			<%}  
			if(id == o.getOrder_id()){%>
				<td><%=o.getName() %></td>
				<td><%=o.getQuantity() %></td>
			
			<% }
			if(sl == k){ %>
				<td rowspan='<%= sl%>'><% if(o.getOd().getconfirm() == 1) {
				out.print("đã xác nhận");
				}
				else { out.print("chưa xác nhận | "); %>
				<a onclick="chuyentrang(<%=o.getOd().getId()%>)" >Huỷ đơn</a>
				<% } %>
			 </td>
				<td rowspan='<%= sl%>'><%if(!o.getOd().getDiachinhanhang().equals("")) 
											out.print(o.getOd().getDiachinhanhang());
										else out.print(oderDAO.diachi(u.getUsername()));
							%></td>
				<td rowspan='<%=sl%>'><% LocalDateTime localDateTime =o.getOd().getOrder_date(); 
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm, EEEE, dd-MM-yyyy");
		        String formattedDateTime = localDateTime.format(formatter);
		        out.print(formattedDateTime);
				%></td>
				<td rowspan='<%=sl%>'> <%=ship%></td>
				<td rowspan='<%= sl%>'> <%=tong %></td>
				<td rowspan='<%= sl%>'> <%=tong + ship%></td>
				
			<% } k=0; tong = 0;%>
			
			<!-- <td rowspan="3">Tổng tiền</td> -->
		</tr>
		</tbody>
		<% }
		} //ngoặc3
		//ngoặc 2
	}%> 
	</table>
	</div>
	<a href="/ShopBanSach/view/index.jsp" class="button m-2">Quay lại trang chủ</a>
	<% 	} //ngoặc 1
		else{
			out.print("Đăng nhập để xem lịch sử mua hàng");
		}
		
%>
	<%@include file="/view/template/footer.jsp" %>
</body>
</html>
<script type="text/javascript">
	function chuyentrang(url) {
		
		var xacNhan = confirm("Bạn có chắc muốn xóa không không?");
		if (xacNhan) {
			window.location.href = "/ShopBanSach/historyServlet?idod="+url;
		} 
	}
	var mess = document.getElementById("thongbao").value
	if(mess == "successful"){
		alert("hủy đơn thành công");
	}
	else if(mess == "Unable"){
		alert("không thể hủy đơn")
	}
</script>