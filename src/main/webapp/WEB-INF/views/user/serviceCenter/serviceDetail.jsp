<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script src="/resources/include/js/common.js"></script>
		<script>
			$(function(){
				
				$(".listBtn").click(function(){
					location.href="/serviceCenter/serviceList";
				});
				
				$("#updateButton").click(function(){
					$("#update").attr({
						"action":"/serviceCenter/serviceUpdateForm"
					});
					$("#update").submit();
				});
				
				$("#delButton").click(function(){
					if(confirm("해당 문의를 삭제하시겠습니까?")){
						$("#update").attr({
							"method":"get",
							"action":"/serviceCenter/serviceDelete"
						});
						$("#update").submit();						
					}
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
			
			.btn-group {
				margin-top: 20px;
			}
			.btnArea {
				margin-bottom : 20px;
			}
			.thBgGray th {text-align: center !important; background: #f1f1f1 !important;}
		</style>
	</head>
	<body>
		<div class="contentContainer container">
			<div class="text-center">
				<div class="form-container">
					<div class="detailContainer">
						<form id="update" name="update" >
							<input type="hidden" id="sc_no" name="sc_no" value=${serviceDetail.sc_no }>
						</form>
						<table class="table table-bordered thBgGray">
							<colgroup>
								<col style="width: 14%;">
								<col>
								<col style="width: 14%;">
								<col>
							</colgroup>	
							<tbody>
								<tr>
									<th>작성자</th>
									<td class="text-left">${serviceDetail.u_name }</td>
									<th>등록일</th>
									<td class="text-left">${serviceDetail.sc_created_at }</td>
								</tr>
								<tr>
									<th>제목</th>
									<td class="text-left">${serviceDetail.sc_title }</td>
									<th>조회수</th>
									<td class="text-left">${serviceDetail.sc_readcnt }</td>
								</tr>
								<tr class="table-tr-height">
									<th style="vertical-align: middle;">내용</th>
									<td colspan="3" class="text-left" style="overflow-x: auto; height: 280px; word-break: break-all;">${serviceDetail.sc_content }</td>
								</tr>
							</tbody>
						</table>
						<div class="btnArea text-right">
							<button type="button" id="updateButton" class="btn btn_default">수정하기</button>
							<button type="button" id="delButton" class="btn btn_default">삭제하기</button>
							<button type="button" class="btn btn_default listBtn">목록보기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>