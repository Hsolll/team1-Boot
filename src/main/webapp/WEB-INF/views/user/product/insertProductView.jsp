<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$.support.cors = true;
	
	
	
	
	$(function(){
		$("#confirm").click(function(){
			let p_local1 = $("#p_local1").val()
			let p_local2 = $("#p_local2").val()
			let p_local3 = $("#p_local3").val()
			let p_local = p_local1+" "+p_local2+" "+p_local3
			$("#p_local").val(p_local)
			
			$("#insertConfirm").attr({
				"method"  : "POST",
				"enctype" : "multipart/form-data",
				"action"  : "/product/insertProduct"
			})
			$("#insertConfirm").submit();
			
		})
			//-----------------------------// 지역 설정 //--------------------------------------------//	
	
	
	////////////////////////////////////1. 시도////////////////////////////////////////////////////////
/*		$('#sido_code').empty();
*/		$.ajax({
				type: "get",
				url: "https://api.vworld.kr/req/data?key=CEB52025-E065-364C-9DBA-44880E3B02B8&domain=http://localhost:8080&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADSIDO_INFO",
				async: false,
				dataType: 'jsonp',
				success: function(data) {
	
					data.response.result.featureCollection.features.forEach(function(f){
						let locCode = f.properties.ctprvn_cd;
						let locName = f.properties.ctp_kor_nm;
						
						
						let option = "<option value="+locCode+">"+locName+"</option>";
						$("#sido_code").html();
						
						$("#sido_code").append(option);
						
					})
					
				},
				error: function(xhr, stat, err) {}
			})
		
		$("#sido_code").html('<option>선택</option>');
		$("#sigoon_code").html('<option>선택</option>');
		$("#dong_code").html('<option>선택</option>');
		$("#p_local").val("");
		$("#p_local2").val("");
		$("#p_local3").val("");
		
		$("#sido_code").click(function(){
		/*	$("#sido_code").html("");
			$("#sido_code").html('<option>선택</option>');
			$("#sigoon_code").html('<option>선택</option>');
			$("#dong_code").html('<option>선택</option>');
			$("#p_local").val("");*/
		});
		
		
		$("#sido_code").change(function(){
			
			/*$("#sido_code").html('<option>선택</option>');*/
			$("#sigoon_code").html('<option>선택</option>');
			$("#dong_code").html('<option>선택</option>');
			$("#p_local").val("");
			
			let thisVal = $(this).val();
			$.ajax({
				type: "get",
				url: "https://api.vworld.kr/req/data?key=CEB52025-E065-364C-9DBA-44880E3B02B8&domain=http://localhost:8080&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADSIGG_INFO",
				data : {attrfilter : 'sig_cd:like:'+thisVal},
				async: false,
				dataType: 'jsonp',
				success: function(data) {
					
					data.response.result.featureCollection.features.forEach(function(f){
					let locCode = f.properties.sig_cd;
					let locName = f.properties.sig_kor_nm;
					
					
					
					
					let option = "<option value="+locCode+">"+locName+"</option>";
					
					$("#sigoon_code").append(option);
					})
					/*$("#p_local").val("")*/
					var select = $("#sido_code").find(":selected").text()
					$("#p_local1").val(select)
					
				},
					error: function(xhr, stat, err) {}
			})
		})
		
		$("#sigoon_code").change(function(){ 
		
			let thisVal = $(this).val();	
			
			$("#dong_code").html('<option>선택</option>');
		
			$.ajax({
				type: "get",
				url: "https://api.vworld.kr/req/data?key=CEB52025-E065-364C-9DBA-44880E3B02B8&domain=http://localhost:8080&service=data&version=2.0&request=getfeature&format=json&size=1000&page=1&geometry=false&attribute=true&crs=EPSG:3857&geomfilter=BOX(13663271.680031825,3894007.9689600193,14817776.555251127,4688953.0631258525)&data=LT_C_ADEMD_INFO",
				data : {attrfilter : 'emd_cd:like:'+thisVal},
				async: false,
				dataType: 'jsonp',
				success: function(data) {
					
		
					data.response.result.featureCollection.features.forEach(function(f){
						let locCode = f.properties.emd_cd;
						let locName = f.properties.emd_kor_nm;
						
						let option = "<option value="+locCode+">"+locName+"</option>";
						
		            	$('#dong_code').append(option);
					})
					let select2 = $("#sigoon_code").find(":selected").text()
					$("#p_local2").val(select2)
				},
				error: function(xhr, stat, err) {}
			});
		$("#dong_code").change(function(){
			
			let select3 = $("#dong_code").find(":selected").text()
			$("#p_local3").val(select3)
		})
	
	});
		
		//-----------------------------//무료나눔 //--------------------------------------------//
		
		$(document).ready(function() {
		  $("#free").change(function() {
		    if($(this).is(":checked")) {
		      $("#price-input").val(0).prop("readonly","true");
		      }
		  });
		});
	})
		

	
