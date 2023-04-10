<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<link type="text/css" rel="stylesheet" href="/resources/include/css/communityWrite.css" />
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
		<div class="community_wite">
			<!-- <div class="contentTit page-header"><h3 class="text-center">글 상세화면</h3></div> -->
			<form name="sc_updateForm" id="sc_updateForm">
				<input type="hidden" id="sc_no" name="sc_no" value="${updateData.sc_no }">
				<table class="table table-bordered thBgGray">
					<colgroup>
						<col style="width: 150px;">
						<col>
						<col>
					</colgroup>
						<tbody>
							<tr>
								<th>작성자</th>
								<td>${updateData.u_name }</td>
							</tr>
							<tr>
								<th>제목</th>
								<td>${updateData.sc_title }</td>
							</tr>
							<tr>
								<th>내용</th>
								<td>
									<textarea id="sc_content" name="sc_content" >${updateData.sc_content }</textarea>
								</td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td colspan="3" class="text-left"><input type="password" class="form-control" id="sc_pwd" name="sc_pwd" ${updateData.sc_pwd }></td>
							</tr>
						</tbody>
				</table>
				<div class="buttonArea">
					<button id="updateBtn" type="button" class="buttonWhite">수정</button>
					<button id="cancelBtn" type="button" class="buttonBlack">취소</button>
					<button id="listBtn" type="button" class="buttonWhite">목록</button>
					
				</div>
			</form>
		</div>
	</body>
</html>