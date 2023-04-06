<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/include/css/insert.css">
<script type="text/javascript">

	$.support.cors = true;
	
	
	
	
	$(function(){
		$("#pconfirm").click(function(){
			let p_local1 = $("#p_local1").val()
			let p_local2 = $("#p_local2").val()
			let p_local3 = $("#p_local3").val()
			let p_local = p_local1+" "+p_local2+" "+p_local3
			$("#p_local").val(p_local)
			
			if(!checkForm("#p_title", "제목")){
				alert("제목을 입력해주세요")
			}else if(!checkForm("#p_name", "상품이름")){
				alert("상품이름을 입력해주세요")
			}else if(!checkForm("#p_price", "가격")){
				alert("가격을 입력해주세요")
			}else if(!checkForm("#p_content", "상세정보")){
				alert("상세정보를 입력해주세요")
			}else if(!checkForm("#file", "파일")){
				alert("파일을 입력해주세요")
			}else if(!checkForm("#p_local", "지역")){
				alert("지역을 입력해주세요")
			}else{
			
				$("#insertConfirm").attr({
					"method"  : "POST",
					"enctype" : "multipart/form-data",
					"action"  : "/product/updateCon"
				})
				$("#insertConfirm").submit();
			}	
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
		//----------------------------------목록으로---------------------------------//
		$("#productListBtn").click(function(){
			location.href="/product/productList";
		});
		
		//-----------------------------//무료나눔 //--------------------------------------------//
		
		$(document).ready(function() {
		  $("#free").change(function() {
		    if($(this).is(":checked")) {
	      		$("#price-input").val(0).prop("readonly","true");
		    }else{
		    	$("#price-input").val("").prop("placeholer","상품 가격을 입력하세요").removeAttr("readonly");
		      }
		  });
		});
	})
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
</script>
</head>
	<body>
		<form id="insertConfirm">
			<input type="hidden" name="u_no" placeholder="유저번호" value="${member.u_no}"/>
			<input type="hidden" name="p_no" placeholder="상품번호" value="${update.p_no}"/>
			<input  type="hidden" id="p_local1"  readonly/><br>
			<input  type="hidden" id="p_local2"  readonly/><br>
			<input  type="hidden" id="p_local3"  readonly/><br>
			<input  type="hidden" id="p_local" name="p_local" value="${update.p_local}" readonly />
			<input type=hidden name="p_adm_per" id="p_adm_per" value="1"/>
		</form>
		
			<h2 class="text-left">게시물 수정</h2>
			<table class="insertTbl">
				<colgroup>
					<col style="width: 10%;">
					<col>
					<col style="width: 12%;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">게시글 제목</th>
						<td>
							<input type="text" class="form-control w300 ht34" id="p_title" name="p_title" value="${update.p_title }" placeholder="상품제목을 입력해주세요">
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
							<input type="text" class="form-control w300 ht34" id="p_name" name="p_name" value="${update.p_name }" placeholder="상품이름을 입력해주세요">
						</td>
						<th scope="row">상품가격</th>
						<td>
							<input type="text" class="form-control w300 i-block ht34" id="p_price" name="p_price" value="${update.p_price }" placeholder="상품가격을 입력해주세요">
							<input type="checkbox" id="free" name="p_free" value="1">
							<label class="media-middle" style="margin-bottom: 0px;" for="free">무료나눔</label>
						</td>
					</tr>
					<tr>
						<th scope="row">거래방법</th>
						<td>
							<select class="form-control w300 i-block" name="trans_method">
								<option value=""  selected>거래방법을 선택하세요</option>
								<option value="직거래+택배거래" >직거래+택배거래</option>
								<option value="직거래" >직거래</option>
								<option value="택배거래">택배거래</option>
							</select>
						</td>
						<th scope="row">상품이미지</th>
						<td>
							<input id="file" type="file" name="file" value="${update.file }" placeholder="상품이미지 입력해주세요" />
						</td>
					</tr>
					<tr>
						<th scope="row">지역선택</th>
						<td>
							<select class="form-control w130 i-block" id="sido_code">
								<option>선택</option>
							</select>
							<select class="form-control w130 i-block" id="sigoon_code">
								<option>선택</option>
							</select>
							<select class="form-control w130 i-block" id="dong_code">
								<option>선택</option>
							</select>
						</td>
						<th scope="row">거래상태 변경</th>
						<td>
							<select class="form-control w300 i-block" id="p_status" name="p_status">
								<option value="판매중">판매중</option>
								<option value="거래완료">거래완료</option>
							</select>
						</td>
					</tr>
					<tr>
						<th scope="row">상품상세설명</th>
						<td colspan="3">
							<input class="form-control" name="p_content"  id="p_content" value="${update.p_content}" style="height: 400px; resize: none;">
						</td>
					</tr>
				</tbody>
			</table>
			
			<div class="btnArea text-right">
				<button type="button" class="btn btn-dark" id="pconfirm">수정</button>
				<button type="button" class="btn btn-dark" id="productListBtn">목록으로</button>
			</div>
	</body>
</html>