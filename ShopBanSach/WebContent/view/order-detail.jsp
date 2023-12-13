
<%@page import="model.DBconnect"%>
<%@page import="model.productDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.cartItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	HttpSession add = request.getSession();
 ArrayList<cartItem> cart_list = null;
 List<cartItem> cartProduct= null;
	productDAO pDAO ;
	if(add!=null){
		
		if(add.getAttribute("cart-list")!=null){
			cart_list = (ArrayList<cartItem>)add.getAttribute("cart-list");
			//out.print(cart_list.size());
			if(cart_list != null){
				cartProduct= productDAO.getCartProducts(cart_list);
			}
			else{
				cartProduct.clear();
			}
			
		}
	}
	
%>
	
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Detail</title>
    <!-- BOOTSTRAP -->
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- ICON -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="./css/style-order-detail.css">
    <script src="./js/main-order-detail.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
	<%@include file="/view/template/header.jsp" %>
    <div class="container-fluid py-5">
        <div class="container-fluid">
            <div class="row">
                <!-- Giỏ hàng -->
                <div class="col-8">
                    <div class="logo-title">                                                                         
                        <span class="title">
                            <i class="fa-solid fa-cart-shopping"></i>
                            <span>GIỎ HÀNG</span>
                        </span>                   
                    </div>
                    <div class="cart-item">                        
                        <table class="table">
                            <thead class="table-success ">
                                <tr>
                                    <th>
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="select" onclick="selectAllCheckboxes()"> 
                                            <p style='display:none' id="btxoa">xóa</p>                                           
                                          </div>
                                    </th>
                                    <th colspan="2">Sản phẩm</th>
                                    <th>Đơn giá</th>
                                    <th>Số lượng</th>                                
                                    <th>Thành tiền</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                              	
                            	<% 	if (cart_list !=null){	
                            			for (cartItem c : cartProduct){
                            		%>
                            		
                                            <tr>
                                            <th>
                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input">                                            
                                                  </div>
                                            </th>
                                            <td colspan="2">
                                                <div class="d-flex">                                        
                                                    <img class="img-thumbnail" src="../view/image/<%=c.getImg()%>" alt="Ảnh sản phẩm" width="100" height="80">
                                                    
                                                    <div>
                                                        <p class="mb-0"><%=c.getName() %></p>
                                                        <p class="mb-0" style="color: #a6a6a6;"><%=c.getAuthor()%></p>
                                                    </div>
                                                </div>
                                            </td>                                            
                                            <td><%=c.getPrice() %> đ</td>
                                            <td>
                                            	
                                            		<input type="hidden" name="id" value="<%=c.getId()%>" class="form-input">
                                            		<div class="form-group d-flex justify-content-between">
                                            			<a class="btn btn-sm btn-decrease" href="../deleteSL?name=changePrice&sl=<%=c.getQuantity()%>&id=<%=c.getId()%>"><i class="fas fa-minus-square"></i></a>
                                            			<input type="text" name="quantity" id="<%=c.getId()%>" class="form-control" value="<%=c.getQuantity()%>" readonly>
                                            			
                                            			<a class="btn btn-sm btn-incre" href="../xulycart?name=changePrice&sl=<%=c.getQuantity()%>&id=<%=c.getId()%>" ><i class="fas fa-plus-square"></i></a>                                            			
                                            		</div>
                                            	
                                            </td>
                                            <td><p class="color-xmark"><%=c.getPrice()*c.getQuantity()%> đ</p></td>
                                            <td><a href="../delete?name=changePrice&sl=<%=c.getQuantity()%>&id=<%=c.getId()%>"><i class="fa-solid fa-xmark color-xmark"></i></a></td>                                    
                                        </tr>
                            			<% }
                            			}
                            	%>                    						                
                            </tbody>                            
                        </table>
                        <form action="../products/cap1">
							<button type="submit" class="btn btn-outline-danger">Tiếp tục mua hàng</button>
						</form>
                    </div>
                    <div class="btnMuaHang">

                    </div>
                </div>
                <!-- Chi tiết hóa đơn -->

                 <%
              	String url = "/ShopBanSach/view/login.jsp";
                	HttpSession sa = request.getSession();
                if(s!=null ){
                	if(sa.getAttribute("user")!=null){
                		url = "/ShopBanSach/view/payment.jsp";
                	}
                	else{
                		url = "/ShopBanSach/view/login.jsp";
                		//out.print("<div class='user'><a href='/ShopBanSach/view/login.jsp'> <i class='fa-regular fa-user'></i></a></div>");
                	}
                	
                }
                
                %>
                <form action="<%=url %>" method="get">
                <div class="col-4 p-4 align-items-center orderdetail-title">
                    <div class="orderdetail">
                        <p>CHI TIẾT HÓA ĐƠN</p>
                    </div> 
                    <b style="font-size: 18px;"><u>Sản phẩm :</u></b>
                    <%
                    int sum=0;
                    %>
                    <%if (cart_list !=null){	
                    	
                    	int i =0;
            			for (cartItem c : cartProduct){
            			%>                   
            			 <div class="d-flex banggia">
                        <div class="product-name">Sản phẩm <%=++i%>: <%=c.getName() %></div>
                        <div class="price"><%=c.getPrice()*c.getQuantity()%>đ</div>
           					<%
           						sum+=c.getPrice()*c.getQuantity();
           					%>
                   		 </div>
                   		<%}
            			
            			}%> 
                    
                                        
                   
                   <!--  <div class="d-flex banggia">
                        <div class="product-name">Sản phẩm 1</div>
                        <div class="price">1000$</div>
                    </div>
                    <div class="d-flex banggia">
                        <div class="product-name">Sản phẩm 1</div>
                        <div class="price">1000$</div>
                    </div>
                     -->
                    <hr>
                    <div class="d-flex banggia">
                        <div class="product-name">Khuyến mãi</div>
                        <div class="price">0$</div>
                    </div> <hr>
                    <div class="d-flex banggia">
                        <div class="product-name">Thành tiền</div>
                        <div class="price"><%=sum%>đ</div>
                    </div>
                    <div class="d-flex justify-content-center mt-5"><%if (cart_list ==null){ %>
                    	<input type="submit" value="THANH TOÁN" class="btn btn-outline-danger" disabled>
                   <% } else %> <input type="submit" value="THANH TOÁN" class="btn btn-outline-danger">
                    </div>                        
                </div>
                </form>
            </div>
        </div>
    </div>
   <!--<input type="hidden" id="txthihd" value="${username }">  --> 
    <%@include file="/view/template/footer.jsp" %>
</body>
</html>

