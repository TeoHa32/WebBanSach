<%@ page language="java"
    pageEncoding="UTF-8"%>
    <%@ page import="model.category" %>
    <%@ page import="model.sub_category" %>
    <%@ page import="model.categories" %>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/ShopBanSach/productServlet" method="POST" enctype="multipart/form-data">
                <div>
                  <label for="">Tên</label>
                  <input type="text" name="product-name" /><br />
                </div>
                <div>
                  <label for="">Tác giả</label>
                  <input type="text" name="product-author" /><br />
                </div>
                <div>
                  <label for="">Nhà xuất bản</label>
                  <input type="text" name="product-publisher" /><br />
                </div>
                <div>
                <label>Hình ảnh</label>
                <input type="file" name="img_product" >
                </div>
                <div>
                  <label for="">Giá</label>
                  <input type="number" name="product-price" /><br />
                </div>
                <div>
                  <label for="">Số lượng</label>
                  <input type="number" name="product-quantity" /><br />
                </div>
                <div>
                  <label for="">Giảm gá</label>
                  <input type="number" name="product-onsale" /><br />
                </div>
                <div>
                  <label for="">Mô tả</label>
                  <input type="text" name="product-description" /><br />
                </div>
                <div>
                  <label for="">Category</label>
                  <select name="category" id="category">
                  <option value="">---</option>
                  <%
                  
                    	ArrayList<category> list = categories.loadCategories();
                		  for(category c : list){
                			  out.print("<option id='"+c.getId()+"' value='"+c.getId()+"'>"+c.getName()+"</option>");
                		  }
                    %>
                    
                  </select>
                  <label for="">Sub category</label>
                  <select name="sub_category" id="">
                  <option value="">---</option>
                  <%
                  		ArrayList<sub_category> list_sub = categories.loadSubCategories();
                		  for(sub_category c : list_sub){
                			  out.print("<option class='class"+c.getCategory_id()+"' value="+c.getId()+">"+c.getName()+"</option>");
                		  }
                    %>
                  </select>
                </div>
                <button>add</button>
                <input type="submit" value="Sửa" />
                <input type="submit" value="Xóa" />
              </form>
</body>
</html>
<script>
  
  const sub_sgk = document.querySelectorAll("select option.class1");
  const sub_snn = document.querySelectorAll("select option.class2");
  const sub_stn = document.querySelectorAll("select option.class3");
  const sub_svh = document.querySelectorAll("select option.class4");
  for (var i = 0; i < sub_sgk.length; i++) {
 var element = sub_sgk[i];
 console.log(element.textContent); 
}
  function show(category){
   // sub_sgk.style.color="red";
   // sub_snn.style.display="none";
   // sub_stn.style.display="none";
   // sub_svh.style.display="none";

   // category.style.display="block";
   sub_sgk.forEach(function(option) {
option.style.display = "none"; 
 });
 sub_snn.forEach(function(option) {
option.style.display = "none"; 
 });
 sub_stn.forEach(function(option) {
option.style.display = "none"; 
 });
 sub_svh.forEach(function(option) {
option.style.display = "none"; 
 });
 category.forEach(function(option) {
option.style.display = "block"; 
 });
  }

  document.getElementById("category").addEventListener("change",function(){
   const selectedCategory = this.value;
   console.log(selectedCategory);
   if(selectedCategory=="1"){
     show(sub_sgk);
   } else
   if(selectedCategory=="2"){
     show(sub_snn);
   }else
   if(selectedCategory=="3"){
     show(sub_stn);
   }else
   if(selectedCategory=="4"){
     show(sub_svh);
   }
  })
</script>