<%@page import="model.product"%>
<%@page import="java.util.List"%>
<%@page import="model.productDAO"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ</title>
    <link rel="stylesheet" href="/ShopBanSach/view/css/reset.css">
    <link rel="stylesheet" href="/ShopBanSach/view/css/style.css">
        <link rel="stylesheet" href="/ShopBanSach/view/css/main1.css">
    <link rel="stylesheet" href="/ShopBanSach/view/fonts/fontawesome/css/all.css">
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
	a{
		text-decoration:none;
	}
	.card{
		cursor:pointer;
	}
	.product_detail-author, .product_detail-type{
	    width: 400px;
	}
	.product_detail-name {
		text-align: left;
	}
	.heading{
		width:15%;
		padding-left:20px;
	}
	.banner{
		height: 550px;
	}
</style>
<body>

<%
	productDAO dao = new productDAO();
	List<product> products = dao.getLatestProducts();
	request.setAttribute("products", products);
%>

    <div id="wrapper w-100">
        <%@include file="/view/template/header.jsp" %>
        <div id="wpcontent">
            <div class="banner"><img src="/ShopBanSach/view/image/banner 1.png" alt="">
                <div class="banner-right">
                    <div class="text">   CHÀO MỪNG BẠN ĐÃ ĐẾN CỬA HÀNG SÁCH CỦA CHÚNG TÔI</div>
                    <div class="see-more"><a href="">Xem thêm</a></div></div>
                </div>

            
            <div class="container">
                <div class="heading d-flex align-self-center mx-auto text-center " style="margin-top:150px">SÁCH MỚI</div>
                 <div class="row">
                        
	                       <c:forEach items="${products}" var="product">
	                        	 <div class="col-3">
									<div data-bs-toggle="modal" data-bs-target="#product" class="card mt-5" onclick="myfunction('${product.img }', '${product.name }','${product.price }','${product.publisher }','${product.description }','${product.author }','${product.id }')" >
<img class="card-img-top pt-3" src="/ShopBanSach/view/image/${product.img }" alt="Card image">
	                                    <div class="card-body px-">
	                                        <div class="line1 d-flex justify-content-between">
	                                            <b class="card-title ">${product.name}</b>
	                                            
	                                            <i class="fa-regular fa-heart align-self-center"></i>
	                                        </div>
	                                        <div class="line2 d-flex justify-content-between align-items-center">
	                                            <div class="product_price d-flex align-items-center">
	                                                <div class="product_price-original "><del>${product.id}</del></div>
	                                                  <div class="value">${product.id }</div>
	                                                <b class="product_price-current mx-1">${product.price }</b>
	                                            </div>
	                                            <i class="fa-solid fa-truck"></i>
	                                        </div>											  
	                                    </div>	  	                                    	                                                                   
	                                
	                                </div>
	                           
								    
                                <!-- Chi tiết sản phẩm 1-->
                             
	                                <div class="modal fade" id="product">
	                                    <div class="modal-dialog">
	                                        <div class="modal-content pb-5" style="width: 800px; transform: translateX(-22%); margin-top: 15%;">
	                                            <!-- Modal Header -->
	                                            <div class="modal-header">
	                                                <h4 class="modal-title">Chi tiết sản phẩm</h4>
												<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	                                            </div>
	                                            <!-- Modal body -->
	                                            <div class="modal-body">
	                                                <div class="product_detail d-flex">
	                                                    <img src="" alt="" class="product_detail-img align-self-center" id="img">
	                                                        <div class="product_detail-info">
		                                                        <div class="product_detail-name" id="name"></div>
		                                                        <div class="product_detail-author d-flex justify-content-between">
