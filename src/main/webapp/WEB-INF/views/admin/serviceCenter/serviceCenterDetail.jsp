<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		
		<title>noticeDetail</title>
		
	</head>

<body>

	<%-- =================== 상세페이지 시작  ================= --%>
			<div class="container">
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
							<th scope="row">제목</th>
							<td colspan="4">[고객센터] 합병으로 인한 주권제출 및 채건자 이의제출 공고</td>
						</tr>
						<tr>
							<th scope="row">작성자</th>
							<td>작성자명</td>
							<th scope="row">등록일</th>
							<td>2023-03-11</td>
						</tr>
					</tbody>
				</table>
				</div>
				<div class="detailContents">
					<p>상세내용 영역</p>
				</div>
				<div class="btnArea">
					<button type="button" class="btn btn-dark">답글달기</button>
					<button type="button" class="btn btn-dark">목록으로</button>
				</div>
				
			</div>
			
			
	<%-- =================== 상세페이지 종료  ================= --%>
</body>
</html>