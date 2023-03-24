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
          		${memberLogin.u_name }님 반갑습니다.
          		<a href="/logout" class="btn btn-primary btn-sm active" role="button">로그아웃</a>
          		<a href="/member/mypage">마이페이지</a>
          	</c:if>
          	<c:if test="${empty memberLogin }">
          		<!-- <script type="text/javascript">
          			location.href="/member/login";
          		</script> -->
          		<a href="/member/signUp">회원가입</a>
          		<a href="/login" class="btn btn-primary btn-sm active" role="button">로그인</a>
          		<li><a href="/login">마이페이지</a></li>
          	</c:if></li>
			<!-- <li><a href="/member/login">로그인</a></li> -->
			<!-- <li><a href="/login">마이페이지</a></li> -->
		</ul>
	</div>
</div>
<header class="header_wrap">
	<div class="logo_wrap">
		<div class="logo">
			<a href="#"> 
				<img src="/resources/include/img/logo.png" alt="OMB_LOGO">
			</a>
		</div>
	</div>
	<div class="menu_wrap">
		<div class="menu_content">
			<div class="omb_main">
				<ul>
					<li><a href="#">공지사항</a></li>
					<li><a href="#">중고마켓</a></li>
					<li><a href="#">나눔마켓</a></li>
					<li><a href="/safe/productList">안심거래</a></li>
					<li><a href="#">커뮤니티</a></li>
					<li><a href="#">고객센터</a></li>
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
			<div class="omb_sub">
				<!-- 하위메뉴 생성 예정 -->
			</div>
		</div>
	</div>
</header>