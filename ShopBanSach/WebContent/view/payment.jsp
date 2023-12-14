<%@page import="model.productDAO"%>
<%@page import="model.product"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.cartItem"%>
<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/main.css" />
    <link rel="stylesheet" href="./fonts/fontawesome/css/all.css">
     <title>Trang Thanh Toán</title>
    <!-- BOOTSTRAP -->
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
     <!-- ICON -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="icon" type="image/x-icon" href="/ShopBanSach/view/image/icon.png">
  </head>
  <style>
  	label{
  		font-weight:700
  	}
  </style>
  <body>
    <div id="payment">
      <div id="header-payment">
        <div class="font-header py-5">
          <h2 class="d-flex align-items-center"><i class="fa-regular fa-credit-card mx-5"></i> <p class="text-light align-self-center my-auto">THANH TOÁN</p> </h2>
        </div>
      </div>
      <div id="content-payment" class="container">
      <div class="row pt-5">    
      
      	<%
      	HttpSession sa = request.getSession();
      	String ten = null;
      	String diachi = null;
      	String sdt = null;
      	if(sa!=null ){
        	if(sa.getAttribute("user")!=null){
        		User us = (User)sa.getAttribute("user");
        		ten = us.getName();
        		diachi = us.getAddress();
        		sdt = us.getPhone();
        	}
      	}
      	HttpSession add = request.getSession();
    	ArrayList<cartItem> cart_list = (ArrayList<cartItem>)add.getAttribute("cart-list");
    	List<cartItem> cartProduct= null;
    	if(cart_list != null){
    		cartProduct= productDAO.getCartProducts(cart_list);
    		request.setAttribute("cart_list", cart_list);
    	}
    	int tong =0;
    	for (cartItem c : cartProduct){
    		tong+= c.getPrice()*c.getQuantity();
    	}
      	%>
      	<div class="col-6" style="padding-left:10%">

	        <form action="/ShopBanSach/orderServlet">
	          <div id="customer-details">
	            <h2 style="font-size: 30px" class="pb-3">THÔNG TIN KHÁCH HÀNG</h2>
	            <label for="name">Tên:</label>
	            <div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1"><i class="fa-solid fa-user"></i></span>
					<input type="text" class="form-control" name="name" placeholder="Nhập họ tên .." aria-describedby="basic-addon1" value ='<%if(ten != null) out.print(ten);%>'>
				</div>
	             <label for="Address">Địa chỉ:</label>
	            <div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon2"><i class="fa-solid fa-location-dot"></i></span>
					<input type="text" class="form-control" name="Address" placeholder="Nhập địa chỉ ..." aria-describedby="basic-addon2" value ='<%if(diachi != null) out.print(diachi);%>'>
				</div>
	            <label for="phone">Số điện thoại:</label>
	            <div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon3"><i class="fa-solid fa-phone"></i></span>
					<input type="text" class="form-control" name="phone" placeholder="Nhập số điện thoại" aria-describedby="basic-addon3" value ='<%if(sdt != null) out.print(sdt);%>'>
				</div>
	          </div>
          </div>
          <div class="col-6">
          <div id="order-details" style=" padding-left:10%">
          <h2 style="font-size: 30px ">CHI TIẾT ĐƠN HÀNG</h2>
            <table>

              <tr>
                <th>Tổng tiền hàng:</th>
                <td><%=tong %></td>
              </tr>
              <tr class="border">
                <th>Phí vận chuyển:</th>
                <td id ="phivanchuyen">30.000 VND</td>
              </tr>

              <tr>
                <th>Tổng tiền:</th>
                <%
                if(request.getAttribute("shipping") != null){
                	 int ship = (int)request.getAttribute("shipping");
                	out.print(ship); 
                }
                	
                %>
                <input type="hidden" id="txttien" value="<%=tong%>">
                <td id = "tongtien" ><%=tong+30000+" VND"%> </td>
              </tr>
            </table>
<!--             <input type="submit" id="btOrder" value="Xác Nhận" name="btOrder"/> -->
          </div>
          </div>
         </div>
       <!--    <h2 class="h2payment">HÌNH THỨC THANH TOÁN</h2> -->
         <!--  <div id="form-payment">
            <div class="form postpaid">
              <img src="image/postpaid.png" alt="Thanh toán khi nhận hàng" />
              <input type="radio"id="cbPostpaid" name="payment" value="nhanhang" />
              <label for="cbPostpaid">Thanh toán khi nhận hàng</label>
            </div>
            <div class="form prepay">
              <img src="image/prepay.png" alt="Hình thức trả trước" />
              <input type="radio"id="cbPrepay"name="payment"value="tratruoc"/>
              <label for="cbPrepay">Hình thức trả trước</label>
            </div>
          </div> -->
          <h2 class="h2payment" style="font-size:30px; padding-left:10%;">HÌNH THỨC GIAO HÀNG</h2>
          <div id="form-delivery" style="padding-left:10%" class="mb-5">
            <div class="form fast">
              <img src="image/fast delivery.png" alt="Giao hàng nhanh" />
            <input type="radio" id="cbFast" name="delivery" value="30000" checked onchange ="myfunction(30000)"/>
              <label for="cbFast">Giao hàng nhanh</label>
            </div>
            <div class="form savings">
              <img src="image/deliver savings.png" alt="Giao hàng tiết kiệm" />
              <input type="radio" id="cbSavings"name="delivery"value="20000" onchange ="myfunction(20000)"/>
              <label for="cbSavings">Giao hàng tiết kiệm</label>
            </div>
          </div>
           <input style="margin-left:10%" type="submit" class="btn btn-primary" id="btOrder" value="Xác Nhận" name="btOrder"/>
        </form>
      </div>
      
    </div>
    <%@include file="/view/template/footer.jsp" %>
    <p></p>
  </body>
</html>
<script>
var temp = document.getElementById("txttien").value
function myfunction(a) {
	
		result= parseInt(document.getElementById("txttien").value)+a
		//alert(result)
//	+parseInt(a);phivanchuyen
	document.getElementById("tongtien").innerText =result  + "VNĐ"
	document.getElementById("phivanchuyen").innerText = a + "VNĐ"
	//alert(document.getElementById("txttien").value)
	
}
</script>