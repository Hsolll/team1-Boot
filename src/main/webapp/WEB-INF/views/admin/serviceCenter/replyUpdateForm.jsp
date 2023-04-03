<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<script src="/resources/vendor/jquery/jquery-3.3.1.min.js"></script>
		<title>noticeupdateForm</title>
		<script type="text/javascript">
			$(function(){
				$(".dashboard-wrapper .page-header h1").html("문의관리");
				$("#updateBtn").click(function(){
					//console.log("입력한 내용 : " + $("#as_content").text());
					
					$("#updateForm").attr({
						"method":"post",
						"action":"/admin/admReplyUpdate"
					});
					$("#updateForm").submit();
				});
				
				$("#resetBtn").click(function(){
					location.href = "/admin/serviceCenterList";
				});
			});
		</script>
		
	</head>

<body>
	<div class="contentContainer">
			<!-- <div class="contentTit page-header"><h3 class="text-center">게시판 글수정</h3></div> -->
				
			<div class="rowTable">
				<form id="updateForm" name="updateForm">
					<input type="hidden" id="as_no" name="as_no" value="${updateForm.as_no}">
				
					<table>
						<tbody>
							<tr>
								<th>글번호</th> 
								<td><input type="text" value="${updateForm.as_no}" readonly="readonly" /></td>
								<th>작성일</th> 
								<td>${updateForm.as_created_at}</td> 
							</tr>
							<tr>
								<th>작성자</th>
								<td colspan="3"><input type="text" value="${updateForm.a_name}" readonly="readonly" /></td>
							</tr>
							<tr>
								<th>글제목</th>
								<td colspan="3">
									<input type="text" name="as_title" id="as_title" value="${updateForm.as_title}" class="form-control" readonly="readonly" />
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan="3">
									<textarea class="form-control" name="as_content" rows="8">${updateForm.as_content}</textarea>
								</td>
							</tr>
						</tbody>	
					</table>
				</form>
			</div>
				
			<div class="btnArea">
				<button id="updateBtn" type="button" class="btn btn-dark">수정</button>
				<button id="resetBtn" type="button" class="btn btn-dark">취소</button>			
			</div>
			
		</div>
</body>
</html>