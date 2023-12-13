
<%@page import="java.net.URLEncoder"%>
<%@page import="model.sub_category"%>
<%@page import="model.category"%>
<%@page import="model.categories"%>
<%@page import="model.product"%>
<%@page import="model.cartItem"%>
<%@page import="model.productDAO"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang sản phẩm</title>
    <!-- BOOTSTRAP -->
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- ICON -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="icon" type="image/x-icon" href="/ShopBanSach/view/image/icon.png">
    <link rel="stylesheet" href="/ShopBanSach/view/css/products.css">
    <link rel="stylesheet" href="/ShopBanSach/view/css/style.css">
    <script src="/ShopBanSach/view/js/product.js"></script>
	<jsp:useBean id="p" class="model.productDAO" scope="request"></jsp:useBean>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
	a{
		text-decoration:none
	}
</style>
<body>
<%
	String txtsearch = null;
	int id_loaisp = 0, sapxep = 0, high_to_low = 0;
	if(request.getAttribute("txtsearch")!=null){
		txtsearch = request.getAttribute("txtsearch").toString();
	}
	if(request.getAttribute("high_to_low")!=null){
		high_to_low = 1;
	}
	if(request.getAttribute("sapxep")!=null){
		sapxep = 1;
	}
 	if(request.getAttribute("id_loaisp")!=null){
		id_loaisp = Integer.parseInt(request.getAttribute("id_loaisp").toString());
	}
	int click_loaisp = 0;
	if(request.getAttribute("loai")!=null){
		click_loaisp = 1;
	}
	ArrayList<cartItem> cart_list = (ArrayList<cartItem>)session.getAttribute("cart-list");	
	if(cart_list != null){
		request.setAttribute("cart_list", cart_list);
	}
	ArrayList<product> li = (ArrayList<product>)request.getAttribute("products");
	int tongsp =1;
    if(li!=null){
    	 tongsp  =li.size();	 
    }
    float sosp = 8;
    int tongtrang =(int)Math.ceil(tongsp/sosp); 
    int start = 1, end = 8, int_page = 1;
    if(request.getAttribute("int_page")!=null){
    	int_page = Integer.parseInt(request.getAttribute("int_page").toString());
    	start =Integer.parseInt(request.getAttribute("int_page").toString())*(int)sosp-(int)sosp+1;
    	end = (int)sosp*int_page;
    }
    
  //  request.setAttribute("truyen", "áccs");
   // ObjectMapper objectMapper = new ObjectMapper();
    //objectMapper 
    //request.setAttribute("yourList", li);
   	//ObjectMapper 
%>
<%@include file="/view/template/header.jsp" %>
    <!-- BANNER -->
    <div class="container">
        <div class="banner d-flex">
            <div class="banner_txt d-flex align-items-center flex-column my-auto">
                <h2 class="banner_txt-title mb-5">TRANG SẢN PHẨM</h2>
                <div class="banner_txt-content mx-5 text-center">
                    <i class="fa fa-quote-left"></i>
                    <i class="banner_txt-content ">Không chỉ đơn thuần là cung cấp kiến thức hay những câu từ đơn nghĩa, vai trò của sách còn cao cả và vĩ đại hơn nhiều, mang đến cả giá trị tinh thần và vật chất cho người đọc</i>
                    <i class="fa fa-quote-right"></i>
                </div>
            </div>
              <img src="/ShopBanSach/view/image/b5.PNG" class="banner_img" alt="Banner trang sản phẩm">
              </div>
    </div>
