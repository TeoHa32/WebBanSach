<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang liên hệ</title>
    <!-- BOOTSTRAP -->
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- ICON -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="icon" type="image/x-icon" href="../image/icon.png">
     <link rel="stylesheet" href="../css/main1.css">
    <link rel="stylesheet" href="../css/style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<%@include file="/view/template/header.jsp" %>
	
	 <div class="container mt-4 p-5 bg-primary text-white background d-flex">
        <h2 class="text-bg-light py-3 px-5 text-center align-self-center w-75 m-auto">CHÚNG TÔI CÓ THỂ GIÚP GÌ CHO BẠN?</h2>
    </div>

    <!-- Form liên hệ -->

    <div class="container p-5 d-flex w-100">

        <img src="../image/contact1.png" alt="" class="contact_img rounded-start-3">
        <form action="" class="contact_form border border-2 d-flex flex-column rounded-end-3 px-3 border-start-0">
            <h3 class="contact_form-text pt-5 pb-4 text-center">THÔNG TIN LIÊN HỆ</h3>

            <div class="form_contact-group d-flex">
                <div class="form_contact-detail px-4 w-50">
                    <h6 class="contact_form-title">Họ và Tên</h6>
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1"><i class="fa-solid fa-user"></i></span>
                        <input type="text" class="form-control" placeholder="Nhập họ tên ..." aria-label="fullname" aria-describedby="basic-addon1" name="fullname">
                    </div>
                </div>
                <div class="form_contact-detail px-4 w-50">
                    <h6 class="contact_form-title">Email</h6>
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon2"><i class="fa-solid fa-envelope"></i></span>
                        <input type="text" class="form-control" placeholder="Nhập email ..." aria-label="email" aria-describedby="basic-addon2" name="email">
                    </div>
                </div>
            </div>

            <div class="form_contact-group d-flex">
                <div class="form_contact-detail px-4 w-50">
                    <h6 class="contact_form-title">Số điện thoại</h6>
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon3"><i class="fa-solid fa-phone"></i></span>
                        <input type="text" class="form-control" placeholder="Nhập số điện thoại ..." aria-label="phone" aria-describedby="basic-addon3" name="phone">
                    </div>
                </div>
                <div class="form_contact-detail px-4 w-50">
                    <h6 class="contact_form-title">Địa chỉ</h6>
                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon4"><i class="fa-solid fa-house"></i></span>
                        <input type="text" class="form-control" placeholder="Nhập địa chỉ ..." aria-label="address" aria-describedby="basic-addon4" name="address">
                    </div>
                </div>
            </div>
           
            <button class="btn btn-primary align-self-center m-auto w-25 my-4"><b class="text-white">Xác nhận</b></button>
        </form>
    </div>

    <!-- Địa chỉ -->
    <div class="container  pt-3 pb-5">
        <div class="address d-flex flex-column">
            <h4 class="address_title pb-4 text-center">ĐỊA CHỈ NHÀ SÁCH</h4>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.668676918106!2d106.67967527465876!3d10.759997859497293!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f1c81c64183%3A0xd3109d7a7a8f753c!2zMjczIMSQLiBBbiBExrDGoW5nIFbGsMahbmcsIFBoxrDhu51uZyAzLCBRdeG6rW4gNSwgVGjDoG5oIHBo4buRIEjhu5MgQ2jDrSBNaW5oLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1701078619819!5m2!1svi!2s" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade" class="address_map w-75 align-self-center m-auto border rounded-4"></iframe>
        </div>
    </div>
    
    <%@include file="/view/template/footer.jsp" %>
</body>
</html>