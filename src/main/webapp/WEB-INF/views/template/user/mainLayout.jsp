<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
        <script type="text/javascript" src="/resources/include/js/mainPageBanner.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
    	<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
        

        <script type="text/javascript">
        $(function(){
        	if("${memberLogin.u_grade}" === "2") {
        		let errorMsg= "${errorMsg}";
                if(errorMsg!=""){
                   alert(errorMsg);
                   errorMsg ="";
                }
        	}
        	
	       	/* 메인 배너 자동 슬라이드 */
       	    setInterval(function(){
       	        $('.swiper-button-next').trigger('click');
       	    }, 4000);
       	    
       	 	/* 제목 클릭 시 상세 페이지 이동을 위한 처리 이벤트 */
			$(".goDetail").click(function(){
				let an_no = $(this).parents("li").attr("data-no");
				$("#an_no").val(an_no);
				$("#detailForm").attr({
					"method":"get",
					"action":"/notice/noticeDetail"
				});
				$("#detailForm").submit();
			});
        })
        </script>
    </head>
	<body>
		<!-- header -->
		<div class="wrapper">
			<form id="detailForm" name="detailForm">
				<input type="hidden" name="an_no" id="an_no" />
			</form>
        	<tiles:insertAttribute name="header" />
            
            <!-- Begin page content -->
            <section class="visual">
		        <div class="swiper mySwiper">
		            <div class="swiper-wrapper">
	              		<div class="swiper-slide"><img src="/resources/include/img/mainbanner1.png" alt=""></div>
	           			<div class="swiper-slide"><img src="/resources/include/img/mainbanner2.png" alt=""></div>
	              		<div class="swiper-slide"><img src="/resources/include/img/mainbanner3.png" alt=""></div>
	            	</div>
		            <div class="swiper-button-next"></div>
		            <div class="swiper-button-prev"></div>
		            <div class="swiper-pagination"></div>
	          	</div>
		    </section>
		    
		    <div class="section_second">
			    <div class="middle2">
		            <ul>
			            <c:choose>
							<c:when test="${ not empty noticeList }">
								<c:forEach var="notice" items="${ noticeList }" begin="1" end="4" step="1" varStatus="status">
									<li data-no="${ notice.an_no }">
				                        <div class="block">
				                            <div class="comment">
				                                <p class="goDetail">${ notice.an_title }</p>
				                                <p>
				                                    <i class="fa-sharp fa-solid fa-clock-nine"></i>${ notice.an_created_at }<span class="line_f">  |  </span>
				                                    <i class="fa-solid fa-eye"></i> ${ notice.an_cnt }
				                                </p>
				                            </div>
				                        </div>
					                </li>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4" class="tac text-center">등록된 상품 정보가 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
		            </ul>
		        </div>
		    </div>
            
            
            <div id="contentWrap">
                <a href="" style="display: block;text-align: center; margin: 40px 0;">&nbsp;</a>
            </div>
            
            <!-- footer -->
            <footer class="footerWraper">
                <tiles:insertAttribute name="footer" />
            </footer>
        </div>
	</body>
</html>