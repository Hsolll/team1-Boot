<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<div class="menu-list">
	<nav class="navbar navbar-expand-lg navbar-light">
		<a class="d-xl-none d-lg-none" href="#">메뉴</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav flex-column">
				<li class="nav-divider">관리자 메뉴</li>
				<li class="nav-item "><a class="nav-link active" href="#"
					data-toggle="collapse" aria-expanded="false"
					data-target="#submenu-1" aria-controls="submenu-1"> <i
						class="fa fa-fw fa-user-circle"></i> 회원관리 <span
						class="badge badge-success">6</span>
				</a>
					<div id="submenu-1" class="collapse submenu" style="">
						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link" href="#"
								aria-expanded="false" data-target="#submenu-1-2"
								aria-controls="submenu-1-2">일반회원</a></li>
							<li class="nav-item"><a class="nav-link"
								href="dashboard-finance.html">탈퇴회원</a></li>
						</ul>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="collapse" aria-expanded="false"
					data-target="#submenu-2" aria-controls="submenu-2"><i
						class="fas fa-fw fa-file"></i>공지관리</a>
					<div id="submenu-2" class="collapse submenu" style="">
						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link"
								href="pages/cards.html">공지사항</a></li>
							<li class="nav-item"><a class="nav-link"
								href="pages/general.html">이벤트 공지</a></li>
						</ul>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="collapse" aria-expanded="false"
					data-target="#submenu-3" aria-controls="submenu-3"><i
						class="fas fa-fw fa-inbox"></i>고객센터관리</a>
					<div id="submenu-3" class="collapse submenu" style="">
						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link"
								href="/admin/faqList">FAQ</a></li>
							<li class="nav-item"><a class="nav-link"
								href="pages/chart-chartist.html">신고내역</a></li>
						</ul>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="collapse" aria-expanded="false"
					data-target="#submenu-4" aria-controls="submenu-4"><i
						class="fab fa-fw fa-wpforms"></i>커뮤니티관리</a>
					<div id="submenu-4" class="collapse submenu" style="">
						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link"
								href="pages/form-elements.html">용품후기</a></li>
							<li class="nav-item"><a class="nav-link"
								href="pages/form-validation.html">레시피후기</a></li>
							<li class="nav-item"><a class="nav-link"
								href="pages/multiselect.html">자유게시판</a></li>
						</ul>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="collapse" aria-expanded="false"
					data-target="#submenu-5" aria-controls="submenu-5"><i
						class="fas fa-fw fa-table"></i>상품관리</a>
					<div id="submenu-5" class="collapse submenu" style="">
						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link"
								href="pages/general-table.html">승인관리</a></li>
							<li class="nav-item"><a class="nav-link"
								href="pages/data-tables.html">중고상품</a></li>
							<li class="nav-item"><a class="nav-link"
								href="pages/data-tables.html">결제관리</a></li>
						</ul>
					</div></li>
				<!-- <li class="nav-divider">
                                Features
                            </li> 카테고리 나눔 텍스트 -->
				<li class="nav-item"><a class="nav-link" href="#"
					aria-expanded="false" data-target="#submenu-6"
					aria-controls="submenu-6"><i class="fa fa-fw fa-rocket"></i>나눔관리</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="collapse" aria-expanded="false"
					data-target="#submenu-7" aria-controls="submenu-7"><i
						class="fas fa-fw fa-chart-pie"></i>통계관리 <span
						class="badge badge-secondary">New</span></a>
					<div id="submenu-7" class="collapse submenu" style="">
						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link"
								href="pages/inbox.html">상품별</a></li>
							<li class="nav-item"><a class="nav-link"
								href="pages/email-details.html">카테고리별</a></li>
							<li class="nav-item"><a class="nav-link"
								href="pages/email-compose.html">지역별</a></li>
						</ul>
					</div></li>
			</ul>
		</div>
	</nav>
</div>