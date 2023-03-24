<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script src="/resources/include/js/common.js"></script>
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