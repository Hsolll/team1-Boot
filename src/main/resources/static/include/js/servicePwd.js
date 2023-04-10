$(function() {
	$("#chkBtn").click(function() {
		if (!chkData("#sc_pwd", "비밀번호를")) return;
		else {
			$.ajax({
				url: "/serviceCenter/servicepwdChk",
				type: "post",
				data: $("#pwdForm").serialize(),
				dataType: "text",
				error: function() {
					alert("시스템 오류입니다. 다시 시도해주세요.")
				},
				success: function(resultData) {
					if (resultData == "실패") {
						alert("입력한 비밀번호가 일치하지 않습니다.");
						$("#sc_pwd").select();
					} else {
						$("#detailForm").attr({
							"method": "get",
							"action": "/serviceCenter/serviceDetail"
						});
						$("#detailForm").submit();
					}
				}
			});
		}
	});

	$("#cancelBtn").click(function() {
		$("#pwdForm").each(function() {
			this.reset();
		});
	});

	$(".listBtn").click(function() {
		location.href = "/serviceCenter/serviceList";
	});

});