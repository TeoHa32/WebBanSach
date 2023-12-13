<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang giới thiệu</title>
    <!-- BOOTSTRAP -->
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- ICON -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="icon" type="image/x-icon" href="../image/icon.png">
     <link rel="stylesheet" href="../view/css/introduce.css">    
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<%@include file="/view/template/header.jsp" %>
	
	 <!-- Banner -->
    <div class="container-fluid">
        <div class="banner d-flex">
            <div class="banner_txt d-flex align-items-center flex-column my-auto">
                <h2 class="banner_txt-title mb-4">Khám phá văn hóa và tri thức đích <br>thực tại cửa hàng sách chúng tôi</h2>
                <div class="banner_txt-content mx-5 ">                
                    <p class="banner_txt-content ">Nơi mang đến cho bạn những trang <br>sách tinh túy, cung cấp nguồn cảm <br> hứng và kỹ năng mới, để bạn trở <br>thành phiên bản tốt hơn của chính mình.</p>                    
                </div>
            </div>
            <img src="/ShopBanSach/view/image/banner.png" class="banner_img" alt="Ảnh banner giới thiệu">
        </div>
    </div>
    <!-- Content -->
    <div class="container-fluid">        
        <div class="content">
            <!-- Content1 -->
            <div class="row">
                <div class="col-6 content1_img_chua">
                    <img src="/ShopBanSach/view/image/Thomas.png" class="content1_img" alt="">
                </div>
                <div class="col-6 content1_txt_chua">
                    <p class="content1_txt">“Tất cả những gì con người làm, nghĩ hoặc trở<br> thành được bảo tồn một cách kỳ diệu trên <br> những trang sách.” - Ernest Hemingway</p>
                </div>
            </div>      
            <!-- Content2 -->
            <div class="tittle">
                <div><h1>DANH MỤC SÁCH</h1></div>
                <div class="tittle_txt">Khám phá và tìm hiểu về những cuốn sách đa dạng và thú vị từ nhiều lĩnh vực khác nhau</div>
            </div>
            <div class="row">
                <div class="col-3">
                    <div class="content2">
                        <div class="chua"> 
                            <div class="content_circle">
                                <img class="content2_img" src="../view/image/cat1.png" alt="">
                            </div>
                        </div>
                        <div>
                            <h4>Sách Giáo Khoa</h4>
                            <p class="content2_txt">Thiết kế và biên soạn bởi các chuyên gia trong lĩnh vực tương ứng, đảm bảo cung cấp nền tảng kiến thức toàn diện và hệ thống cho bạn.</p>
                        </div>
                    </div>
                </div>
                <div class="col-3">
                    <div class="content2">
                        <div class="chua"> 
                            <div class="content_circle">
                                <img  class="content2_img" src="../view/image/cat3.png" alt="">
                            </div>
                        </div>
                        <div>
                            <h4>Sách Ngoại Ngữ</h4>
                            <p class="content2_txt">Cung cấp cho bạn cách tiếp cận hệ thống và có cấu trúc để học từ vựng, ngữ pháp, phát âm và kỹ năng giao tiếp.</p>
                        </div>
                    </div>
                </div>
                <div class="col-3">
                    <div class="content2">
                        <div class="chua"> 
                            <div class="content_circle">
                                <img  class="content2_img" src="../view/image/cat6.png" alt="">
                            </div>
                        </div>
                        <div>
                           	<h4>Sách Thiếu Nhi</h4>
                            <p class="content2_txt">Những cuốn sách thú vị và hấp dẫn dành cho các độc giả nhí, giúp khơi dậy niềm yêu thích đọc sách và khám phá thế giới.</p>
                        </div>
                    </div>
                </div>
                <div class="col-3">
                    <div class="content2">
                        <div class="chua"> 
                            <div class="content_circle">
                                <img  class="content2_img" src="../view/image/cat4.png" alt="">
                            </div>
                        </div>
                        <div>
                            <h4>Sách Văn Học</h4>
                            <p class="content2_txt">Mang đến những tác phẩm văn học đa dạng và sâu sắc, giúp bạn khám phá thế giới của văn chương và trải nghiệm những câu chuyện tuyệt vời.</p>
                        </div>
                    </div>
                </div>
            </div>    
            <!--Content 3  -->
            <div class="row content3">                
                    <div class="col-6">
                        <img class="content3_img" src="/ShopBanSach/view/image/about-img.png" alt="">
                    </div>
                    <div class="col-6">
                        <h1>VỀ CHÚNG TÔI</h1>
                        <div class="content3_txt">BookStore là một cửa hàng sách chuyên nghiệp và cam kết mang đến cho khách hàng những trải nghiệm đọc sách tuyệt vời và đa dạng.
                            <br> <br>
                            Tại cửa hàng sách của chúng tôi, chúng tôi tự hào có một bộ sưu tập đa dạng và phong phú của các loại sách từ nhiều lĩnh vực khác nhau. Chúng tôi cung cấp những cuốn sách văn học, sách học thuật, sách thiếu nhi, sách kỹ năng sống, sách nghệ thuật, sách khoa học và nhiều thể loại khác. Bạn sẽ tìm thấy những tác phẩm của các tác giả nổi tiếng và những nhà văn mới nổi, đáp ứng nhu cầu đa dạng của độc giả.</div>                        
                        <button class="content3_btn" type="button" data-bs-toggle="collapse" data-bs-target="#demo">Đọc thêm</button>
                        <div id="demo" class="collapse content3_txt">
                            Chúng tôi luôn lựa chọn những cuốn sách chất lượng cao, được xuất bản bởi các nhà xuất bản uy tín, để đảm bảo rằng bạn nhận được những tác phẩm chất lượng và đáng đọc. Chúng tôi cũng cập nhật liên tục bộ sưu tập của mình với những cuốn sách mới nhất trên thị trường, đảm bảo rằng bạn luôn có nhiều lựa chọn thú vị.
                            <br> <br>
                            Ngoài việc cung cấp sách in truyền thống, chúng tôi cũng cung cấp các sản phẩm sách điện tử và dịch vụ đọc sách trực tuyến, mang đến sự tiện lợi và linh hoạt cho khách hàng. Bạn có thể truy cập vào cửa hàng sách của chúng tôi từ bất kỳ thiết bị nào và khám phá thế giới của sách một cách dễ dàng.
                            <br> <br>
                            Đội ngũ nhân viên của chúng tôi luôn sẵn sàng tư vấn và hỗ trợ khách hàng trong việc chọn sách phù hợp với sở thích và nhu cầu của họ. Chúng tôi tin rằng sách có thể là nguồn cảm hứng và tri thức, và chúng tôi muốn chia sẻ niềm đam mê này với tất cả mọi người.
                            <br> <br>
                            Hãy đến và trải nghiệm cửa hàng sách của chúng tôi. Chúng tôi cam kết mang đến cho bạn một trải nghiệm đọc sách tuyệt vời và một không gian thú vị để khám phá những câu chuyện và kiến thức mới.
                        </div>
                    </div>                
            </div>
            <!--Content 4  -->
            <div class="row content3"> 
                <div class="col-6">
                    <h1>NHIỆM VỤ CỦA CHÚNG TÔI</h1>
                    <div class="content3_txt">Chúng tôi cam kết đem lại cho khách hàng trải nghiệm đọc sách tuyệt vời và phục vụ mọi nhu cầu đọc sách của họ.
                        <br> <br>
                        Chúng tôi đặt mục tiêu mang đến cho khách hàng một bộ sưu tập sách đa dạng, bao gồm các thể loại và lĩnh vực khác nhau. Chúng tôi luôn nỗ lực để cung cấp những cuốn sách từ các tác giả nổi tiếng và những tác phẩm mới nhất, đáp ứng sở thích và nhu cầu đa dạng của độc giả. 
                    </div>
                    <button class="content3_btn" type="button" data-bs-toggle="collapse" data-bs-target="#data">Đọc thêm</button>
                    <div id="data" class="collapse content3_txt">
                        Cung cấp một bộ sưu tập đa dạng: Chúng tôi đặt mục tiêu mang đến cho khách hàng một bộ sưu tập sách đa dạng, bao gồm các thể loại và lĩnh vực khác nhau. Chúng tôi luôn nỗ lực để cung cấp những cuốn sách từ các tác giả nổi tiếng và những tác phẩm mới nhất, đáp ứng sở thích và nhu cầu đa dạng của độc giả.
                        <br> <br>
                        Chất lượng sách hàng đầu: Chúng tôi đặt mức cao về chất lượng sách mà chúng tôi cung cấp. Chúng tôi lựa chọn những cuốn sách chất lượng cao, được xuất bản bởi các nhà xuất bản uy tín, đảm bảo rằng khách hàng nhận được những tác phẩm đáng đọc và đáng giá.
                        <br> <br>
                        Dịch vụ tận tâm và chuyên nghiệp: Đội ngũ nhân viên của chúng tôi luôn sẵn sàng tư vấn và hỗ trợ khách hàng. Chúng tôi hiểu rằng mỗi người có nhu cầu đọc sách khác nhau, vì vậy chúng tôi sẽ lắng nghe và tư vấn để khách hàng có được sự lựa chọn phù hợp với sở thích và nhu cầu của mình.
                        <br> <br>
                        Khám phá và truyền cảm hứng: Chúng tôi tin rằng sách có thể là nguồn cảm hứng và tri thức. Chúng tôi muốn khách hàng không chỉ đọc sách mà còn khám phá những câu chuyện, ý nghĩa và kiến thức mới. Chúng tôi hy vọng rằng trải nghiệm đọc sách của khách hàng tại cửa hàng của chúng tôi sẽ mang lại sự truyền cảm hứng và mở rộng kiến thức.
                    </div>
                </div>  
                <div class="col-6 content4_anh">
                    <img class="content4_img" src="../view/image/mission.png" alt="">
                </div>    
            </div>                    
        </div>        
    </div>
    <%@include file="/view/template/footer.jsp" %>
</body>
</html>