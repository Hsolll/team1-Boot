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
        
        <link href="/resources/include/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="/resources/include/css/ombLayout.css">
        
        <!-- 폰트어썸 사용 링크 -->
        <script src="https://kit.fontawesome.com/64a5181ca4.js" crossorigin="anonymous"></script>
        
        <script type="text/javascript" src="/resources/include/js/jquery-3.6.2.min.js"></script>
    </head>
	<body>
		<!-- header -->
        <tiles:insertAttribute name="header" />
            
            <!-- Begin page content -->
            <section class="contentWrapper">
                <div class="content_wrap">
                    <br><br>
                    <a href="#">
                        <img src="/resources/include/img/banner.png" alt="">
                    </a>
                    <br><br>
                    <div class="main_content">
                        <p>Oh My Baby는</p>
                        유아용품 중고거래 사이트입니다.
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
        
        <!-- Bootstrap core JavaScript
		================================================== -->
        <script src="/resources/dist/js/bootstrap.min.js"></script>
	</body>
</html>