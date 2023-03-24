<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		 
		$(function(){
    		 let errorMsg= "${errorMsg}";
    		if(errorMsg!=""){
    			alert(errorMsg);
    			errorMsg ="";
    		} 
    		$("#btn1").click(function(){
    			location.href="/member/findId";
    		})
    		$("#btn2").click(function(){
    			location.href="/member/findPw";
    		})
    		
    		$("#btn").click(function(){
    				
    			if(!chkData("#u_id","아이디를")) return;
    			else if(!chkData("#u_pwd","비밀번호를")) return;
    			else{
    				$("#login").attr({
    					"method" :"post",
    					"action" : "/login"
    				})
    				$("#login").submit();
    			}
    				
    		})
    	}) 
		</script>
	</head>
	<body>
	<form id="login">
		아이디<input type="text" id="u_id" name="u_id" /> <br />
		비밀번호<input type="password" id="u_pwd" name="u_pwd" /> <br />
		<button type="button" id="btn" value="로그인">로그인</button> <br />
		<button type="button" id="btn1" value="아이디 찾기">아이디 찾기</button> <br />
		<button type="button" id="btn2" value="비밀번호 찾기">비밀번호 찾기</button> <br />
		
		</form>
	</body>
</html>