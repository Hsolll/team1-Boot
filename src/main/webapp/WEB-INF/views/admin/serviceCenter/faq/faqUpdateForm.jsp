<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/admin.jspf" %>
	
		<script>
			$(function(){
				$("#updateBtn").click(function(){
					if(!chkData("#f_title", "제목을")) return;
					else if(!chkData("#f_content", "작성할 내용을")) return;
					else{
						$("#f_updateForm").attr({
							method:"post",
							"enctype":"multipart/form-data",
							action:"/admin/faq/faqUpdate"
						});
						$("#f_updateForm").submit();
					}
				});
				
				$("#cancelBtn").click(function(){
					$("#f_updateForm").each(function(){
						this.reset();
					});
				});
				
				$("#listBtn").click(function(){
					location.href="/admin/faq/faqList";
				});
				
			});		
		</script>
		<style>
			.thBgGray th {text-align: center !important; background: #f1f1f1 !important;}
		</style>
	</head>
	<body>
		<div class="contentContainer">
			<!-- <div class="contentTit page-header"><h3 class="text-center">글 상세화면</h3></div> -->
			<form name="f_updateForm" id="f_updateForm">
				<input type="hidden" id="f_no" name="f_no" value="${faqData.f_no }">
				<table class="table table-bordered thBgGray">
					<colgroup>
						<col style="width: 14%;">
						<col>
						<col style="width: 14%;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th>글번호</th>
							<td class="text-left col-md-3">${faqData.f_no }</td>
							<th>작성일</th>
							<td class="text-left col-md-3">${faqData.f_created_at }</td>
						</tr>
						<tr>
							<th>수정일</th>
							<td class="text-left col-md-3">${faqData.f_updated_at }</td>
							<th>삭제일</th>
							<td class="text-left col-md-3">${faqData.f_deleted_at }</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td colspan="3" class="text-left">${faqData.a_no }</td>
						</tr>
						<tr>
							<th>글제목</th>
							<td colspan="3" class="text-left"><input type="text" id="f_title" name="f_title" class="form-control" value=${faqData.f_title }></td>
						</tr>
						<tr class="table-tr-height">
							<th>내용</th>
							<td colspan="3" class="text-left">
							<textarea id="f_content" name="f_content" class="form-control" rows="8">${faqData.f_content }</textarea>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="btnArea">
					<button id="updateBtn" type="button" class="btn btn-dark">수정</button>
					<button id="cancelBtn" type="button" class="btn btn-dark">취소</button>
					<button id="listBtn" type="button" class="btn btn-dark">목록</button>
					
				</div>
			</form>
		</div>
	</body>
</html>