<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<script src="/resources/vendor/jquery/jquery-3.3.1.min.js"></script>
		<title>noticeDetail</title>
		
		<script>
			$(function(){
				
				$("#listBtn").click(function(){
					location.href="/admin/serviceCenterList";
				});
				
				$("#updateBtn").click(function(){
					$("#update").attr({
						"method":"get",
						"action":"/admin/replyUpdateForm"
					});
					$("#update").submit();
				});
				
				$("#delButton").click(function(){
					if(confirm("해당 문의를 삭제하시겠습니까?")){
						$("#update").attr({
							"method":"post",
							"action":"/admin/replyServiceCenterDelete"
						});
						$("#update").submit();						
					}
				});
			});
			
		</script>
	</head>

<body>

	<%-- =================== 상세페이지 시작  ================= --%>
			<div class="container">
				<div class="detailTopTable">
				<form id="update" name="update">
					<input type="hidden" id="as_no" name="as_no" value="${replyDetail.as_no}">
				</form>
				<table>
					<colgroup>
						<col style="width:8%;">
						<col style="width:25.333%;">
						<col style="width:8%;">
						<col style="width:25.333%;">
						<col style="width:8%;">
						<col style="width:25.333%;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">글번호</th>
							<td colspan="1">${replyDetail.as_no}</td>
							<th scope="row">제목</th>
							<td colspan="1">${replyDetail.as_title}</td>
						</tr>
						<tr>
							<th scope="row">작성자</th>
							<td colspan="1">${replyDetail.a_name}</td>
							<th scope="row">등록일</th>
							<td colspan="1">${replyDetail.as_created_at}</td>
						</tr>
					</tbody>
				</table>
				</div>
				<div class="detailContents">
					<p>${replyDetail.as_content}</p>
				</div>
				<div class="btnArea">
					<button id="updateBtn"type="button" class="btn btn-dark">수정하기</button>
					<button id="delButton"type="button" class="btn btn-dark">삭제하기</button>
					<button id="listBtn" type="button" class="btn btn-dark">목록으로</button>
				</div>
				
			</div>
			
			
	<%-- =================== 상세페이지 종료  ================= --%>
</body>
</html>