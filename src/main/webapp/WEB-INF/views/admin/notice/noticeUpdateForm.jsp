<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<script src="/resources/include/js/common.js"></script>
		<script src="/resources/vendor/jquery/jquery-3.3.1.min.js"></script>
		<title>noticeupdateForm</title>
		<script type="text/javascript">
		$(function(){
			/* 수정 버튼 클릭 시 처리 이벤트 */
			$("#boardUpdateBtn").click(function(){
				//입력값 체크
				if (!chkData("#an_title","제목을"))	 return;
				else if (!chkData("#an_content","작성할 내용을"))	return;
				else{
					if($("#file").val()!=""){
						if (!chkFile($("#file"))) return;
					}
					$("#f_updateForm").attr({
						"method":"post",
						"enctype":"multipart/form-data",
						"action":"/admin/noticeUpdate"
					});
					$("#f_updateForm").submit();
				}
			});
			
			/* 취소 버튼 클릭 시 처리 이벤트 */
			$("#boardCancelBtn").click(function(){
				$("#f_updateForm").each(function(){
					this.reset();
				});
			});				
			
			/* 목록 버튼 클릭 시 처리 이벤트 */
			$("#boardListBtn").click(function(){
				location.href="/admin/noticeList"; 
			});
		});
	</script>
		
	</head>

<body>
	<div class="contentContainer container">
			<!-- <div class="contentTit page-header"><h3 class="text-center">게시판 글수정</h3></div> -->
				
			<div class="rowTable">
			<form id="f_updateForm" name="f_updateForm">
					<input type="hidden" id="an_no" name="an_no" value="${updateData.an_no}" />
					<input type="hidden" id="an_file" name="an_file" value="${updateData.an_file}" />
					<input type="hidden" id="an_thumbnail" name="an_thumbnail" value="${updateData.an_thumbnail}" />
				
				<table>
					<tbody>
						<tr>
							<th>글번호</th> 
							<td>${updateData.an_no}</td>
							<th>작성일</th> 
							<td>${updateData.an_created_at}</td> 
						</tr>
						<tr>
							<th>작성자</th>
							<td colspan="3">${updateData.a_no}</td>
						</tr>
						<tr>
							<th>글제목</th>
							<td colspan="3">
								<input type="text" name="an_title" id="an_title" value="${updateData.an_title}" class="form-control" />
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3">
								<textarea name="an_content" id="an_content" class="form-control" rows="8">${updateData.an_content}</textarea>
							</td>
						</tr>
						<tr>
							<th>이미지파일첨부</th>
							<td colspan="3"><input type="file" name="file" id="file" ></td>
						</tr>
					</tbody>	
				</table>
			</form>
			</div>
			
			<div class="btnArea">
				<button id="boardUpdateBtn"type="button" class="btn btn-dark">수정</button>
				<button id="boardCancelBtn"type="button" class="btn btn-dark">취소</button>			
				<button id="boardListBtn"type="button" class="btn btn-dark">목록</button>
			</div>
		</div>
</body>
</html>