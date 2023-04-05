$.support.cors = true;
	
	$(function(){
		$("#confirm").click(function(){
			let p_local1 = $("#p_local1").val()
			let p_local2 = $("#p_local2").val()
			let p_local3 = $("#p_local3").val()
			let p_local = p_local1+" "+p_local2+" "+p_local3
			$("#p_local").val(p_local)
			
			
	/*	if($("#title").val() && $("#name").val() && $("#price-input").val() 
		   && $("#content").val() && $("#file").val() && $("#p_local").val()){
		  	console.log("모두입력완료")
		} else {
		  alert("항목을 모두 입력해주세요");
		  return false;
		}*/
		
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
		}else if(!checkForm("#p_local", "지역")){
			alert("지역을 입력해주세요")
			
		}else{
			$("#insertConfirm").attr({
				"method"  : "POST",
				"enctype" : "multipart/form-data",
				"action"  : "/product/insertProduct"
			})
			$("#insertConfirm").submit();
			alert("관리자 승인 후 등록이 완료됩니다!")
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
		