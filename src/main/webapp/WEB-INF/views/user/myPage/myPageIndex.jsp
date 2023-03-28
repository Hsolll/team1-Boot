<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />	
		<title>Insert title here</title>
	
		<link rel="shortcut icon" href="/resources/images/common/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/common/icon.png" />
	
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		
		<link rel="stylesheet" type="text/css" href="/resources/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/dist/css/bootstrap-theme.css" />
		
		<script type="text/javascript" src="/resources/include/js/jquery-3.6.2.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		
		</script>
	</head>
	<body>
	
	<form id="update">
	<input type="hidden" name="u_no" value="${memberLogin.u_no }" />
	
	<div>
	<c:if test="${not empty memberLogin }">
          		${memberLogin.u_name }님 반갑습니다.
          		</c:if>
          		</div>
	<a href="/member/pwdChkForm">회원정보수정</a> /
	<a href="/member/pwdChkForm2">회원비밀번호수정</a> /
	<a href="/member/pwdChkForm3">회원탈퇴</a>
	<div class="text-center">
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td class="col-md-3">번호</td>
								<td class="col-md-3 text-left">${memberLogin.u_no }</td>
							</tr>
							<tr>
								<td class="col-md-3">이름</td>
								<td class="col-md-3 text-left">${memberLogin.u_name }</td>
							</tr>
							<tr>
								<td class="col-md-3">아이디</td>
								<td colspan="3" class="col-md-9 text-left">${memberLogin.u_id }</td>
							</tr>
							<tr>
								<td class="col-md-3">이메일</td>
								<td colspan="3" class="col-md-9 text-left">${memberLogin.u_email }</td>
							</tr>
							</tbody>
							</table>
							</div>
	</form>
	</body>
</html>