<div class="container-fluid py-5">
        <div class="container w-100">
            <div class="row">
            <!-- Tìm kiếm nâng cao -->
                <div class="col-3">
                    <div class="option_search">
						<div class="option_search-title">
                            <h5>Tìm kiếm nâng cao</h5>
                        </div>
						<div class="option_search-list">
						<form action="/ShopBanSach/timkiemnangcao" method="post">
							 <input type="hidden" name ="txtsearch" value ="<%=txtsearch %>"> 
	                            <ul class="list-group list-group-flush d-flex option-filter">
	                                <li class="list-group-item option-filter-item">
	                                    <div class="form-check mt-2 ">
	                                        <input class="form-check-input" type="radio" name="gia" id="tren" value="tren">
	                                        <label class="form-check-label" for="tren">Sản phẩm trên 100.000 VNĐ</label>
	                                    </div>
	                                </li>
	                                <li class="list-group-item option-filter-item">
	                                    <div class="form-check mt-3">
	                                        <input class="form-check-input" type="radio" name="gia" id="duoi" value="duoi">
	                                        <label class="form-check-label" for="duoi">Sản phẩm dưới 100.000 VNĐ</label>
	                                    </div>
	                                </li>
	                                <li class="list-group-item align-self-center option-filter-item">
	                                    <button class="btn btn-primary  mt-3 btn-confirm">Tìm kiếm</button>
	                                </li>
	                            </ul>

                        	</form>
                       </div>
                    </div>
                </div>
                 <!--Sản phẩm -->
                <div class="col-9 d-flex flex-column">
                    <!-- Danh mục sản phẩm -->
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                    	<% ArrayList<category> ca = categories.loadCategories();
                 		if(ca != null){ 
                 			for (category c : ca){ 
                 				 ArrayList<sub_category> cat = categories.loadSubCategories(c.getId());
                 			%>	
                 				 <li class="nav-item" role="presentation">
                 				<button class="nav-link" id="home-tab" data-bs-toggle="dropdown" data-bs-toggle="tab"  data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="false"><%=c.getName()%></button>
                            	<ul class="dropdown-menu">
                            	<%if(cat!=null){
                            		for (sub_category sub_ca : cat){
                            	%>
                            	<li><a class="dropdown-item" href="../products/loai?id=<%=sub_ca.getId()%>"><%=sub_ca.getName() %></a></li>
                            	<%	}
                            	}
                            	%>
                            	</ul>
                 		<%}
                 		}
                       %>
                    </ul>
                    <!-- Danh sách sản phẩm -->
                    <div class="d-flex flex-column">
                        <h3 class="product_title align-self-center mx-auto w-25 text-center pb-1 pt-5" id="row">SẢN PHẨM</h3>
                        <!-- Sắp xếp theo giá -->
                        <div class="dropdown d-flex flex-row-reverse"  onclick="sortByPrice()" >
                            <button type="button" class="btn btn-sort dropdown-toggle border border-2 " data-bs-toggle="dropdown"> Sắp xếp theo giá</button>
                            <ul class="dropdown-menu">
                                <li class="dropdown-item sort_low-to-high">
                                 <a href="<%if(id_loaisp == 0)
                                	 out.print("/ShopBanSach/products/low-to-high?sort=1");
                                 	else 
                                 		out.print("/ShopBanSach/products/low-to-high?sort=lowtohigh&id="+id_loaisp);
                                	 %>">Từ thấp đến cao<i class="fa-solid fa-check"></i></a> 
                           		</li>
                                <li class="dropdown-item sort_high-to-low">
                                    <a href="<%if(id_loaisp == 0)
                                    		out.print("/ShopBanSach/products/high-to-low?sort=1");
                                    else out.print("/ShopBanSach/products/high-to-low?sort=hightolow&id="+id_loaisp);
                                    	%>">Từ cao đến thấp<i class="fa-solid fa-check"></i></a>
                                </li>
                            </ul>
                        </div>                       	
                        <!-- Sản phẩm -->
                        <div class="row" >
						<c:forEach items="${products}" var="product" begin="<%=start -1%>" end="<%=end-1 %>">
	                        	 <div class="col-3 product">
									 <button data-bs-toggle="modal" data-bs-target="#product" class="card mt-5 mota" onclick="myfinction('${product.img }', '${product.name }','${product.price }','${product.publisher }','${product.description }','${product.author }','${product.id }')" >
	                                    <%-- <button  data-bs-toggle="modal" data-bs-target="#product" class="card mt-5 mota" onclick="myfinction('${encodeURIComponent(product.img)}', '${encodeURIComponent(product.name)}', '${encodeURIComponent(product.price)}', '${encodeURIComponent(product.publisher)}', '${encodeURIComponent(product.description)}', '${encodeURIComponent(product.author)}', '${encodeURIComponent(product.id)}')">
	                                   --%>  <img class="card-img-top pt-3" src="/ShopBanSach/view/image/${product.img }" alt="Card image">
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
	                                </button>
	                          <!-- Chi tiết sản phẩm 1-->
	                                <div class="modal fade" id="product">
	                                    <div class="modal-dialog">
	                                        <div class="modal-content pb-5" style="width: 800px; transform: translateX(-22%); margin-top: 15%;">
												<h1>${message }</h1>
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
	                                                        <div class="product_detail-name" id="name">Tên sản phẩm: </div>
	                                                        <div class="product_detail-author d-flex justify-content-between">
	                                                            <b>Tác giả:</b>
	                                                            <div class="product_detail-author-name " id="author"></div>
	                                                            </div>
	                                                        <div class="product_detail-type d-flex justify-content-between">
	                                                            <b>Nhà xuất bản:</b> 
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
	                                                                <div class="product_price-original "><del>100.000</del></div>
	                                                                <b class="product_price-current " id="price"></b>
	                                                            </div>
	                                                        </div>
	                                                        <div class="product_detail-description">
	                                                            <b>Mô tả ngắn: </b>
															<div class="product_detail-description-txt">${sp.description}</div>
	                                                        </div>
	                                                        <div class="product_detail-action d-flex justify-content-around pt-5">
	                                                            <div class="product_detail-amount d-flex align-items-center" onclick="amount()">
																	<i class="fa-solid fa-minus"></i>
	                                                                <input class="product_detail-amount-num" name="soluong" id="slsp" value="1">
	                                                                <i class="fa-solid fa-plus"></i>
	                                                            </div>

																<form action="/ShopBanSach/cartServlet" method="get">
																    <input type="hidden" name="id" id ="id_add">
																     <input type="hidden" name="id_sl" id ="id_sl">
																    <input type="submit" class="btn btn-primary" onclick ="soluong()" value="Thêm sản phẩm" >
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
			              <ul class="pagination align-self-center pt-5">
			              <%
			              if(int_page >1){ %>
			            	    <li class="page-item"><a class="page-link" href="<% if(click_loaisp == 1 && id_loaisp!=0 && high_to_low == 0 && sapxep ==0)
			            	    	
			            	    	out.print("/ShopBanSach/products/loai?id="+id_loaisp+"&&id_page="+(int_page-1));
			            	    else if(sapxep != 0){ 
			            	    	if(id_loaisp!=0)
			            	    		out.print("/ShopBanSach/products/low-to-high?sort=lowtohigh&id="+id_loaisp+"&&id_page="+(int_page-1));
			            	    	else
			            	    		out.print("/ShopBanSach/products/low-to-high?sort=1"+"&&id_page="+(int_page-1));
			            	    }
			            	    else if (high_to_low != 0){
			            	    	if(id_loaisp!=0)
			            	    		out.print("/ShopBanSach/products/high-to-low?sort=hightolow&id="+id_loaisp+"&&id_page="+(int_page-1));
			            		  else
			            	    	out.print("/ShopBanSach/products/high-to-low?sort=1"+"&&id_page="+(int_page-1));
			            	    }
			            	    	
			            	   
			            	    else out.print("/ShopBanSach/products/trang?id_page="+(int_page - 1));   %>"><i class="fa-solid fa-chevron-left"></i></a></li>
					          	
					            <%  }
			              else {%>
			            	  <li class="page-item disabled"><a class="page-link" href="<% if(click_loaisp == 1 && id_loaisp!=0 && sapxep == 0 && high_to_low == 0) 
			            		  out.print("/ShopBanSach/products/loai?id="+id_loaisp+"&&id_page="+(int_page+1));
			            	  else if(sapxep != 0){
			            		  if(id_loaisp!=0)
			            	    		out.print("/ShopBanSach/products/low-to-high?sort=lowtohigh&id="+id_loaisp+"&&id_page="+(int_page+1));
			            		  else
			            		  out.print("/ShopBanSach/products/low-to-high?sort=1"+(int_page+1));
			            	  }
			            	  else if (high_to_low != 0){
			            		  if(id_loaisp!=0)
			            	    		out.print("/ShopBanSach/products/high-to-low?sort=hightolow&id="+id_loaisp+"&&id_page="+(int_page+1));
			            		  else
			            	    	out.print("/ShopBanSach/products/high-to-low?sort=1"+"&&id_page="+(int_page+1));
			            	    }
			            	  else out.print("/ShopBanSach/products/trang?id_page="+(int_page + 1));%>">
			            	  <i class="fa-solid fa-chevron-left"></i></a></li> 
			              
			            <%   }
			   
			                for(int i = 0; i < tongtrang; i++){%> 
			            	  
		                        <li class="page-item"><a class="page-link" href="<% if(click_loaisp == 1 && id_loaisp!=0 && sapxep == 0 && high_to_low == 0)
		                        	out.print("/ShopBanSach/products/loai?id="+id_loaisp+"&&id_page="+(i+1));
		                        else if(sapxep !=0 ){
		                        	if(id_loaisp!=0)
			            	    		out.print("/ShopBanSach/products/low-to-high?sort=lowtohigh&id="+id_loaisp+"&&id_page="+(i+1));
			            		  else
		                        	out.print("/ShopBanSach/products/low-to-high?sort=1&&id_page="+(i+1));
		                        }
		                        else if (high_to_low != 0){
		                        	if(id_loaisp!=0)
			            	    		out.print("/ShopBanSach/products/high-to-low?sort=hightolow&id="+id_loaisp+"&&id_page="+(i+1));
			            		  else
			            	    	out.print("/ShopBanSach/products/high-to-low?sort=1"+"&&id_page="+(i+1));
			            	    }
									 else out.print("/ShopBanSach/products/trang?id_page="+(i+1));   %>" id ="<%= i + 1 %>" ><%=i+1%></a></li>
		                      
			             <%}
		               		
			              	if(int_page >= tongtrang){%> 
			              		<li class="page-item disabled"><a class="page-link" href="<% if(click_loaisp == 1 && id_loaisp!=0 && sapxep == 0 && high_to_low == 0)
			              			out.print("/ShopBanSach/products/loai?id="+id_loaisp+"&&id_page="+(int_page+1)); 
			              		else if(sapxep !=0){
			              			if(id_loaisp!=0)
			            	    		out.print("/ShopBanSach/products/low-to-high?sort=lowtohigh&id="+id_loaisp+"&&id_page="+(int_page+1));
			            		  else
			              			out.print("/ShopBanSach/products/low-to-high?sort=1"+(int_page+1));
			              		}
			              		else if (high_to_low != 0){
			              			if(id_loaisp!=0)
			            	    		out.print("/ShopBanSach/products/high-to-low?sort=hightolow&id="+id_loaisp+"&&id_page="+(int_page+1));
			            		  else
			            	    	out.print("/ShopBanSach/products/high-to-low?sort=1"+"&&id_page="+(int_page+1));
			            	    }
			              		else out.print("/ShopBanSach/products/trang?id_page="+(int_page + 1));%>">
			              		<i class="fa-solid fa-chevron-right"></i></a></li>
			              <%  	}
			              	else {%> 
			               <li class="page-item"><a class="page-link" href="<% if(click_loaisp == 1 && id_loaisp!=0 && sapxep == 0 && high_to_low == 0)
			            	   out.print("/ShopBanSach/products/loai?id="+id_loaisp+"&&id_page="+(int_page+1));
			               else if(sapxep !=0 ){
			            	   if(id_loaisp!=0)
		            	    		out.print("/ShopBanSach/products/low-to-high?sort=lowtohigh&id="+id_loaisp+"&&id_page="+(int_page+1));
		            		  else
			            	   out.print("/ShopBanSach/products/low-to-high?sort=1&&id_page="+(int_page+1));
			               }
			               else if (high_to_low != 0){
			            	   if(id_loaisp!=0)
		            	    		out.print("/ShopBanSach/products/high-to-low?sort=hightolow&id="+id_loaisp+"&&id_page="+(int_page+1));
		            		  else
		            	    	out.print("/ShopBanSach/products/high-to-low?sort=1"+"&&id_page="+(int_page+1));
		            	    }
			               else out.print("/ShopBanSach/products/trang?id_page="+(int_page + 1)); %>">
			               <i class="fa-solid fa-chevron-right"></i></a></li> 
			              <%	}
		                 %> 
			               </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="/view/template/footer.jsp" %>
    <script src="/ShopBanSach/view/js/account.js"></script>
    <script>
    var targetObject = document.getElementById("row");
    targetObject.scrollIntoView({ behavior: 'smooth', block: 'start' });
    	var col = <%=int_page %>;
    	document.getElementById(col).style.backgroundColor = "red"
        var firstTabEl = document.querySelector('#myTab li:last-child a')
        var firstTab = new bootstrap.Tab(firstTabEl)
        firstTab.show()
        var firstTabEl = document.querySelector('#myTab li:last-child a')
        var firstTab = new bootstrap.Tab(firstTabEl)
        firstTab.show()
        function myfinction(img, name, price,publisher, description,author,id ){
        	document.getElementById('img').src =  "../view/image/"+img
        	document.getElementById('name').innerText = name
        	document.getElementById('publisher').innerText = publisher
        	document.getElementById('author').innerText = author
        	document.getElementById('price').innerText = price
        	document.getElementById('id_add').value = id
        	console.log(img, name, price);
        }
        function soluong() {
        	document.getElementById('id_sl').value = document.getElementById('slsp').value
		}
       
      </script>
</body>
</html>