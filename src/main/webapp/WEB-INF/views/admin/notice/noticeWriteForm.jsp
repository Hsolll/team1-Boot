<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<title>noticewriteForm</title>
		
		
	</head>

<body>

	<%-- =================== 등록페이지 시작  ================= --%>
		<div class="container">
			<div class="rowTable">
				<table class="table table-bordered">
					<colgroup>
						<col width= "18%" />
						<col width= "82%" />
					</colgroup>
					<tbody>
						<tr>
							<th>제목</th>
							<td><input type="text" class="form-control" placeholder="제목을 입력해주세요"></td>
						</tr>
						<tr>
							<th>게시판 선택</th>
							<td>
								<label for="notice">공지사항 게시판</label><input type="radio" id="notice" name="notice_board" value="notice" style="display: inline-block;" checked />
								<label for="event">이벤트 게시판</label><input type="radio" id="event" name="event_board" value="event" style="display: inline-block;" checked />
							</td>
						</tr>
						<tr>
							<th>이미지 파일</th>
							<td colspan="3"><input type="file" name="file" id="file"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea class="form-control" placeholder="내용을 입력해주세요"></textarea></td>
						</tr>
					</tbody>
				</table>
			</div>
			<%-- =================== 등록페이지 종료  ================= --%>
			
			<div class="btnArea">
				<button type="button" class="btn btn-dark">등록</button>
				<button type="button" class="btn btn-dark">취소</button>
			</div>	
		</div>
</body>
</html>