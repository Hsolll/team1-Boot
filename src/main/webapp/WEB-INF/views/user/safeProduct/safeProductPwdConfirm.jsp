<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script src="/resources/include/js/common.js"></script>
		<script>
			$(function(){
				$("#chkBtn").click(function(){
					if(!chkData("#sp_pwd", "비밀번호를")) return;
					else {
						$.ajax({
							url : "/safe/productPwdChk",
							type : "post",
							data : $("#pwdForm").serialize(),
							dataType : "text",
							error : function(){
								alert("시스템 오류입니다. 다시 시도해주세요.")
							},
							success : function(result){
								if(result == "불일치"){
									alert("입력한 비밀번호가 일치하지 않습니다.");
									$("#sc_pwd").select();
								} else if(result == "일치") {
									$("#detailForm").attr({
										"method":"get",
										"action":"/safe/productDetailConfirm"
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
					location.href="/safe/productList";
				});
				
			});
			
		</script>
		<style>
			.btn{
				margin-right : 10px;
				width: 135px;
				height: 35px;
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
				<input type="hidden" id="sp_no" name="sp_no" value='${detail.sp_no }'>
			</form>
			<div class="text-center">
				<div class="form-container">
					<div class="pwdContainer">
						<form name="pwdForm" id="pwdForm">
							<input type="hidden" name="sp_no" value=${detail.sp_no }>
							PASSWORD   
							<input type="password" id="sp_pwd" name="sp_pwd" maxlength="20">
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