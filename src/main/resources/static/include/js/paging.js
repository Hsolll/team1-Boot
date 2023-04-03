
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
	let	p_cate = $(".cate").val()
	
	let pageNum = $(this).find("a").text();
	
	console.log(p_cate);
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
	let p_local1 =  $("#p_local").val()
	let p_local2 =  $("#p_local2").val()
	let p_local3 =  $("#p_local3").val()
	let p_local = p_local1+" "+p_local2+" "+p_local3
	let pageNum = $(this).find("a").text();
	
	 console.log("p_local :"+p_local)
	 console.log("pageNum :"+pageNum)
	
	$.ajax({
		type : "GET",
		url  : "/product/p_local",
		data : {p_local:p_local,pageNum:pageNum},
		success : function(data){
			
			let p_local1 = $(data)
		
			$("#category").html(p_local1)
		},
		error : function(jqXHR, textStatus, errorThrown) {
        }
	})
	

});
//-----------------------------// 내가 쓴 글 //-----------------------------------------------//

	$(".paginate_button4").click(function(){
	let u_no = $(".un").val();
	let pageNum = $(this).find("a").text();
	
	 console.log(u_no);
	 console.log("pageNum :"+pageNum)
	
	$.ajax({
		type : "GET",
		url  : "/product/myWrite",
		data : {u_no:u_no,pageNum:pageNum},
		success : function(data){
			
			let u_no1 = $(data)
		
			$("#category").html(u_no1)
		},
		error : function(jqXHR, textStatus, errorThrown) {
        }
	})
	

});


