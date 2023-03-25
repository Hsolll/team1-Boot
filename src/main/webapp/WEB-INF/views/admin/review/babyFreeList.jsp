<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		
		<title>eventList</title>
		
		
	</head>

<body>
	<%-- ============== container 시작 ====================  --%>
<div class="container"> 
	<%-- ============== 검색기능 시작 ====================  --%>
	<div id="boardSearch" class="text-right">
		<form id="f_search" name="f_search" class="form-inline">
			<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
			<div class="form-group ml-auto">
				<label>검색조건</label>
				<select id="search" name="search"  class="form-control m-l-10">
					<option value="all">전체</option>
					<option value="b_title">글번호</option>
					<option value="b_content">등록일</option>
					<option value="b_name">제목</option>
				</select>
				<input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" class="form-control m-l-10" />
				<button type="button" id="searchData" class="btn">검색</button>
				<button type="button" class="btn btn-dark m-l-100">글쓰기</button>
				<button type="button" class="btn btn-dark m-l-10">삭제</button>
			</div>
		</form>
	</div>
<%--================== 검색기능 종료 ===================  --%>

<%-- =================== 리스트 시작  ================= --%>
	<div id="memberList" class="table-responsive">
		<table summary="이벤트공지사항 리스트" class="table table-striped m-t-15" >
			<thead>
				<tr>
					<th><input type="checkbox"></th>
					<th data-value="u_no" class="order text-center col-md-1" >이벤트글 번호</th>
					<th class="text-center col-md-2">구분</th>
					<th class="text-center col-md-2">제목</th>
					<th class="text-center col-md-4">등록일</th>
					<th data-value="b_date" class="order text-center col-md-3">조회수</th>
					<th class="text-hide">버튼영역</th>
				</tr>
			</thead>
	 		<tbody id="list" class="table-striped" >
				<!-- 데이터 출력 -->
				<c:choose>
					<c:when test="${not empty memberList}" >
						<c:forEach var="member" items="${memberList}" varStatus="status">
							<tr class="text-center" data-num="${member.u_no}">
								<td><input type="checkbox"></td>
								<td>${member.u_no}</td>
								<td class="goDetail text-center">
								${member.u_id}
								</td>
								<td class="name">${member.u_nick}</td>
								<td class="text-center">${member.u_phone}</td>
								<td class="text-center">${member.u_created_at}</td>
								<td class="text-center">${member.u_grade}</td>
								<td><button class="btn btn-dark">등록</button></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="8" class="tac text-center">등록된 게시글이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody> 
		</table>
	</div>
	<%-- =================== 리스트 종료  ================= --%>
</div>
</body>
</html>