<b>Tác giả:</b>
		                                                            <div class="product_detail-author-name " id="author"></div>
		                                                        </div>
		                                                        <div class="product_detail-type d-flex justify-content-between">
		                                                            <b>Nhà xuất bản</b> 
		                                                            <div class="product_detail-type-name" id="publisher"></div>
		                                                        </div>
		                                                        <div class="product_detail-rating-price d-flex justify-content-between">
		                                                            <div class="product_detail-rating my-auto">
		                                                                <i class="fa-regular fa-star"></i>
		                                                                <i class="fa-regular fa-star"></i>
		                                                                <i class="fa-regular fa-star"></i>
		                                                                <i class="fa-regular fa-star"></i>
		                                                                <i class="fa-regular fa-star"></i>
		                                                            </div>
		                                                            <div class="product_detail-price d-flex flex-column align-items-end">
		                                                                <div class="product_price-original "><del>120.000</del></div>
		                                                                <b class="product_price-current " id="price" ></b>
		                                                            </div>
		                                                        </div>
		                                                        <div class="product_detail-description">
		                                                            <b class="text-start">Mô tả ngắn: </b>
		                                                            <div class="product_detail-description-txt" id="description"></div>
		                                                        </div>
		                                                        <div class="product_detail-action d-flex justify-content-around pt-5">
		                                                            <div class="product_detail-amount d-flex align-items-center" onclick="amount()">
		                                                                <i class="fa-solid fa-minus"></i>
		                                                                <input class="product_detail-amount-num" name="soluong" id="sl1" value="1">
		                                                                <i class="fa-solid fa-plus"></i>
</div>
		                                                            
		                                                             <form action="/ShopBanSach/cartServlet" method="get">
																    <input type="hidden" name="id" id ="id_add">
																     <input type="hidden" name="id_sl" id="id_sl1">
																    <input class="btn btn-primary" type="submit" onclick ="soluong(sl1)" value="Thêm sản phẩm" >
																  </form> 
		                                                        </div>
                                                   	 	</div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
                            </div>
	                        </c:forEach>
                        </div>

            <div class="banner-betwen pt-5">
                <div class="text-banner"><p>"KHÔNG CÓ GÌ CÓ THỂ THAY THẾ VĂN HỌC ĐỌC"</p></div>
                <img src="/ShopBanSach/view/image/b1 9.png" alt="">
            </div>
            
            
            <div class="container book-selling">
                <div class="heading w-25">SÁCH BÁN CHẠY</div>
                
                <%
                	productDAO Dao = new productDAO();
                	List<product> list = Dao.getBestSeller();
                	request.setAttribute("list", list);
                %>
                 <div class="row">
                        
	                       <c:forEach items="${list}" var="sp">
	                        	 <div class="col-3">
									<div data-bs-toggle="modal" data-bs-target="#product" class="card mt-5" onclick="myfunction('${sp.img }', '${sp.name }','${sp.price }','${sp.publisher }','${sp.description }','${sp.author }','${sp.id }')" >
	                                    <img class="card-img-top pt-3" src="/ShopBanSach/view/image/${sp.img }" alt="Card image">
	                                    <div class="card-body px-">
	                                        <div class="line1 d-flex justify-content-between">
	                                            <b class="card-title ">${sp.name}</b>
	                                            
	                                            <i class="fa-regular fa-heart align-self-center"></i>
	                                        </div>
	                                        <div class="line2 d-flex justify-content-between align-items-center">
	                                            <div class="product_price d-flex align-items-center">
	                                                <div class="product_price-original "><del>${sp.id}</del></div>
	                                                  <div class="value">${sp.id }</div>
	                                                <b class="product_price-current mx-1">${sp.price }</b>
</div>
	                                            <i class="fa-solid fa-truck"></i>
	                                        </div>											  
	                                    </div>	  	                                    	                                                                   
	                                
	                                </div>
	                           
								    
                                <!-- Chi tiết sản phẩm 1-->
                             
	                                <div class="modal fade" id="product">
	                                    <div class="modal-dialog">
	                                        <div class="modal-content pb-5" style="width: 800px; transform: translateX(-22%); margin-top: 15%;">
	                                            <!-- Modal Header -->
	                                            <div class="modal-header">
	                                                <h4 class="modal-title">Chi tiết sản phẩm</h4>
												<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	                                            </div>
	                                            <!-- Modal body -->
	                                            <div class="modal-body">
	                                                <div class="product_detail d-flex">
	                                                    <img src="" alt="" class="product_detail-img align-self-center" id="img">
	                                                        <div class="product_detail-info">
		                                                        <div class="product_detail-name" id="name"></div>
		                                                        <div class="product_detail-author d-flex justify-content-between">
		                                                            <b>Tác giả:</b>
		                                                            <div class="product_detail-author-name " id="author"></div>
		                                                        </div>
		                                                        <div class="product_detail-type d-flex justify-content-between">
		                                                            <b>Nhà xuất bản</b> 
		                                                            <div class="product_detail-type-name" id="publisher"></div>
		                                                        </div>
		                                                        <div class="product_detail-rating-price d-flex justify-content-between">
		                                                            <div class="product_detail-rating my-auto">
		                                                                <i class="fa-regular fa-star"></i>
		                                                                <i class="fa-regular fa-star"></i>