</script>
</head>
	<body>
		<h1><a href="/">OH MY BABY</a></h1>
	<!-- 		중고마켓 페이지로 돌아가기 -->
		<h2><a href="/product/productList">중고마켓페이지</a></h2>
		<p>${member.u_name}님 안녕하세요</p>
		<form id="insertConfirm">
			<table>
	<!-- 			<tr> -->
	<!-- 				<th>상품번호</th> -->
	<!-- 				<td><input type="text" name="p_no" placeholder="상품번호를 입력해주세요"/></td> -->
	<!-- 			</tr> -->
				<tr>
	<!-- 				<th>유저번호</th> -->
					<td><input type="hidden" name="u_no" placeholder="유저번호" value="${member.u_no}"/></td>
				</tr>
				<tr>
					<th>게시글제목</th>
					<td><input type="text" name="p_title"placeholder="상품제목을 입력해주세요"/></td>
				</tr>
				<tr>
					<th>상품이름</th>
					<td><input type="text" name="p_name" placeholder="상품이름 입력해주세요"/></td>
				</tr>
				<tr>
					<th>상품가격</th>
					<td>
						 무료나눔 <input type="checkbox" id="free" name="p_free" value="1">
						<input type="text" id="price-input" name="p_price" placeholder="상품 가격을 입력하세요"/>
						
					</td>
					
				</tr>
				<tr>
	<!-- 				<th>상품상태</th> -->
					<td>
	<!-- 					<select  name="p_status"> -->
	<!-- 					  <option value="판매중" selected>판매중</option> -->
	<!-- 					  <option value="거래완료">거래완료</option> -->
	<!-- 					</select> -->
						<input type=hidden name="p_status" id="p_status" value="판매중"/>
					</td>
				</tr>
				<tr>
					<th>상품상세설명</th>
					<td><input type="text" name="p_content" placeholder="상품상세설명 입력해주세요"/></td>
				</tr>
				<tr>
					<th>거래방법</th>
					<td>
						<select name="trans_method">
						  <option value="선택안함" selected>거래방법을 선택하세요</option>
						  <option value="직거래" >직거래</option>
						  <option value="택배거래">택배거래</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>상품이미지</th>
					<td>
						<input type="file" name="file" placeholder="상품이미지 입력해주세요"/>
					</td>
					
				</tr>
				<tr>
					<th>지역선택</th>
					<td>
						<!-- 지역별로 검색 -->
						<div id="local">
							<select id="sido_code">
								<option>선택</option>
							</select>
							<select id="sigoon_code">
								<option>선택</option>
							</select>
							<select id="dong_code">
								<option>선택</option>
							</select>
						</div>
						<label>시 :</label><input  type="text" id="p_local1"  readonly/><br>
						<label>구 :</label><input  type="text" id="p_local2"  readonly/><br>
						<label>동 :</label><input  type="text" id="p_local3"  readonly/><br>
						<input  type="hidden" id="p_local" name="p_local" readonly/>
					</td>
				</tr>
				
	<!-- 			<tr> -->
	<!-- 				<th>좋아요여부</th> -->
	<!-- 				<td><input type="text" name="prod_like" placeholder="좋아요여부 입력해주세요"/></td> -->
	<!-- 			</tr> -->
				<tr>
					<th>카테고리</th>
					<td>
						<select name="p_cate" id="p_cate">
	<!-- 						<option value="전체">전체</option> -->
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
	<!-- 				<th>관리자 승인여부</th> -->
					<td>
	<!-- 					<select name="p_adm_per" id="p_adm_per"> -->
	<!-- 						<option value="0" >비승인</option> -->
	<!-- 						<option value="1" selected>승인</option> -->
	<!-- 					</select> -->
						<input type=hidden name="p_adm_per" id="p_adm_per" value="1"/>
					</td>
				</tr>
				<tr>
					<td><input type="button" id="confirm" value="등록하기"/></td>
				</tr>
				
			</table>
		</form>
	</body>
</html>