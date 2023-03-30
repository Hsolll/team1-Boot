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
			$("#btn").click(function(){
				location.href="/login";
			})
			$("#btn1").click(function(){
				location.href="/member/findId";
			})
		})
		</script>
	</head>
	<body>
		<c:if test="${check == 1 }">
		<div class="member_wrap">
            <header class="member_header">
                
            </header>
		<div class="find_main">
                <ul class="tab" role="tablist">
                    <li id="tabPrvt" role="presentation"  class="on"><a href="#tabPrvt" id="tab1" role="tab" onclick="toggleTab('tabPrvt');" aria-controls="tabPrvt" data-log-actionid-area="tab" data-log-actionid-label="tab" data-log-body="{&quot;btn_name&quot;:&quot;개인회원&quot;}" aria-selected="false">아이디 찾기</a></li>
                    <li id="tabBsns" role="presentation"><a href="#tabBsns" id="tab2" role="tab" onclick="toggleTab('tabBsns');" aria-controls="tabBsns" data-log-actionid-area="tab" data-log-actionid-label="tab" data-log-body="{&quot;btn_name&quot;:&quot;사업자회원&quot;}" aria-selected="true">비밀번호 찾기</a></li>
                </ul>
                
                          
                <section role="tabpanel" id="tabcontent1" aria-labelledby="tab1" class="find_result find_result_id">
                    <p class="txt_desc">아이디 찾기 결과입니다.</p>
                    <ul class="id_list">

                                  
                                    <li class="tid_box">
                                        <div class="id_info_box">
                                          
                                            <p class="id_auto_msg">일치하는 아이디가 없습니다. 이름과 아이디를 확인해주세요</p>
                                        </div>
                                    </li>               
                    </ul>
     
                    <div class="btn_box">
                        <button type="button" id="btn1" class="btn_Atype btn_a" data-log-actionid-area="login" data-log-actionid-label="btn">
                            <span>확인</span>
                        </button>
                       
      
                    </div>
                </section>
            </div>
            </div>
		</c:if> 
		
		<c:if test="${check == 0 }">
		<div class="member_wrap">
            <header class="member_header">
                
            </header>
		<div class="find_main">
                <ul class="tab" role="tablist">
                    <li id="tabPrvt" role="presentation"  class="on"><a href="/member/findId" id="tab1" role="tab" onclick="toggleTab('tabPrvt');" aria-controls="tabPrvt" data-log-actionid-area="tab" data-log-actionid-label="tab" data-log-body="{&quot;btn_name&quot;:&quot;개인회원&quot;}" aria-selected="false">아이디 찾기</a></li>
                    <li id="tabBsns" role="presentation"><a href="/member/findPw" id="tab2" role="tab" onclick="toggleTab('tabBsns');" aria-controls="tabBsns" data-log-actionid-area="tab" data-log-actionid-label="tab" data-log-body="{&quot;btn_name&quot;:&quot;사업자회원&quot;}" aria-selected="true">비밀번호 찾기</a></li>
                </ul>
                
                          
                <section role="tabpanel" id="tabcontent1" aria-labelledby="tab1" class="find_result find_result_id">
                    <p class="txt_desc">아이디 찾기 결과입니다.</p>
                    <ul class="id_list">

                                  
                                    <li class="tid_box">
                                        <div class="id_info_box">
                                            
                                            <p class="id_auto_msg">찾으시는 아이디는 <em style="color:#0b83e6;">${u_id}</em> 입니다.</p>
                                        </div>
                                    </li>               
                    </ul>
     
                    <div class="btn_box">
                        <button type="button" id="btn" class="btn_Atype btn_a" data-log-actionid-area="login" data-log-actionid-label="btn">
                            <span>로그인하기</span>
                        </button>
                
      
                    </div>
                </section>
            </div>
       </div>
		</c:if>
		
		 
	</body>
</html>