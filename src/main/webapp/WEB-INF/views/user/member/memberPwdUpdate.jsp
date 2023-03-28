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
		$(function(){
			let getPwdChk = RegExp(/^(?=.*[A-Z]|[a-z])(?=.*\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8,16}$/);
			let chk4 = false , chk5=false;
			$('#u_pwd').keyup(function(){
    			
    			if(getPwdChk.test($(this).val())){
    				$('#pwdCheck').html('사용가능합니다.').css('color','green');
    				
    			}else{
    				$('#pwdCheck').html('8~16자의 영문 대소문자, 숫자, 특수문자를 입력해주세요').css('color','red');
    				chk4= false;
    			}
    			
    			if($(this).val() === ''){
    				$('#pwdCheck').html('');
    				chk4= false;
    			}
    			
    			 /* if($("#u_pwd").val()!==$("#u_rpwd").val() && $("#u_pwd").val()!==''){
    				 $('#pwdCheck').html('비밀번호 불일치');
    			 }else{
    				 $('#pwdCheck').html('비밀번호 일치');
    			 } */
    		})
    		
    		$('#u_rpwd').keyup(function(){
    			getPwdChk.test($(this));
    			
    			if($(this).val() === ''){
    				$('#pwdCheck').html('');
    				chk5= false;
    			}
    			
    			if($("#u_pwd").val()!==$("#u_rpwd").val() && $("#u_pwd").val()!==''){
   				 $('#pwdCheck').html('비밀번호 불일치').css('color','red');
   				chk5= false;
   			 }else{
   				 $('#pwdCheck').html('비밀번호 일치').css('color','green');
   				chk4 = true ,chk5= true;
   			 }
    		})
    		
    		$("#btn").click(function(){
    			if(chk4 && chk5){
    				$("#memberPwdupdate").attr({
    					"method" :"post",
    					"action" : "/member/memberPwdUpdate"
    				})
    				$("#memberPwdupdate").submit();
    			
    				alert("비밀번호가 변경되어 로그아웃됩니다.");
    		
    				
    			}else{
    				alert("양식을 확인해주세요");
    				console.log(chk4,chk5);
    			}
    		})
		})
		</script>
	</head>
	<body>
	<form id="memberPwdupdate">
	<input type="hidden" name="u_no" value="${memberLogin.u_no }" />
		<h3>변경하실 비밀번호를 작성해주세요</h3>
		비밀번호<input type="password" id="u_pwd" name="u_pwd" /><br />
		비밀번호확인<input type="password" id="u_rpwd" name="u_rpwd" /><br />
		<span id="pwdCheck"></span><br />
		<button type="button" id="btn">비밀번호 수정</button>
		</form>
	</body>
</html>