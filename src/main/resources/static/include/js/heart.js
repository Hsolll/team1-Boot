//-----------------------------// 좋아요 여부 //--------------------------------------------//
	/*
	$(".no").each(function(){
		let pno = $(this).find(".pno").val();
		let uno = $(this).find(".uno").val();
		
		console.log("pno : "+pno);
		console.log("uno : "+uno);
			$.ajax({
			
			type:"GET",
			url:"/product/heartSel",
			data:{p_no:pno,u_no:uno},
			success:function(data){
				let result = $(data)[33]
			console.log(result)
			
			
			$(".heartForm").html(result)
			}
		
		
			
		})
	
		
		
	})*/
	


$(".heart").each(function() {
	  if($(this).hasClass("0")) {
	    let empty = '<img id="empty" src="/resources/images/common/heart/empty.png"/>'
    	$(this).html(empty);
	  } else if ($(this).hasClass("1")) {
	    let full = '<img id="full" src="/resources/images/common/heart/full.png"/>'
	    $(this).html(full);
	  }
});

$(".heart_con").click(function(){
	 
	if($(this).find(".heart").hasClass("0")){
		let full = '<img id="full" src="/resources/images/common/heart/full.png"/>'
	    
		$(this).find(".heart").html(full);
	    $(this).find(".heartForm").find(".like").val(1);
	    console.log($(this).find(".heartForm").find(".u").val())
	    
	    $(this).find(".heart").removeClass().addClass("heart 1")
	    
	   
	    
	    let heartForm = $(this).find(".heartForm");
		  $.ajax({
		        type: "GET",
		        url: "/product/prod_like_in",
		        data: heartForm.serialize(),
		        dataType:"json",
		        success: function(data) {
					console.log(data)
		        },
		        error: function(jqXHR, textStatus, errorThrown) {
		        }
		  });
	}else if($(this).find(".heart").hasClass("1")){
		let empty = '<img id="empty" src="/resources/images/common/heart/empty.png"/>'
		    $(this).find(".heart").html(empty);
			$(this).find(".heartForm").find(".like").val(0);
			$(this).find(".heart").removeClass().addClass("heart 0")
			
			let heartForm = $(this).find(".heartForm");
			  $.ajax({
			        type: "GET",
			        url: "/product/prod_like_del",
			        data: heartForm.serialize(),
			        success: function(data) {
			        },
			        error: function(jqXHR, textStatus, errorThrown) {
			        }
			  });//ajax(0)닫는 태그
	};//if문 닫는 태그
});//클릭 함수 닫는 태그
