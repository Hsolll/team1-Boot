
//-----------------------------// 페이징처리(전체페이지) //-----------------------------------------------//
$("a").click(function(e){
	e.preventDefault();
})

$(".paginate_button").click(function(){
	let pageNum = $(this).find("a").text();
	
	$.ajax({
		type : "GET",
		url  : "/product/productAllList",
		data : {pageNum:pageNum},
		success : function(data){
			
			let all = $(data)
		
			$("#category").html(all)
		},
		error : function(jqXHR, textStatus, errorThrown) {
        }
	})
});
//-----------------------------// 페이징처리(카테고리) //-----------------------------------------------//

$(".paginate_button2").click(function(){
	let p_cate = $("#cate1").text()
	
	let pageNum = $(this).find("a").text();
	
	$.ajax({
		type : "GET",
		url  : "/product/p_cate",
		data : {p_cate:p_cate,pageNum:pageNum},
		success : function(data){
			
			let cate = $(data)
		
			$("#category").html(cate)
		},
		error : function(jqXHR, textStatus, errorThrown) {
        }
	})
	

});
//-----------------------------// 페이징처리(지역) //-----------------------------------------------//
	$(".paginate_button3").click(function(){
	let p_local = $("#local1").text()
	let pageNum = $(this).find("a").text();
	
	$.ajax({
		type : "GET",
		url  : "/product/p_local",
		data : {p_local:p_local,pageNum:pageNum},
		success : function(data){
			
			let p_local = $(data)
		
			$("#category").html(p_local)
		},
		error : function(jqXHR, textStatus, errorThrown) {
        }
	})
	

});