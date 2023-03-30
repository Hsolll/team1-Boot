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
		<title>noticeDetail</title>
		<script type="text/javascript">
		let buttonCheck = 0; // 수정버튼과 삭제버튼을 구별하기 위한 변수
		$(function(){

			/* 수정 버튼 클릭 시 처리 이벤트 */
			$("#updateFormBtn").click(function(){
				buttonCheck = 1;
				if(buttonCheck==1){ // 수정버튼 클릭시
					goUrl = "/admin/noticeUpdateForm";
					$("#f_data").attr("action",goUrl);
					$("#f_data").submit();
				}
			});
			
			
			 /*삭제 버튼 클릭 시 처리 이벤트 */
			$("#noticeDeleteBtn").click(function(){
				buttonCheck = 2;
				let an_no = $("#an_no");
				$("#an_no").val()
				
				goUrl = "/admin/noticeDelete";
				$("#f_data").attr("action",goUrl);
				$("#f_data").submit();
				
			});
			/* 목록 버튼 클릭 시 처리 이벤트 */
			$("#noticeListBtn").click(function(){
				location.href="/admin/noticeList"; 
			});
			
		});
		</script>
	</head>

<body>

	<%-- =================== 상세페이지 시작  ================= --%>
			<div class="container">
			<form name="f_data" id="f_data" method="post">
				<input type="hidden" name="an_no" id="an_no" value="${detail.an_no}"/>
				<input type="hidden" name="an_file" value="${detail.an_file}"/>
				<input type="hidden" name="an_thumbnail" value="${detail.an_thumbnail}"/>   <!-- 히든방법 / 조회방법  -->
			
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
							<td>${detail.an_no}</td>
							<th scope="row">제목</th>
							<td colspan="3">${detail.an_title}</td>
						</tr>
						<tr>
							<th scope="row">작성자</th>
							<td>${detail.a_no}</td>
							<th scope="row">등록일</th>
							<td>${detail.an_created_at}</td>
							<th scope="row">조회수</th>
							<td>${detail.an_cnt}</td>
						</tr>
						<c:if test="${not empty detail.an_file}">
						<tr>
							<th scope="row">이미지</th>
							<td colspan="2">
					 			<img src="/uploadStorage/notice/${detail.an_file}">
							</td>
						</tr>
						</c:if>
					</tbody>
				</table>
				</div>
				<div class="detailContents">
					<p>${detail.an_content}</p>
				</div>
				</form>
				<div class="btnArea">
					<button type="button" class="btn btn-dark" id="updateFormBtn">수정하기</button>
					<button type="button" class="btn btn-dark" id="noticeDeleteBtn">삭제하기</button>
					<button type="button" class="btn btn-dark" id="noticeListBtn">목록으로</button>
				</div>
				
			</div>
			
			
	<%-- =================== 상세페이지 종료  ================= --%>
</body>
</html>