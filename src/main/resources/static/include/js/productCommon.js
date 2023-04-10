	
	$.support.cors = true;
	
	$(function(){
	//-----------------------------// 카테고리 //-----------------------------------------------//
		
	
		$(".p_cate").click(function(){
			let p_cate = $(this).val();
			$(".cate").val(p_cate)
			console.log(p_cate)
			
			$.ajax({
				type : "GET",
				url  : "/product/p_cate",
				data : {p_cate:p_cate},
				success : function(data){
					
					let cate = $(data)
					
				
					$("#category").html(cate)
				},
				error : function(jqXHR, textStatus, errorThrown) {
		        }
			})
		})
	
	//-----------------------------// 카테고리_전체 //-----------------------------------------------//
	
	$(".p_cate_all").click(function(){
		
		$.ajax({
				type : "GET",
				url  : "/product/productAllList",
				success : function(data){
					let all =$(data)
				
				
					console.log(all)
					$("#category").html(all)
				},
				error : function(jqXHR, textStatus, errorThrown) {
		        }
			})
	})
	//-----------------------------// 댓글작성 //-----------------------------------------------//
		
	$("#replyConfirm").click(function(){
		$("#replyForm").attr({
			
			"method" : "GET",
 			"action" : "/productReply/productReplyInsert",
		})
		$("#replyForm").submit();
	})
	
	//-----------------------------// 댓글삭제 //-----------------------------------------------//
	
	$(".delete").click(function(){
		let delete1 =  $(this).parents(".replyDelete");
		
		
		delete1.attr({
			
			"method" : "GET",
 			"action" : "/productReply/delete",
		})
		delete1.submit();
		
	})
	
	
	
	
	//-----------------------------// 상세페이지 이동 //--------------------------------------------//
	$(".p_no").click(function(){
		var p_no = $(this).text()
		location.href = "/product/productDetail?p_no="+p_no
	})
	
	//-----------------------------// 새로운 게시물 등록 //--------------------------------------------//
		$("#insert").click(function(){
			location.href ="/product/insertProductView"
		})
	////////////////////////////////////지역설정-전달////////////////////////////////////////////////////////
		
	$("#pConfirm").click(function(){
		
		let p_local1 =  $("#p_local").val()
		let p_local2 =  $("#p_local2").val()
		let p_local3 =  $("#p_local3").val()
		let p_local = p_local1+" "+p_local2+" "+p_local3
		$("#p_localC").val(p_local)
		
		console.log(p_local)
		$.ajax({
				type : "GET",
				url  : "/product/p_local",
				data : {p_local:p_local},
				success : function(data){
					
					console.log(data)
					var all = data
					$("#category").html(all)
					
				},
				error : function(jqXHR, textStatus, errorThrown) {
		        }
		})
	});
		
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
		});
		////////////////////////////////////2. 시군////////////////////////////////////////////////////////
		
		$("#sido_code").change(function(){
			
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
					var select = $("#sido_code").find(":selected").text()
					$("#p_local").val(select)
					
				},
					error: function(xhr, stat, err) {}
			})
		})
		////////////////////////////////////3. 동////////////////////////////////////////////////////////
		
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
	
});//페이지 닫는 태그
	