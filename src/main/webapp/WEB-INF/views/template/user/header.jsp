<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true"%>

<div class="top_banner">
	<div class="top_wrap">
		<ul>
			<!-- <li><a href="/member/signUp">회원가입</a></li> -->
			<li><c:if test="${not empty memberLogin }">
          		${memberLogin.u_name }님 반갑습니다
          		<a href="/logout">로그아웃</a>
          		<a href="/member/mypage">마이페이지</a>
          	</c:if>
          	<c:if test="${empty memberLogin }">
          		<a href="/login">로그인</a>
          		<a href="/member/signUpAgree">회원가입</a>
          	</c:if></li>
			<!-- <li><a href="/member/login">로그인</a></li> -->
			<!-- <li><a href="/login">마이페이지</a></li> -->
		</ul>
	</div>
</div>
<header class="header_wrap">
	<div class="logo_wrap">
		<div class="logo">
			<a href="/"> 
				<img src="/resources/include/img/main.png" alt="OMB_LOGO">
			</a>
		</div>
	</div>
	<div class="menu_wrap">
		<div class="menu_content">
			<div class="omb_main">
				<ul>
					<li id="ml1">
						<a href="/notice/noticeList">공지사항</a>
						<!-- 하위 메뉴 -->
						<div id="sl1" class="sub_list">
			                <ul class="nav">
			                <li><a href="/notice/noticeList">공지사항</a></li>
			                <li><a href="/notice/eventList">이벤트</a></li>
			                </ul>
			            </div>
					</li>
					<li><a href="/product/productList">중고마켓</a></li>
					<li><a href="/product/shareList">나눔마켓</a></li>
					<li id="ml2">
						<a href="/safe/productList">안심거래</a>
						<!-- 하위 메뉴 -->
						<div id="sl2" class="sub_list">
			                <ul class="nav">
			                <li><a href="/safe/productList">상품보기</a></li>
			                <li><a href="/safe/productInsertView">상품등록</a></li>
			                <li><a href="/order/buyList">구매목록</a></li>
			                <li><a href="/safe/productSell">판매등록목록</a></li>
			                <li><a href="/order/sellList">판매주문관리</a></li>
			                </ul>
			            </div>
					</li>
					<li id="ml3">
						<a href="/community/communityList?c_category=C">커뮤니티</a>
						<div id="sl3" class="sub_list">
			                <ul class="nav">
			                <li><a href="/community/communityList?c_category=A">유아용품후기</a></li>
			                <li><a href="/community/communityList?c_category=B">이유식레시피</a></li>
			                <li><a href="/community/communityList?c_category=C">자유게시판</a></li>
			                </ul>
			            </div>
					</li>
					
					
					<li id="ml4">
						<a href="/faq/faqList">고객센터</a>
						<!-- 하위 메뉴 -->
						<div id="sl4" class="sub_list">
			                <ul class="nav">
				                <li><a href="/faq/faqList">FAQ</a></li>
				                <li><a href="/serviceCenter/serviceList">문의하기</a></li>
			                </ul>
			            </div>
					</li>
				</ul>
				<div class="menu_search">
					<form action="#">
						<input type="text" id="omb_search_box" name="omb_search_box" placeholder="검색어를 입력하세요.">
						<button type="button" id="omb_searchBtn">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</header>