<i class="fa-regular fa-star"></i>
		                                                                <i class="fa-regular fa-star"></i>
		                                                                <i class="fa-regular fa-star"></i>
		                                                            </div>
		                                                            <div class="product_detail-price d-flex flex-column align-items-end">
		                                                                <div class="product_price-original "><del>120.000</del></div>
		                                                                <b class="product_price-current " id="price" ></b>
		                                                            </div>
		                                                        </div>
		                                                        <div class="product_detail-description">
		                                                            <b class="text-start">Mô tả ngắn: </b>
		                                                            <div class="product_detail-description-txt" id="description"></div>
		                                                        </div>
		                                                        <div class="product_detail-action d-flex justify-content-around pt-5">
		                                                            <div class="product_detail-amount d-flex align-items-center" onclick="amount()">
		                                                                <i class="fa-solid fa-minus"></i>
		                                                                <input class="product_detail-amount-num" name="soluong" id="sl2" value="1">
		                                                                <i class="fa-solid fa-plus"></i>
		                                                            </div>
		                                                            
		                                                            <form action="/ShopBanSach/cartServlet" method="get">
																    <input type="hidden" name="id" id ="id_add">
																     <input type="hidden" name="id_sl" id= "id_sl2">
																    <input class="btn btn-primary" type="submit" onclick ="soluong(sl2)" value="Thêm sản phẩm" >
																  </form>  
		                                                        </div>
                                                   	 	</div>
	                                                </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
                            </div>
	                        </c:forEach>
                        </div>
            <div class="service mt-5">
                <div class="service-center">
                <div class="box-service ">
<div class="box-service-head"><i class="fa-solid fa-truck"></i></div>
                    <div class="box-service-footer">Giao hàng nhanh</div>
                </div>
                <div class="box-service">
                    <div class="box-service-head"><i class="fa-solid fa-right-left"></i></div>
                    <div class="box-service-footer">Sách được đổi trả trong 3 ngày làm việc</div>
                </div>
                <div class="box-service">
                    <div class="box-service-head"><i class="fa-regular fa-newspaper"></i></div>
                    <div class="box-service-footer">Sách mới được cập nhật liên tục</div>
                </div>
            </div>
        </div>
        </div>
        <div id="footer" >
            <div class="footer-center">
            <div class="box follow">
                <div class="box-head">THEO DÕI TRÊN</div>
                <div class="box-footer">
                <div class="facebook"><a href=""><i class="fa-brands fa-facebook"></i></a></div>
                <div class="intasgram"><a href=""><i class="fa-brands fa-instagram"></i></a></div>
                <div class="amazon"><a href=""><i class="fa-brands fa-amazon"></i></a></div>
                </div>
            </div>
            <div class="box contact">
                <div class="box-head">LIÊN HỆ</div>
                <div class="box-footer">
                    <form action="">
                        <input type="text" name="contact" placeholder="Nhập Email...">
                    <button>
                        <i class="fa-solid fa-arrow-right"></i></button>
                    </form>
                </div>
            </div>
            <div class="box hyper-link">
                <div class="box-head">LIÊN KẾT</div>
                <div class="box-footer">
                    <div><a href="">Chính sách bảo mật</a></div>
                    <div><a href="">Điều kiện và điều khoản</a></div>
                    <div><a href="">Tham gia cùng chúng tôi</a></div>

                </div>
            </div>
        </div>
        </div>
    </div>
 </div>
 <!--  <script src="/ShopBanSach/view/js/product.js"></script> -->
    <script src="/ShopBanSach/view/js/account.js"></script>
    <script src="/ShopBanSach/view/js/product.js"></script>
    <script >
    function myfunction(img, name, price,publisher, description,author,id ){
    	document.getElementById('img').src =  "../view/image/"+img
    	document.getElementById('name').innerText = name
    	document.getElementById('publisher').innerText = publisher
    	document.getElementById('author').innerText = author
    	document.getElementById('price').innerText = price
    	document.getElementById('id_add').value = id
    }
     function soluong(a) {
		 if(a =="sl2")
    	document.getElementById('id_sl2').value = document.getElementById('sl2').value
    	else{
			
			document.getElementById('id_sl1').value = document.getElementById('sl1').value
			//alert(document.getElementById('sl1').value)
		}
	}</script>
</body>
</html>