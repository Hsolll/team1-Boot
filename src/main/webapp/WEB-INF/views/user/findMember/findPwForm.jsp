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
		<link type="text/css" rel="stylesheet" href="/resources/include/css/findMember.css" />
	
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
				let chk1=false , chk2=false , chk3=false , chk4=false;
				
				
				 $("#btn2").click(function(){
					 $.ajax({
							url : "/member/findPwChk",
							type : "post",
							dataType : "json",
							data : {"u_id" : $("#u_id").val() ,"u_name" : $("#u_name").val(),"u_email" : $("#u_email").val()},
							success : function(data){
								if(data == 1){
									$("#findPw").attr({
				    					"method" :"post",
				    					"action" : "/member/findPw"
				    				})
				    				$("#findPw").submit();
									
								}else if(data == 0){
									alert("입력하신 정보를 찾을 수 없습니다.");
								
									chk1 =false;
								}
							}
						})
					
					
					 
					 if(!chkData("#u_name","이름을")) return;
		    			else if(!chkData("#u_id","아이디를")) return;
		    			else if(!chkData("#u_email","이메일을")) return;
		    			else if(!chkData("#u_emailCheck","인증번호를")) return;
		    					    				    				
		    		}) 
			})
		</script>
	</head>
	<body>
		<form id="findPw">
		
		
		<div class="member_wrap">
            <header class="member_header">
                
            </header>
            <div class="find_main">
                <ul class="tab" role="tablist">
                    <li id="tabPrvt" role="presentation"><a href="/member/findId" id="tab1" role="tab" onclick="toggleTab('tabPrvt');" aria-controls="tabPrvt" data-log-actionid-area="tab" data-log-actionid-label="tab" data-log-body="{&quot;btn_name&quot;:&quot;개인회원&quot;}" aria-selected="false">아이디 찾기</a></li>
                    <li id="tabBsns" role="presentation" class="on"><a href="/member/findPw" id="tab2" role="tab" onclick="toggleTab('tabBsns');" aria-controls="tabBsns" data-log-actionid-area="tab" data-log-actionid-label="tab" data-log-body="{&quot;btn_name&quot;:&quot;사업자회원&quot;}" aria-selected="true">비밀번호 찾기</a></li>
                </ul>
                          
                <section id="sectionBsns" style="display: block;">
                    <ul class="seller_guide">
                        <li>가입 시 입력한 <em>이름, 아이디. 이메일</em>로 비밀번호를 찾을 수 있습니다.</li>
                        <li>가입 시 입력한 <em>이메일</em>로 인증번호가 전송됩니다.</li>
                    </ul>
                    <fieldset class="form_box">
                        <legend>비밀번호 찾기 폼</legend>
                        <ul class="join_write">
                            <li>
                                <label for="etprsMemNm" class="lable_hide">이름</label><input type="text" name="u_name" id="u_name" class="inp" placeholder="이름" maxlength="100" />
                            </li>
                            <li>
                                <label for="etprsMemIdntyNo" class="lable_hide">아이디</label><input type="text" name="u_id" id="u_id" class="inp" placeholder="아이디" maxlength="25" /> 
                            </li>
                            <li>
                                <label for="etprsMemIdntyNo" class="lable_hide">이메일</label><input type="text" name="u_email" id="u_email" class="inp" placeholder="이메일" maxlength="25" />
                            </li>
                           
                        </ul>
                        <button type="button" id="btn2" class="btn_Atype btn_a"><span>확인</span></button>
                    </fieldset>
                </section>
            </div>
        </div>
        </form>
	</body>
</html>