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
		<link type="text/css" rel="stylesheet" href="/resources/include/css/findMember.css" />
		
		
		<script type="text/javascript" src="/resources/include/js/jquery-3.6.2.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		$(function(){
			
			
			$("#btn").click(function(){
				
				if($("#u_name").val()===''){
					alert("이름을 입력해주세요");
				}else if($("#u_email").val()===''){
					alert("이메일을 입력해주세요");
				}else{
				$("#findId").attr({
					"method" :"post",
					"action" : "/member/findId"
				})
				$("#findId").submit();
				}
			})
		})
		</script>
	</head>
	<body>
		<form id="findId">
		
		
		<div class="member_wrap">
            <header class="member_header">
                
            </header>
            <div class="find_main">
                <ul class="tab" role="tablist">
                    <li class="on"><a href="/member/findId" id="tab1">아이디 찾기</a></li>
                    <li><a href="/member/findPw" id="tab2">비밀번호 찾기</a></li>
                </ul>
                          
                <section style="display: block;">
                    <ul class="guide">
                        <li style="padding-top: 35px;"><em>*</em> 가입 시 입력한 <em>이름, 이메일</em>로 아이디를 찾을 수 있습니다.</li>
                    </ul>
                    <fieldset class="form_box">
                        <legend></legend>
                        <ul class="join_write">
                            <li>
                                <label for="name" class="lable_hide">이름</label><input type="text" name="u_name" id="u_name" class="inp" placeholder="이름" maxlength="100" />
                            </li>
                            <li>
                                <label for="email" class="lable_hide">이메일</label><input type="text" name="u_email" id="u_email" class="inp" placeholder="이메일" maxlength="25" />
                            </li>
                        </ul>
                        <button type="button" id="btn" class="btn_Atype btn_a"><span>확인</span></button>
                    </fieldset>
                </section>
            </div>
        </div>
        </form>
	</body>
</html>