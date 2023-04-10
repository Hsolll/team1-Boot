<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<title><tiles:getAsString name="title" /></title>

        <!-- 구글폰트 사용 링크 -->
        <link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Patrick+Hand&
        family=Playfair+Display:wght@400;500&family=Poppins&family=Roboto:wght@900&family=Rubik+Microbe&family=Single+Day&display=swap" rel="stylesheet">
		
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/images/common/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/common/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다.--> 
		<!--[if lt IE 9]>
        <script src="../js/html5shiv.js"></script>
        <![endif]-->
        
        <link rel="stylesheet" href="/resources/include/css/ombLayout.css">
        <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css">
        
        <!-- 폰트어썸 사용 링크 -->
        <script src="https://kit.fontawesome.com/64a5181ca4.js" crossorigin="anonymous"></script>
        
        <script type="text/javascript" src="/resources/include/js/jquery-3.6.2.min.js"></script>
        <script type="text/javascript" src="/resources/include/js/subList.js"></script>
        
        <!-- 스와이퍼 -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
		<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function () {
				$(".swiper-slide").not(".active").hide(); //화면 로딩 후 첫번째 div를 제외한 나머지 숨김
				
				setInterval(nextSlide, 4000); //4초(4000)마다 다음 슬라이드로 넘어감
			});
		</script>
    </head>
	<body>
		<!-- header -->
		<div class="wrapper">
        	<tiles:insertAttribute name="header" />
            
            <!-- Begin page content -->
            <section class="contentWrapper">
                <div class="content_wrap">
                    <br><br>
                    <a href="/"><img src="/resources/include/img/banner.png" alt="메인페이지" class="mt30"></a><br><br>
                    <div class="main_content">
                        <p>Oh My Baby는</p>
                        유아용품 중고거래 사이트입니다.
                    </div>
                    
                    <!-- Swiper -->
					  <div class="swiper mySwiper">
					    <div class="swiper-wrapper">
					      <div class="swiper-slide active"><a>일</a></div>
					      <div class="swiper-slide">Slide 2</div>
					      <div class="swiper-slide">Slide 3</div>
					      <div class="swiper-slide">Slide 4</div>
					      <div class="swiper-slide">Slide 5</div>
					      <div class="swiper-slide">Slide 6</div>
					      <div class="swiper-slide">Slide 7</div>
					      <div class="swiper-slide">Slide 8</div>
					      <div class="swiper-slide">Slide 9</div>
					    </div>
					    <div class="swiper-button-next"></div>
		    			<div class="swiper-button-prev"></div>
					    <div class="swiper-pagination"></div>
					  </div>
                </div>
            </section>
            
            
            <div id="contentWrap">
                <a href="" style="display: block;text-align: center; margin: 40px 0;">&nbsp;</a>
            </div>
            
            <!-- footer -->
            <footer class="footerWraper">
                <tiles:insertAttribute name="footer" />
            </footer>
        </div>
	</body>
	
	<!-- 스와이퍼 스크립트-->
	<script>
    var swiper = new Swiper(".mySwiper", {
      slidesPerView: 3,
      spaceBetween: 30,
      freeMode: true,
      loop: true,
      navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
	    pagination: {
	      el: ".swiper-pagination",
	    },
    });
  </script>
</html>