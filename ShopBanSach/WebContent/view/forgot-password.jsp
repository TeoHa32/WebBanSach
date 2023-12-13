<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quên mật khẩu</title>
    <link rel="stylesheet" href="/ShopBanSach/view/css/reset.css">
    <link rel="stylesheet" href="/ShopBanSach/view/css/style.css">
    <link rel="stylesheet" href="/ShopBanSach/view/fonts/fontawesome/css/all.css">
</head>
<body>
    <div id="wrapper">
       <%@include file="/view/template/header.jsp" %>
        <div id="wpcontent-user-forgot">
            <div class="forgot-banner">
                <img src="/ShopBanSach/view/image/fogot-password.png" alt="">
            </div>
            <div class="forgot-form">
                <h1>Đổi mật khẩu</h1>
                <div id="result">${error}</div>
                <form action="/ShopBanSach/accountServlet" method="POST">
                    <div class="email-OTP">
                        <label for="email">Email</label>
                        <input type="email" name="email" id="email" placeholder="Email?" value="${email}">
                        <div class="OTP" id="generateOTP">Lấy mã OTP</div> 
                    </div>
                    <div class="pw-new">
                        <label for="password">Mật khẩu mới</label>
                        <input type="password" name="password-new" id="password" placeholder="******" value="${password}">
                    </div>
                    <div class="pw-new">
                        <label for="password">Nhập lại khẩu</label>
                        <input type="password" name="re-password-new" id="re-password" placeholder="******" value="${password}">
                    </div>
                    <div>
                        <label for="otp">Mã OTP</label>
                        <input type="text" name="otp" id="otp" placeholder="Mã OTP?" value="${MaOTP}">
                    </div>
                    <div class="btn-user-forgot"><input type="submit" name="action" value="Xác nhận"></div>
                </form>
            </div>
        </div>
        <!-- FOOTER -->
  <!-- <%@include file="/view/template/header.jsp" %> -->      
    </div>
    <script src="/ShopBanSach/view/js/account.js"></script>
    <script src="/ShopBanSach/view/js/jquery-3.7.1.min.js"></script>
 <script>
        $(document).ready(function() {
            $("#generateOTP").click(function() {
                var email = $("#email").val();
                $.ajax({
                    url: "/ShopBanSach/accountServlet",
                    type: "POST",
                    data: { email: email, action: "generateOTP" },
                    success: function(response) {
                        $("#result").html(response);
                    }
                });
            });
        });
    </script>
</body>
</html>