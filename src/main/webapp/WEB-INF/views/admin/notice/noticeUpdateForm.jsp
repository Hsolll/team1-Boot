<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		
		<title>noticeupdateForm</title>
		
		
	</head>

<body>
	<div class="contentContainer container">
			<!-- <div class="contentTit page-header"><h3 class="text-center">게시판 글수정</h3></div> -->
				
			<div class="rowTable">
				<table>
					<tbody>
						<tr>
							<th>글번호</th> 
							<td>${updateData.b_num}</td>
							<th>작성일</th> 
							<td>${updateData.b_date}</td> 
						</tr>
						<tr>
							<th>작성자</th>
							<td colspan="3">${updateData.b_name}</td>
						</tr>
						<tr>
							<th>글제목</th>
							<td colspan="3">
								<input type="text" name="b_title" id="b_title" value="${updateData.b_title}" class="form-control" />
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3">
								<textarea name="b_content" id="b_content" class="form-control" rows="8">${updateData.b_content}</textarea>
							</td>
						</tr>
						<tr>
							<th>이미지파일첨부</th>
							<td colspan="3"><input type="file" name="file" id="file" ></td>
						</tr>
					</tbody>	
				</table>
			</div>
			
			<div class="btnArea">
				<button type="button" class="btn btn-dark">수정</button>
				<button type="button" class="btn btn-dark">취소</button>			
			</div>
		</div>
</body>
</html>