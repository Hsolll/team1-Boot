$(function() {
	$.ajax({
		url: "/admin/main/queuedCnt",
		type: "get",
		dataType: "text",
		success: function(cnt) {
			$(".product").html(cnt);
		},
		error: function(xhr, textStatus, errorThrown) {
			alert(textStatus + " (HTTP-)" + xhr.status + " / " + errorThrown + ")");
		}
	});
	
	$.ajax({
		url: "/admin/main/depositCnt",
		type: "get",
		dataType: "text",
		success: function(cnt) {
			$(".deposit").html(cnt);
		},
		error: function(xhr, textStatus, errorThrown) {
			alert(textStatus + " (HTTP-)" + xhr.status + " / " + errorThrown + ")");
		}
	});
	$.ajax({
		url: "/admin/main/serviceCnt",
		type: "get",
		dataType: "text",
		success: function(cnt) {
			$(".service").html(cnt);
		},
		error: function(xhr, textStatus, errorThrown) {
			alert(textStatus + " (HTTP-)" + xhr.status + " / " + errorThrown + ")");
		}
	});
	
	$.ajax({
		url: "/admin/main/getOrders",
		type: "get",
		dataType: "json",
		contentType: "application/json; charset=UTF-8",
		success: function(data) {

		},
		error: function(xhr, textStatus, errorThrown) {
			alert(textStatus + " (HTTP-)" + xhr.status + " / " + errorThrown + ")");
		}
	});
	
	$.ajax({
		url: "/admin/main/getUsers",
		type: "get",
		dataType: "json",
		contentType: "application/json; charset=UTF-8",
		success: function(data) {
			var labelList = new Array();
			var valueList = new Array();
			var rcolor = "";
			$.each(data, function(key, value) {
				labelList.push(this["MON"]);
				valueList.push(this["CNT"]);
				rcolor = Math.random() * 0xffffff;
				rcolor = parseInt(rcolor);
				rcolor = rcolor.toString(16);
			});
		},
		error: function(xhr, textStatus, errorThrown) {
			alert(textStatus + " (HTTP-)" + xhr.status + " / " + errorThrown + ")");
		}
	});
})