<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="right-content">
        <input type="text" id="txtsearch" />
        <input type="button" value="Tìm Kiếm" id="btsearch" />
        
        <section id="employee" >
            <div id="table-employee" >
                <div class="table">
                    <table>
                        <thead>
                           <tr>
                            <th>STT</th>
                            <th>Tên nhân viên</th>
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

            <div id="from-employee">
                <div class="form">
                    <h2>THÊM NHÂN VIÊN</h2>
                    <form action="">
                        <div class="flex ">
                            <label> Họ và tên</label>
                            <input type="text" name="fullname"/>
                        </div>
                        <div class="flex">
                            <label> Username</label>
                            <input type="text" name="username"/>
                        </div>
                        <div class="flex">
                            <label> Password</label>
                            <input type="password" name="password"/>
                        </div>
						<div class="flex">
                            <label> Email</label>
                            <input type="text" name="Email"/>
                        </div>
                            <div class="flex">
                            <label> Address</label>
                            <input type="text" name="Address"/>
                        </div>
                            <div class="flex">
                                <label>Phone</label>
                                <input type="number" name="phone">
                            </div >
					<div class="block"></div>
					<button id="btAddEmployee" name="btnEmployee" class="btnAdd">Thêm</button>
                    </form>
                </div>
            </div>
        </section>
        
    </div>
