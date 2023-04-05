<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/resources/include/js/insert.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/include/css/insert.css">

	
</head>
	<body>
		<form id="insertConfirm">
			<h2>새로운 게시물 등록하기</h2>
			<table >
				<tr>
					<td class="alls"> 
						<div><input type="hidden" name="u_no" placeholder="유저번호" value="${member.u_no}" /></div>
						
						
						<div class="imgg">
							<div class="titl one">상품이미지</div>
							<div>
								<input id="file" type="file" name="file"class="ma"  placeholder="상품이미지 입력해주세요" />
							</div>
						</div>
						
						
						
						
						
						<div class="tit">
							<div class="titl two">게시글제목</div>
							<div><input id="title" class="ma" type="text" name="p_title"  placeholder="상품제목을 입력해주세요" /></div>
						</div>
					
					
					
					
						<div class="pname">
							<div class="titl">상품이름</div>
							<div><input id="name" class="ma"type="text" name="p_name"  placeholder="상품이름 입력해주세요"/></div>
						</div>
						
						
						
						
						
						<div class="pprice">
							<div class="titl">상품가격</div>
							<div>
								<input type="number" id="price-input" class="ma" name="p_price" placeholder="상품 가격을 입력하세요"/>
								<input type="checkbox" id="free" name="p_free" value="1"><div class="free-t">무료나눔</div>
							</div>
						</div>
					
						
					
					
						
		
						
					
					
				
					
						<div class="md">
							<div class="titl">거래방법</div>
							<div>
								<select class="mds" name="trans_method" class="ma">
								  <option value=""  selected>거래방법을 선택하세요</option>
								  <option value="직거래+택배거래" >직거래+택배거래</option>
								  <option value="직거래" >직거래</option>
								  <option value="택배거래">택배거래</option>
								</select>
							</div>
						</div>
						
						
						
						
						<div class="ct">
							<div class="titl">카테고리</div>
							<select name="p_cate" id="p_cate" class="ma">
								<option value="유아의류">유아의류</option>
								<option value="유모차">유모차</option>
								<option value="카시트">카시트</option>
								<option value="장난감">장난감</option>
								<option value="도서,교육">도서,교육</option>
								<option value="아기신발">아기신발</option>
								<option value="승용완구">승용완구</option>
								<option value="아기침대">아기침대</option>
								<option value="기타">기타</option>
							</select>
						</div>
						
						
					
					
						
						<div>
							<input type=hidden name="p_adm_per" id="p_adm_per" value="1"/>
						</div>
						
						
						
						
						
						<div class="sts">
							<div class="titl">
								<input type=hidden class="ma" name="p_status" id="p_status" value="판매중" />
							</div>
						</div>
						
						
												<div class="locc">
							<div class="titl">지역선택</div>
							<div>
								<!-- 지역별로 검색 -->
								<div id="local">
									<select id="sido_code" class="ma">
										<option>선택</option>
									</select>
									<select id="sigoon_code" class="ma">
										<option>선택</option>
									</select>		
									<select id="dong_code" class="ma">
										<option>선택</option>
									</select>
								</div>
								
								<input  type="hidden" id="p_local1"  readonly/><br>
								<input  type="hidden" id="p_local2"  readonly/><br>
								<input  type="hidden" id="p_local3"  readonly/><br>
								<input  type="hidden" id="p_local" name="p_local" readonly/>
							</div>
						</div>
							
							
							
							
						<div class="contt ma">
							<div class="titl">상품상세설명</div>
							<div><input id="content" type="text" name="p_content"  placeholder="상품상세설명 입력해주세요"/></div>
						</div>
					
					
					
						<div><input type="button" id="confirm" value="등록하기"/></div>
					</td>
				</tr>
				
			</table>
		</form>
	</body>
</html>