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
			$(".dashboard-wrapper .page-header h1").html("자유게시판 관리");
			 /*삭제 버튼 클릭 시 처리 이벤트 */
			$("#communityDeleteBtn").click(function(){
				if(confirm("해당 글을 삭제하시겠습니까?")){
				
				goUrl = "/admin/admDeleteCommunity";
				$("#f_data").attr("action",goUrl);
				$("#f_data").submit();
				}
			});
			/* 목록 버튼 클릭 시 처리 이벤트 */
			$("#listBtn").click(function(){
				let category = "<c:out value='${detail.c_category}' />";
				console.log("category : " + category);
				location.href="/admin/admCommunityList?c_category=" + category;
			});
			
		});
		</script>
	</head>

<body>

	<%-- =================== 상세페이지 시작  ================= --%>
			<div>
			<form name="f_data" id="f_data" method="post">
				<input type="hidden" name="c_no" id="c_no" value="${ detail.c_no }" />
				<input type="hidden" name="c_category" id="c_category" value="${ detail.c_category }" />  <!-- 히든방법 / 조회방법  -->
			</form>
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
							<td>${detail.c_no}</td>
							<th scope="row">제목</th>
							<td colspan="3">${detail.c_title}</td>
						</tr>
						<tr>
							<th scope="row">작성자</th>
							<td>${ detail.u_id }</td>
							<th scope="row">등록일</th>
							<td>${detail.c_created_at}</td>
							<th scope="row">조회수</th>
							<td>${ detail.c_cnt }</td>
						</tr>
						<tr>
							<th scope="row">내용</th>
							<td colspan="5" class="contents">
								<c:if test="${not empty detail.c_file}">
						 			<img src="/uploadStorage/communityC/${detail.c_file}">
					 			</c:if>
					 			${ detail.c_content }
							</td>
						</tr>
					</tbody>
				</table>
				</div>
				
				<div class="btnArea">
					<button type="button" class="btn btn-dark" id="communityDeleteBtn">삭제하기</button>
					<button type="button" class="btn btn-dark" id="listBtn">목록으로</button>
				</div>
				
			</div>
			
			
	<%-- =================== 상세페이지 종료  ================= --%>
</body>
</html>