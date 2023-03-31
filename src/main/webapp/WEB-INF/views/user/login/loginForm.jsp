<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<link type="text/css" rel="stylesheet" href="/resources/include/css/findMember.css" />
<script src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

		<script type="text/javascript">
		 
		$(function(){
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
                
            </header>
            <div class="find_main">
                <ul class="tab" role="tablist">
                    <li id="tabPrvt" role="presentation"  class="on"><a href="/login" id="tab1" role="tab" onclick="toggleTab('tabPrvt');" aria-controls="tabPrvt" data-log-actionid-area="tab" data-log-actionid-label="tab" aria-selected="false">로그인</a></li>
                    <li id="tabBsns" role="presentation"><a href="/member/signUpAgree" id="tab2" role="tab" onclick="toggleTab('tabBsns');" aria-controls="tabBsns" data-log-actionid-area="tab" data-log-actionid-label="tab" aria-selected="true">회원가입</a></li>
                </ul>
                          
                <section id="sectionBsns" style="display: block;">
                    <ul class="seller_guide">
                        <li><em>아이디, 비밀번호</em> 를 입력해주세요.</li>
                    </ul>
                    <fieldset class="form_box">
                        <legend></legend>
                        <ul class="join_write">
                            <li>
                                <label for="etprsMemNm" class="lable_hide">아이디</label><input type="text" name="u_id" id="u_id" class="inp" placeholder="아이디" maxlength="100" />
                            </li>
                            <li>
                                <label for="etprsMemIdntyNo" class="lable_hide">비밀번호</label><input type="password" name="u_pwd" id="u_pwd" class="inp" placeholder="비밀번호" maxlength="25" />
                            </li>
                        </ul>
                        <button type="button" id="btn" class="btn_Atype btn_a" style="border-radius: 4px;"><span>로그인</span></button>

                        <div class="c-util c-infotip">
                            <div class="c-util__item" style="margin: 5px;">
                                
        
                                <div id="divAutoLoginTooltip" class="c-tooltip-wrap">
                                       
                                </div>
                            <div class="c-util__item">
                                <a href="/member/findId" class="c-util__link" data-log-actionid-label="id_find">아이디찾기</a>
                                <a href="/member/findPw" class="c-util__link" data-log-actionid-label="password_find">비밀번호찾기</a>
                            </div>
                        </div> 
						</div>
                        
                    </fieldset>
                </section>
            </div>
        </div>
        </form>
		<%-- <!-- 네이버 로그인 창으로 이동 -->
			<div id="naver_id_login" style="text-align:center"><a href="${url}">
			<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
			<br>
		<!-- 네이버 로그인 버튼 생성 위치 -->
	<div id="naverIdLogin"></div> --%>
    <c:choose>
		<c:when test="${sessionId != null}">
			<h2> 네이버 아이디 로그인 성공하셨습니다!! </h2>
			<h3>'${sessionId}' 님 환영합니다! </h3>
            	<h3><a href="logout">로그아웃</a></h3>
 
		</c:when>
		<c:otherwise>
			
				
			
			<!-- 네이버 로그인 창으로 이동 -->
			<div id="naver_id_login" style="text-align:center"><a href="${url }">
			<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
			<br>
		
		</c:otherwise>
	</c:choose>

		
	</body>
	<!-- <script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "wWkm_Ss309bCsmqi9WxK",
  			// 본인의 Client ID로 수정, 띄어쓰기는 사용하지 마세요.
			callbackUrl: "http://localhost:8080/callback",
  			// 본인의 callBack url로 수정하세요.
			isPopup: true,
			loginButton: {color: "white", type: 3, height: 60}
  			// 네이버 로그인버튼 디자인 설정. 한번 바꿔보세요:D
		}
	);
naverLogin.init();
</script> -->

</html>