<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
	<head>
		
		<title>memberDetail</title>
		
		<script type="text/javascript">
			$(function(){
				$("#listBtn").click(function(){
					location.href="/admin/memberList";
				});
			});
		</script>
	</head>
<body>
		<%-- ============== container 시작 ====================  --%>
		<div class="container">
			<div class="rowTable">
				<table>
					<colgroup>
						<col style="width: 20%;">
						<col style="width: 30%;">
						<col style="width: 20%;">
						<col style="width: 30%;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">회원번호</th>
							<td>${detail.u_no}</td>
							<th scope="row">이름</th>
							<td>${detail.u_name}</td>
						</tr>
						<tr>
							<th scope="row">아이디</th>
							<td>${detail.u_id}</td>
							<th scope="row">닉네임</th>
							<td>${detail.u_nick}</td>
						</tr>
						<tr>
							<th scope="row">이메일</th>
							<td></td>
							<th scope="row">핸드폰번호</th>
							<td>${detail.u_phone}</td>
						</tr>
						<tr>
							<th scope="row">주소</th>
							<td colspan="3"></td>
						</tr>
						<tr>
							<th scope="row">회원등급</th>
							<td>${detail.u_grade}</td>
							<th scope="row">회원상태(탈퇴여부)</th>
							<td>${detail.u_status}</td>
						</tr>
						<tr>
							<th scope="row">회원가입일</th>
							<td colspan="3">${detail.u_created_at}</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="btnArea">
				<button id="listBtn"type="button" class="btn btn-dark">목록으로</button>
			</div>
		</div>
		<%-- ============== container 종료 ====================  --%>
</body>
</html>