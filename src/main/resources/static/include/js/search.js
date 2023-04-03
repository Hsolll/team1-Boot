/* 검색을 위한 실질적인 처리 함수 */
function goPage(){
	let keyword = $("#keyword").val()
	let search = $("#search").val()
	
	console.log("keyword :"+keyword)
	console.log("search :"+search)
	
	$.ajax({
				type : "GET",
				url  : "/product/productAllList",
				data : {keyword : keyword ,search : search},
				success : function(data){
					let all = $(data)
				
					$("#category").html(all)
				},
				error : function(jqXHR, textStatus, errorThrown) {
		        }
			})
			
	
	/* 검색 후 검색 대상과 검색 단어 출력 */
	$("#keyword").val();
	$("#search").val();
	
};

$(function(){
	/* 검색 버튼 클릭 시 처리 이벤트 */
	$("#searchData").click(function(){
		if($("#search").val()!="all"){ // 제목/내용/작성자 선택시 검색어 유효성 체크
			if(!chkData("#keyword","검색어를")) return;
		}
		//$("#pageNum").val(1);
		goPage();
	});
	
	
	/* 검색 대상이 변경될 때마다 처리 이벤트 */
	$("#search").change(function() {
		if($("#search").val()=="all"){
			$("#keyword").attr("placeholder","전체상품을 검색합니다")
		}else if($("#search").val()!="all"){
			$("#keyword").val("");
			$("#keyword").focus();
		}
	});
	
	/* 입력 양식 enter 제거 */
	$("#keyword").bind("keydown", function(event){
		 if (event.keyCode == 13) {
		        event.preventDefault();
		    }
	});
	

	
	
	
})