<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<script src="/resources/vendor/jquery/jquery-3.3.1.min.js"></script>
		<title>serviceCenterDetail</title>
		
		<script>
			$(function(){
				$(".dashboard-wrapper .page-header h1").html("문의관리");
				$("#listBtn").click(function(){
					location.href="/admin/serviceCenterList";
				});
				
				$("#replyBtn").click(function(){
					$("#update").attr({
						"action":"/admin/replyWriteForm"
					});
					$("#update").submit();	
				});
				
				$("#delButton").click(function(){
					if(confirm("해당 문의를 삭제하시겠습니까?")){
						$("#update").attr({
							"method":"post",
							"action":"/admin/serviceCenterDelete"
						});
						$("#update").submit();						
					}
				});
			});
			
		</script>
	</head>

<body>

	<%-- =================== 상세페이지 시작  ================= --%>
			<div>
				<form id="update" name="update">
					<input type="hidden" id="sc_no" name="sc_no" value="${serviceDetail.sc_no}" />
				<div class="detailTopTable">
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
							<td colspan="1">${serviceDetail.sc_no}</td>
							<th scope="row">제목</th>
							<td colspan="1">${serviceDetail.sc_title}</td>
							<th scope="row">조회수</th>
							<td colspan="1">${serviceDetail.sc_readcnt}</td>
						</tr>
						<tr>
							<th scope="row">작성자</th>
							<td colspan="1">${serviceDetail.u_name}</td>
							<th scope="row">등록일</th>
							<td colspan="1">${serviceDetail.sc_created_at}</td>
						</tr>
						<tr>
							<th scope="row">내용</th>
							<td class="contents" colspan="4">${serviceDetail.sc_content}</td>
						</tr>
					</tbody>
				</table>
				</div>
				</form>
				
				
				<div class="btnArea">
					<button id="replyBtn"type="button" class="btn btn-dark">답글달기</button>
					<button id="delButton"type="button" class="btn btn-dark">삭제하기</button>
					<button id="listBtn" type="button" class="btn btn-dark">목록으로</button>
				</div>
				
			</div>
			
			
	<%-- =================== 상세페이지 종료  ================= --%>
</body>
</html>