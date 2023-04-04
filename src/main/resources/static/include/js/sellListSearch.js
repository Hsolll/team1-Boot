let keyword = "", search = "", start_date = "", end_date = "";
$(function(){
	if(search!="o_date"){
		$("#dateCheck").hide();
		var date = getDateFormat(new Date())
		$('#start_date').val(date);
		$('#end_date').val(date);
	}else{
		$("#search").val(search);
		$("#textCheck").hide();
		$('#start_date').val(start_date);
		$('#end_date').val(end_date);
	}
	
	if(keyword!=""){
		$("#search").val(search);
		$("#keyword").val(keyword);
	}

	/* 검색 버튼 클릭 시 처리 이벤트 */
	$("#searchBtn").click(function(){
		if($("#search").val()!="o_date"){
			if(!chkSubmit($('#keyword'),"검색어를")) return;
		}else if($("#search").val()=="o_date"){
			if(!chkSubmit($('#start_date'),"시작날짜를")) return;
			else if(!chkSubmit($('#end_date'),"종료날짜를")) return;
			else if($('#start_date').val()>$('#end_date').val()){
				alert("시작날짜가 종료날짜보다 더 클 수 없습니다.");
				return;
			}
		}
		$("#pageNum").val(1);
		goPage();
	});
	
	$("#allSearchBtn").click(function(){
		$("#search > option:selected").val("");
		$("#keyword").val("");
		$("#start_date").val("");
		$("#end_date").val("");
		//goPage();
		location.href="/order/sellList";
	});
	
	/* 검색 대상이 변경될 때마다 처리 이벤트 */
	$("#search").change(function() {
		if($("#search").val()!="o_date"){
			$("#dateCheck").hide();						
			$("#textCheck").show();	
		}if($("#search").val()=="o_date"){
			$("#textCheck").hide();
			$("#dateCheck").show();
		}
	});
	
	$(".paginate_button a").click(function(e) {
		e.preventDefault();
		$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
		goPage();
	});
	
});

function goPage(){
	$("#f_search").attr({
		"method":"get",
		"action":"/order/sellList"
	});
	$("#f_search").submit();
}