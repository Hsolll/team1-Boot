<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/include/css/insert.css">
<script type="text/javascript">

	$.support.cors = true;
	
	
	
	
	$(function(){
		$("#confirm").click(function(){
			let p_local1 = $("#p_local1").val()
			let p_local2 = $("#p_local2").val()
			let p_local3 = $("#p_local3").val()
			let p_local = p_local1+" "+p_local2+" "+p_local3
			$("#p_local").val(p_local)
			
			if(!checkForm("#title", "제목")){
				alert("제목을 입력해주세요")
			}else if(!checkForm("#name", "상품이름")){
				alert("상품이름을 입력해주세요")
			}else if(!checkForm("#price-input", "가격")){
				alert("가격을 입력해주세요")
			}else if(!checkForm("#content", "상세정보")){
				alert("상세정보를 입력해주세요")
			}else if(!checkForm("#file", "파일")){
				alert("파일을 입력해주세요")
			}else if(!checkForm("#trans_method", "거래방법")){
				alert("거래방법 입력해주세요")
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
			<h2>게시물 수정하기</h2>
			<table >
				<tr>
					<td class="alls"> 
						<div><input type="hidden" name="u_no" placeholder="유저번호" value="${member.u_no}"/></div>
						<div><input type="hidden" name="p_no" placeholder="상품번호" value="${update.p_no}"/></div>
						
						
						<div class="imgg">
							<div class="titl one">상품이미지</div>
							<div>
								<input id="file" type="file" name="file"class="ma" value="${update.file }" placeholder="상품이미지 입력해주세요"/>
							</div>
						</div>
						
						
						
						
						
						<div class="tit">
							<div class="titl two">게시글제목</div>
							<div><input id="title" class="ma" type="text" name="p_title" value="${update.p_title }" placeholder="상품제목을 입력해주세요"/></div>
						</div>
					
					
					
					
						<div class="pname">
							<div class="titl">상품이름</div>
							<div><input id="name" class="ma"type="text" name="p_name" value="${update.p_name }" placeholder="상품이름 입력해주세요"/></div>
						</div>
						
						
						
						
						
						<div class="pprice">
							<div class="titl">상품가격</div>
							<div>
								<input type="number" id="price-input" class="ma" name="p_price" value="${update.p_price }" placeholder="상품 가격을 입력하세요"/>
								<input type="checkbox" id="free" name="p_free" value="1"><div class="free-t">무료나눔</div>
							</div>
						</div>
					
						
					
					
						
		
						
					
					
				
					
						<div class="md">
							<div class="titl">거래방법</div>
							<div>
								<select class="mds" id="trans_method" name="trans_method" class="ma" >
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
						
						
						
						
						
									<div class="st1" >
										<div class="titl">거래상태 변경</div>
										<select id="p_status" name="p_status">
											<option value="판매중" selected>판매중</option>
											<option value="거래완료">거래완료</option>
										</select>
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
								<input  type="hidden" id="p_local" name="p_local" value="${update.p_local}" readonly />
							</div>
						</div>
							
							
							
							
						<div class="contt ma">
							<div class="titl">상품상세설명</div>
							<div><input id="content" type="text" name="p_content" value="${update.p_content}"/></div>
						</div>
					
					
					
						<div><input type="button" id="confirm" value="수정하기"/></div>
					</td>
				</tr>
				
			</table>
		</form>
	</body>
</html>