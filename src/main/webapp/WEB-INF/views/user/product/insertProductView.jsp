<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/resources/include/js/insert.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/include/css/insert.css">

	
</head>
	<body>
		<form id="insertConfirm">
			<input type="hidden" name="u_no" placeholder="유저번호" value="${member.u_no}" />
			<input  type="hidden" id="p_local1"  readonly/><br>
			<input  type="hidden" id="p_local2"  readonly/><br>
			<input  type="hidden" id="p_local3"  readonly/><br>
			<input  type="hidden" id="p_local" name="p_local" readonly/>
			
			<h2 class="text-left">내 물건 팔기</h2>
			
			<table class="insertTbl">
				<colgroup>
					<col style="width: 10%;">
					<col>
					<col style="width: 10%;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<td>
							<input type="hidden"  id="p_status" name="p_status" placeholder="상품 상태">
						</td>
						<th scope="row">게시글 제목</th>
						
						<td>
							<input type="text"  id="p_title" class="form-control w300 ht34" name="p_title" placeholder="상품제목을 입력해주세요">
						</td>
						<th scope="row">카테고리</th>
						<td>
							<select class="form-control w300 i-block" name="p_cate" id="pp_cate">
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
						</td>
					</tr>
					<tr>
						<th scope="row">상품이름</th>
						<td>
							<input type="text" id="p_name" name="p_name" class="form-control w300 ht34" placeholder="상품이름을 입력해주세요">
						</td>
						<th scope="row">상품가격</th>
						<td>
							<input type="number" class="form-control w300 i-block ht34" id="pprice-input" name="p_price" placeholder="상품가격을 입력해주세요"  >
							<input type="checkbox" id="free" name="p_free" value="1">
							<label class="media-middle" style="margin-bottom: 0px;" for="free">무료나눔</label>
						</td>
					</tr>
					<tr>
						<th scope="row">거래방법</th>
						<td>
							<select class="form-control w300 i-block" name="trans_method">
								<option value="직거래+택배거래" selected>직거래+택배거래</option>
								<option value="직거래" >직거래</option>
								<option value="택배거래">택배거래</option>
							</select>
						</td>
						<th scope="row">상품이미지</th>
						<td>
							<input id="file" type="file" name="file"  placeholder="상품이미지 입력해주세요" />
						</td>
					</tr>
					<tr>
						<th scope="row">지역선택</th>
						<td colspan="3" id="local">
							<select class="form-control w150 i-block" id="sido_code">
								<option>선택</option>
							</select>
							<select class="form-control w150 i-block" id="sigoon_code">
								<option>선택</option>
							</select>
							<select class="form-control w150 i-block" id="dong_code">
								<option>선택</option>
							</select>
						</td>
					</tr>
					<tr>
						<th scope="row">상품상세설명</th>
						<td colspan="3">
							<textarea class="form-control" id="pcontent" name="p_content" style="height: 400px; resize: none;"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
			
			<div class="btnArea text-right">
				<button type="button" class="btn btn-dark" id="pconfirm">등록</button>
				<button type="button" class="btn btn-dark" id="productListBtn">목록으로</button>
			</div>
		</form>
	</body>
</html>