/*내가 쓴 글 보기*///////////////////////
$(function(){
	$("#write").click(function(){
		let u_no = $("#MyNo").val();
		$.ajax({
			
			url:"/product/myWrite",
			data: {u_no:u_no},
			success: function(data){
				
				var my = data
				$("#category").html(my)
			},
			error : function(jqXHR, textStatus, errorThrown) {
	        }
		})		
		
	})
});


