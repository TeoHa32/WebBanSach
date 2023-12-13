<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="right-content">
        <input type="text" id="txtsearch" />
        <input type="button" value="Tìm Kiếm" id="btsearch" />
        
        <section id="Customer" >
            <div id="table-customer" >
                <div class="table">
                    <table>
                        <thead>
                           <tr>
                    
                            <th>STT</th>
                            <th>Tên khách hàng</th>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Select</th>
                           </tr> 
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Sản phẩm 1</td>
                                <td>văn A</td>
                                <td> Báo trẻ</td>
                                <td>100000</td>
                                <td>0</td>
                                <td>4</td>
                              
                                <td> 
                                <div style="display: flex;">
                                   <div class="edit">
                                   <a href="?page=products&id="><i class="fa-solid fa-pen-to-square"></i></a>
                                   </div>
                                    
                                    <div>
                                        <form action="" class="form-delete">
                                            <input type="hidden" value="">
                                            <button class="delete"><i class="fa-solid fa-trash"></i></button>
                                        </form>
                                    </div>
                                    </div>
                                </td>
                                
                            </tr>
                        </tbody>
                    </table>
                </div> 
            </div>

            <div id="from-customer">
                <div class="form">
                    <h2>THÊM KHÁCH HÀNG</h2>
                    <form action="">
                        <div class="flex ">
                            <label> Họ và tên</label>
                            <input type="text" name="fullname-customer"/>
                        </div>
                        <div class="flex">
                            <label> Username</label>
                            <input type="text" name="username-customer"/>
                        </div>
                        <div class="flex">
                            <label> Password</label>
                            <input type="password" name="password-customer"/>
                        </div>
						<div class="flex">
                            <label> Email</label>
                            <input type="text" name="Email-customer"/>
                        </div>
                            <div class="flex">
                            <label> Address</label>
                            <input type="text" name="Address-customer"/>
                        </div>
                            <div class="flex">
                                <label>Phone</label>
                                <input type="number" name="phone-customer">
                            </div >
					<div class="block"></div>
					<button id="btAddCustomer" name="btnCustomer" class="btnAdd">Thêm</button>
                    </form>
                </div>
            </div>
        </section>
        
    </div>
