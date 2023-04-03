<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/resources/include/js/productCommon.js"></script>
<script type="text/javascript" src="/resources/include/js/search.js"></script>
<script type="text/javascript" src="/resources/include/js/myWrite.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/include/css/product.css">

<script type="text/javascript" >
	$(document).ready(function(){
		
		$(".p_cate_all").click()
		console.log("로딩완료")
	})
</script>
	</head>
	<body>
	<div id="allCon" class="flexBox">
		<!-- 카테고리선택 -->
		<div id="selCategory">
			<!-- 카테고리선택(전체) -->
			<input class="p_cate_all" type="button" value="전체"/>
			<!-- 세부분류 -->
			<input class="p_cate" type="button" value="유아의류"/>
			<input class="p_cate" type="button" value="유모차"/>
			<input class="p_cate" type="button" value="카시트"/>
			<input class="p_cate" type="button" value="장난감"/>
			<input class="p_cate" type="button" value="도서,교육"/>
			<input class="p_cate" type="button" value="아기신발"/>
			<input class="p_cate" type="button" value="승용완구"/>
			<input class="p_cate" type="button" value="아기침대"/>
			<input class="p_cate" type="button" value="기타"/>
			<input class="cate" type="hidden" value=""/>
		</div>
		
		<div id="cont">
			<div id="menu">
				<!-- 검색  -->
				<div id="productSearch">
					<form id="f_search" name="f_search" class="form-inline text-right" >
						<div class="form-group">
		<!-- 						<label>검색조건</label> -->
							<select id="search" name="search"  class="form-control">
								<option value="all">전체</option>
								<option value="p_title">제목</option>
								<option value="p_content">내용</option>
		<!-- 							<option value="b_name">작성자</option> -->
							</select>
							<input type="text" name="keyword" id="keyword" value="" class="form-control ht34" placeholder="검색어를 입력하세요"/>
							<button type="button" id="searchData" class="btn">검색</button>
						</div>
					</form>
				</div>
				
				<!-- 지역별로 검색 -->
				<div id="local">
					<div>
						<select id="sido_code" class="form-control">
							<option>선택</option>
						</select>
						<select id="sigoon_code" class="form-control">
							<option>선택</option>
						</select>
						<select id="dong_code" class="form-control">
							<option>선택</option>
						</select>
					</div>
					<div>
						<!-- <div><span>지역</span></div> -->
						<form id="pForm">
							<input  type="hidden" id="p_local" name="p_local" readonly/><br>
							<input  type="hidden" id="p_local2" name="p_local" readonly/><br>
							<input  type="hidden" id="p_local3" name="p_local" readonly/><br>
						</form>
						<input type="button" id="pConfirm" class="btn" value="지역 선택완료"/>
						<input type="hidden" id="p_localC" value=""/>
					</div>
				</div>
				<!-- 내가 쓴 글 보기 -->
				<div id="myWrite">
					<input type="hidden" id="MyNo" value="${member.u_no}"/>
					<input type="button" id="write" class="btn ml10" value="내가 쓴 글 보기"/>
				</div>
				
				<!-- 상품 등록하기 -->
				<div id="NewConfrim"> 
					<input type="button" id="insert" class="btn ml10" value="등록하기">
				</div>
			</div>
			
			<div>
			<!-- 카테고리로 검색 -->
			<div id="category"></div>
			</div>
			<ul class="prdList">
				<li>
					<a href="/">
						<div class="imgBox">
							<img src="">
						</div>
						<div class="txtArea">
							<ul>
								<li class="prdName">베베누보 양면 와이드 이탈방지 아기베개</li>
								<li class="subName">2023년 신상 낮잠이불 출시</li>
								<li class="prdPrice">27,900<em>원</em></li>
							</ul>
						</div>	
					</a>
				</li>
				<li>
					<a href="/">
						<div class="imgBox">
							<img src="">
						</div>
						<div class="txtArea">
							<ul>
								<li class="prdName">베베누보 양면 와이드 이탈방지 아기베개</li>
								<li class="subName">2023년 신상 낮잠이불 출시</li>
								<li class="prdPrice">27,900<em>원</em></li>
							</ul>
						</div>	
					</a>
				</li>
				<li>
					<a href="/">
						<div class="imgBox">
							<img src="">
						</div>
						<div class="txtArea">
							<ul>
								<li class="prdName">베베누보 양면 와이드 이탈방지 아기베개</li>
								<li class="subName">2023년 신상 낮잠이불 출시</li>
								<li class="prdPrice">27,900<em>원</em></li>
							</ul>
						</div>	
					</a>
				</li>
				<li>
					<a href="/">
						<div class="imgBox">
							<img src="">
						</div>
						<div class="txtArea">
							<ul>
								<li class="prdName">베베누보 양면 와이드 이탈방지 아기베개</li>
								<li class="subName">2023년 신상 낮잠이불 출시</li>
								<li class="prdPrice">27,900<em>원</em></li>
							</ul>
						</div>	
					</a>
				</li>
				<li>
					<a href="/">
						<div class="imgBox">
							<img src="">
						</div>
						<div class="txtArea">
							<ul>
								<li class="prdName">베베누보 양면 와이드 이탈방지 아기베개</li>
								<li class="subName">2023년 신상 낮잠이불 출시</li>
								<li class="prdPrice">27,900<em>원</em></li>
							</ul>
						</div>	
					</a>
				</li>
				<li>
					<a href="/">
						<div class="imgBox">
							<img src="">
						</div>
						<div class="txtArea">
							<ul>
								<li class="prdName">베베누보 양면 와이드 이탈방지 아기베개</li>
								<li class="subName">2023년 신상 낮잠이불 출시</li>
								<li class="prdPrice">27,900<em>원</em></li>
							</ul>
						</div>	
					</a>
				</li>
				<li>
					<a href="/">
						<div class="imgBox">
							<img src="">
						</div>
						<div class="txtArea">
							<ul>
								<li class="prdName">베베누보 양면 와이드 이탈방지 아기베개</li>
								<li class="subName">2023년 신상 낮잠이불 출시</li>
								<li class="prdPrice">27,900<em>원</em></li>
							</ul>
						</div>	
					</a>
				</li>
				<li>
					<a href="/">
						<div class="imgBox">
							<img src="">
						</div>
						<div class="txtArea">
							<ul>
								<li class="prdName">베베누보 양면 와이드 이탈방지 아기베개</li>
								<li class="subName">2023년 신상 낮잠이불 출시</li>
								<li class="prdPrice">27,900<em>원</em></li>
							</ul>
						</div>	
					</a>
				</li>
			</ul>
		</div>
	</div>
		
	
		
		
	</body>
	
</html>