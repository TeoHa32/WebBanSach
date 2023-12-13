<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="/ShopBanSach/accountServlet" method="post">
                    <h1>Đổi mật khẩu</h1>
                <p class="error">${error } </p>
                    <div>
                        <label for="password-old">Nhập mật khẩu cũ</label>
                        <input type="password" name="password-old" id="password-old"  value="" >
                    </div>
                    <div>
                        <label for="password-new">Nhập mật khẩu mới</label>
                        <input type="password" name="password-new" id="password-new"  value="" >
                    </div>
                    <div>
                        <label for="re-password-old">Nhập lại mật khẩu</label>
                        <input type="password" name="re-password-old" id="re-password-old"  value="" >
                    </div>
                    <div class="btn-user"><input type="submit" name="action" value="Thay đổi"></div>
                </form>