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
		<title>OhMybaby</title>

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
        <!-- Bootstrap core CSS -->
	    <link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">
	
	    <!-- Custom styles for this template -->
	    <link href="/resources/include/dist/css/dashboard.css" rel="stylesheet">
        
        <!-- 폰트어썸 사용 링크 -->
        <script src="https://kit.fontawesome.com/64a5181ca4.js" crossorigin="anonymous"></script>
        
        <script type="text/javascript" src="/resources/include/js/jquery-3.6.2.min.js"></script>
        <script type="text/javascript" src="/resources/include/js/subList.js"></script>
        
    </head> 
	<body>
		<!-- header -->
        <div class="wrapper">
            <tiles:insertAttribute name="header" />
            
            <!-- Begin page content -->
            <section class="contentWrapper">
                <div class="content_wrap">
                    <div class="page-header">
						<h1><tiles:getAsString name="title" /></h1>
					</div>
					
					 <div class="container-fluid">
					      <div class="row">
					        <div class="col-sm-3 col-md-2 sidebar" style="padding-top:0;">
					         <tiles:insertAttribute name="left" />
        					</div>
	                <tiles:insertAttribute name="body" />
	                </div>
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
	
	<!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/resources/include/dist/js/bootstrap.min.js"></script>
    <script src="/resources/include/dist/assets/js/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
</html>