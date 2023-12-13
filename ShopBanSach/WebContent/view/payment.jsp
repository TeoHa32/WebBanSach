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
  </head>
  <body>
    <div id="payment">
      <div id="header-payment">
        <div class="font-header">
          <h1><i class="fa-regular fa-credit-card"></i> THANH TOÁN</h1>
        </div>
      </div>
      <div id="content-payment">
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
        <form action="/ShopBanSach/orderServlet">
          <div id="customer-details">
            <h2 style="font-size: 35px">THÔNG TIN KHÁCH HÀNG</h2>
            <label for="name">Tên:</label>
            <div class="form-group">
              <input type="text" id="txtname" name="name" value ='<%if(ten != null) out.print(ten);%>' />
              <i class="fa-regular fa-user"></i>
            </div>
            <label for="Address"> Địa chỉ:</label>
            <div class="form-group">
              <input type="text" id="txtAddress" name="Address" value ='<%if(diachi != null) out.print(diachi);%>'/>
              <i class="fa-solid fa-location-dot"></i>
            </div>
            <label for="phone"> Số điện thoại:</label>
            <div class="form-group">
              <input type="text" id="phone" name="phone" value ='<%if(sdt != null) out.print(sdt);%>'/>
              <i class="fa-solid fa-phone"></i>
            </div>
          </div>
          <div id="order-details">
            <table>
              <tr>
                <th colspan="2" style="font-size: 35px">CHI TIẾT ĐƠN HÀNG</th>
              </tr>

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
            <input type="submit" id="btOrder" value="Xác Nhận" name="btOrder"/>
          </div>
          <h2 class="h2payment">HÌNH THỨC THANH TOÁN</h2>
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
          <h2 class="h2payment">HÌNH THỨC GIAO HÀNG</h2>
          <div id="form-delivery">
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