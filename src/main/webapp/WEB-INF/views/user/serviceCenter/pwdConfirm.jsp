<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script src="/resources/include/js/common.js"></script>
		<script>
			$(function(){
				$("#chkBtn").click(function(){
					if(!chkData("#sc_pwd", "비밀번호를")) return;
					else {
						$.ajax({
							url : "/serviceCenter/servicepwdChk",
							type : "post",
							data : $("#pwdForm").serialize(),
							dataType : "text",
							error : function(){
								alert("시스템 오류입니다. 다시 시도해주세요.")
							},
							success : function(resultData){
								if(resultData == "실패"){
									alert("입력한 비밀번호가 일치하지 않습니다.");
									$("#sc_pwd").select();
								} else {
									$("#detailForm").attr({
										"method":"get",
										"action":"/serviceCenter/serviceDetail"
									});
									$("#detailForm").submit();
								}
							}
						});
					}
				});
				
				$("#cancelBtn").click(function(){
					$("#pwdForm").each(function(){
						this.reset();
					});
				});
				
				$(".listBtn").click(function(){
					location.href="/serviceCenter/serviceList";
				});
				
			});
			
		</script>
		<style>
			.btn{
				margin-right : 10px;
				width: 135px;
				height: 35px;
			}
			
			input{
				height: 30px;
				margin-left: 10px;
				border-color: whitesmoke;
			}
			
			.form-container{
				border-bottom: 1px solid #eee;
				margin: 40px 0;
				padding-bottom: 60px;
			}
			
			.detailContainer{
				display:none;
			}
			
			.btn-group {
				margin-top: 20px;
			}
			.btnArea {
				margin-bottom : 20px;
			}
		</style>
	</head>
	<body>
		<div class="contentContainer container">
			<form name="detailForm" id="detailForm">
				<input type="hidden" id="sc_no" name="sc_no" value='${data.sc_no }'>
				<input type="hidden" id="as_no" name="as_no" value='${data.as_no }'>
			</form>
			<div class="text-center">
				<div class="form-container">
					<div class="pwdContainer">
						<form name="pwdForm" id="pwdForm">
							<input type="hidden" name="sc_no" value=${data.sc_no }>
							PASSWORD   <input type="password" id="sc_pwd" name="sc_pwd" maxlength="20">
						</form>
						<div class="text-center btn-group">
							<input type="button" value="확인하기" id="chkBtn" class="btn btn-default">
							<input type="button" value="취소하기" id="cancelBtn" class="btn btn-default">
							<input type="button" value="목록보기" class="btn btn-default listBtn">
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>