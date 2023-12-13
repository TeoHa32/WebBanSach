<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.category" %>
    <%@ page import="model.product" %>
    <%@ page import="model.products" %>
    <%@ page import="model.sub_category" %>
    <%@ page import="model.categories" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.util.List" %>
    
<div class="right-content">
        <input type="text" id="txtsearch" />
        <input type="button" value="Tìm Kiếm" id="btsearch" />
        
        <section id="products" >
            <div id="table-product" >
                <div class="table">
                    <table>
                        <thead>
                           <tr>
                            <th>STT</th>
                            <th>Tên sản phẩm</th>
                            <th>Tác giả</th>
                            <th>Giá sản phẩm</th>
                            <th>Số lượng</th>
                            <th>Category</th>
                            <th>Select</th>
                           </tr> 
                        </thead>
                        <tbody>
                        <% List<product> listProduct = products.loadProduct();
                        int count=0;
                		for(product p : listProduct) {
                			count++;
                			out.print("<tr>");
                			out.print("<td>"+count+"</td>");
                			out.print("<td>"+p.getName()+"</td>");
                			out.print("<td>"+p.getAuthor()+"</td>");
                			out.print("<td>"+p.getPrice()+"</td>");
                			out.print("<td>"+p.getQuantity()+"</td>");
                			out.print("<td>"+p.getCategory_id()+"</td>");
                			out.print("<td>");
                			out.print("<div style='display: flex;'>");
                			out.print("<div class='edit'>");
                			out.print("<a href='?page=products&id="+p.getId()+"'><i class='fa-solid fa-circle-info'></i></a>");
                			out.print("</div>");
                			out.print("<div>");
                			out.print("<form action='/ShopBanSach/productServlet' class='form-delete' method='POST'>");
                			out.print("<input type='hidden' value='"+p.getId()+"' name='id'> ");
                			out.print("<button class='delete' name='btn-delete'><i class='fa-solid fa-trash'></i> </button>");
                			out.print("</form>");
                			out.print("</div>");
                			out.print("</div>");
                			out.print("</td>");
                			out.print("</tr>");
                		} %>
                        </tbody>
                    </table>
                </div> 
            </div>
            <%  String idEdit = request.getParameter("id");
            String author = null;
            String name = null;
            double onsale = -1;
            int category =0;
            int sub_category = 0;
            String publisher = null;
            double price = -1;
            int quantity = -1;
            String img = null;
            String desciption =null;
            int id_product=0;
            if(idEdit != null ){
            	int id = Integer.parseInt(idEdit);
            	id_product = id;
            	product product = products.searchProductById(id);
            	author =product.getAuthor();
            	name = product.getName();
            	onsale = product.getOnsale();
            	category = product.getCategory_id();
            	sub_category = product.getSub_category_id();
            	publisher = product.getPublisher();
            	price = product.getPrice();
            	quantity = product.getQuantity();
            	img = product.getImg();
            	desciption = product.getDescription();
            }
            %>
            <div id="from-product">
                <div class="form">
                    <h2>THÊM SẢN PHẨM</h2>
                    <form action="/ShopBanSach/productServlet" method="POST" enctype="multipart/form-data">
                        <input type="hidden" name="id_product" value="<%if(id_product >0) out.print(id_product);%>">
                        <div class="flex ">
                            <label> Tên sản phẩm</label>
                            <input type="text" name="txtName-product" value="<% if(name!=null) out.print(name);%>"/>
                        </div>
                        <div class="flex">
                            <label> Tác giả</label>
                            <input type="text" name="txtauthor-product" value="<% if(author!=null) out.print(author); %>"/>
                        </div>
                        <div class="flex">
                            <label> Giảm giá</label>
                            <input type="number" name="onsale-product" value="<% if(onsale >=0) out.print(onsale);%>"/>
                        </div>
                        <div class="flex">
                            <label for="">Category</label>
                            <select name="category" id="category">
                            <option value="">---</option>
                            <%
                    	ArrayList<category> list = categories.loadCategories();
                		  for(category c : list){
                			  out.print("<option id='"+c.getId()+"' value='"+c.getId()+"'");
                			  if(category >=0 && category == c.getId()) out.print("selected");
                			  out.print(">"+c.getName()+"</option>");
                		  }
                    %>
                            </select>
                            </div>
                            <div class="flex">
                            <label> Nhà xuất bản</label>
                            <input type="text" name="txtpublisher-product" value="<% if(publisher!=null) out.print(publisher); %>"/>
                        </div>
                        <div class="flex">
                            <label> Giá sản phẩm</label>
                            <input type="number" name="price-product" value="<% if(price >=0) out.print(price); %>"/>
                        </div>
                        
                        <div class="flex">
                            <label> Số lượng</label>
                            <input type="number" name="quantity-product" value="<% if(quantity >=0) out.print(quantity); %>"/>
                        </div>
                        
                        <div class="flex">
                            <label>Sub_category</label>
                            <select name="sub_category" id="">
                                <option value="">---</option>
                                <%
                  		ArrayList<sub_category> list_sub = categories.loadSubCategories();
                		  for(sub_category c : list_sub){
                			  out.print("<option class='class"+c.getCategory_id()+"' id='"+c.getId()+"' value='"+c.getId()+"'");
                			  if(sub_category >=0 && sub_category == c.getId()) out.print("selected");
                			  out.print(">"+c.getName()+"</option>");
                		  }
                    %>
                                </select>
                                </div>
                            <div class="block img" style="display: flex; ">
                                <div><label> Hình ảnh</label>
                                    <input type="file" name="img-product"  style="display: none;"/>
                                    <div class="choose"><span>Chọn tệp</span></div></div>
                                <div class="show-img"><img src="<%if(img!=null) out.print(request.getContextPath()+"/view/image/"+img); %>" alt=""></div>
                            </div>
                            <div class="block">
                                <label> Mô tả</label>
                                <textarea name="txtDescription-product" id="" cols="54" rows="5" ><% if(desciption !=null) out.print(desciption); %></textarea>
                            </div >
                           <button id="btAddProduct" class="btnAdd " name="btAddProduct">Thêm</button>
                           <button id="btEditProduct" class="btnEdit" name="btEditProduct">Sửa</button>
                    </form>
                </div>
            </div>
        </section>
        
    </div>

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
    const inputFile = document.querySelector("input[type='file']");
const button = document.querySelector(".choose");
button.addEventListener("click", () => {
  inputFile.click();
});
const img = document.querySelector(".show-img img");

inputFile.addEventListener("change", () => {
  const file = inputFile.files[0];
  if (file.type.match("image.*")) {
    const src = URL.createObjectURL(file);

    img.src = src;
  }
});
</script>