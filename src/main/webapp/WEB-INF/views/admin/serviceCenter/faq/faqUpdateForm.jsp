<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/admin.jspf" %>
	<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
	<link href="/resources/include/dist/css/bootstrap.min.css">
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
	</head>
	<body>
		<div class="contentContainer container">
			<!-- <div class="contentTit page-header"><h3 class="text-center">글 상세화면</h3></div> -->
			<form name="f_updateForm" id="f_updateForm">
				<input type="hidden" id="f_no" name="f_no" value="${faqData.f_no }">
				<table class="table table-bordered">
				<tbody>
					<tr>
						<td class="col-md-3">글번호</td>
						<td class="text-left col-md-3">${faqData.f_no }</td>
						<td class="col-md-3">작성일</td>
						<td class="text-left col-md-3">${faqData.f_created_at }</td>
					</tr>
					<tr>
						<td class="col-md-3">수정일</td>
						<td class="text-left col-md-3">${faqData.f_updated_at }</td>
						<td class="col-md-3">삭제일</td>
						<td class="text-left col-md-3">${faqData.f_deleted_at }</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="3" class="text-left">${faqData.a_no }</td>
					</tr>
					<tr>
						<td>글제목</td>
						<td colspan="3" class="text-left"><input type="text" id="f_title" name="f_title" class="form-control" value=${faqData.f_title }></td>
					</tr>
					<tr class="table-tr-height">
						<td>내용</td>
						<td colspan="3" class="text-left">
						<textarea id="f_content" name="f_content" class="form-control" rows="8">${faqData.f_content }</textarea>
						</td>
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