<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script src="/resources/include/js/common.js"></script>
		<script>
			$(function(){
				$("#updateBtn").click(function(){
					if(!chkData("#sc_content", "작성할 내용을")) return;
					else{
						$("#sc_updateForm").attr({
							method:"post",
							"enctype":"multipart/form-data",
							action:"/serviceCenter/serviceUpdate"
						});
						$("#sc_updateForm").submit();
					}
				});
				
				$("#cancelBtn").click(function(){
					$("#sc_updateForm").each(function(){
						this.reset();
					});
				});
				
				$("#listBtn").click(function(){
					location.href="/serviceCenter/serviceList";
				});
				
			});		
		</script>
	</head>
	<body>
		<div class="contentContainer container">
			<!-- <div class="contentTit page-header"><h3 class="text-center">글 상세화면</h3></div> -->
			<form name="sc_updateForm" id="sc_updateForm">
				<input type="hidden" id="sc_no" name="sc_no" value="${updateData.sc_no }">
				<table class="table table-bordered">
				<tbody>
					<tr>
						<td class="col-md-3">글번호</td>
						<td class="text-left col-md-3">${updateData.sc_no }</td>
						<td class="col-md-3">작성일</td>
						<td class="text-left col-md-3">${updateData.sc_created_at }</td>
					</tr>
					<tr>
						<td class="col-md-3">수정일</td>
						<td class="text-left col-md-3">${updateData.sc_updated_at }</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="3" class="text-left">${updateData.u_name }</td>
					</tr>
					<tr>
						<td>글제목</td>
						<td colspan="3" class="text-left">${updateData.sc_title }</td>
					</tr>
					<tr class="table-tr-height">
						<td>내용</td>
						<td colspan="3" class="text-left">
						<textarea id="sc_content" name="sc_content" class="form-control" rows="8">${updateData.sc_content }</textarea>
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td colspan="3" class="text-left"><input type="password" class="form-control" id="sc_pwd" name="sc_pwd" ${updateData.sc_pwd }></td>
					</tr>
				</tbody>
			</table>
				<div class="contentBtn text-right">
					<button id="updateBtn" type="button" class="btn btn-success">수정</button>
					<button id="cancelBtn" type="button" class="btn btn-success">취소</button>
					<button id="listBtn" type="button" class="btn btn-success">목록</button>
					
				</div>
			</form>
		</div>
	</body>
</html>