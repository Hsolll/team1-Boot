<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	<link type="text/css" rel="stylesheet" href="/resources/include/css/Member.css" />
    <script type="text/javascript">
      $(function(){
    	   $(".content_wrap .page-header h1").html("로그인");
           let errorMsg= "${errorMsg}";
           if(errorMsg!=""){
               alert(errorMsg);
               errorMsg ="";
           }
           $("#btn1").click(function(){
               location.href="/member/signUpAgree";
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
	        <div class="member_wrap">
	            <header class="member_header">
	                <div id="bannerSec"><img width="480" height="161" src='/resources/images/loginmain.png' alt="banner"></div>
	            </header>
	            <div class="find_main">
	                <ul class="tab" role="tablist">
	                    <li class="on"><a href="/login" id="tab1">로그인</a></li>
	                    <li><a href="/member/signUpAgree" id="tab2">회원가입</a></li>
	                </ul>
	                <section style="display: block;">
	                    <ul class="guide">
	                        <li><em>* 아이디, 비밀번호</em> 를 입력해주세요.</li>
	                    </ul>
	                    <fieldset class="form_box">
	                        <legend></legend>
	                        <ul class="join_write">
	                            <li>
	                                <label for="id" class="lable_hide">아이디</label><input type="text" name="u_id" id="u_id" class="inp" placeholder="아이디" maxlength="100" />
	                            </li>
	                            <li>
	                                <label for="pw" class="lable_hide">비밀번호</label><input type="password" name="u_pwd" id="u_pwd" class="inp" placeholder="비밀번호" maxlength="25" />
	                            </li>
	                        </ul>
	                        <button type="button" id="btn" class="btn_Atype btn_a" style="border-radius: 4px;"><span>로그인</span></button>
	                        <div class="c-util c-infotip">
	                            <div class="c-util__item">
	                                <a href="/member/findId" class="c-util__link">아이디찾기</a>
	                                <a href="/member/findPw" class="c-util__link">비밀번호찾기</a>
	                            </div> 
	                        </div>
	                    </fieldset>
	                    <!-- 소셜 로그인 창으로 이동 -->
	                    <div id="naver_id_login" style="text-align:center; margin-top: 15px;">
	                        <a href="${url }"><img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a>
	                        <a href="${urlKakao}"><img width="223" style="height: 50px;" src='/resources/images/kakao_login_medium_narrow.png'></a>
	                    </div>
	                </section>
	            </div>
	        </div>
	    </form>
   </body>   
</html>