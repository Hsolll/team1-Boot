<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	<link type="text/css" rel="stylesheet" href="/resources/include/css/agree.css" />
	<link type="text/css" rel="stylesheet" href="/resources/include/css/signUp.css" />
    <script type="text/javascript">
	   $(function(){
		   $(".content_wrap .page-header h1").html("약관 동의");		   
	       let agree = $('#agree').is(':checked');
	       let agree2 = $('#agree2').is(':checked');
	       let agree3 = $('#agree3').is(':checked');
	       let agree4 = $('#agree4').is(':checked');
	       $("#btn").click(function(){
	           if($("#agree").is(":checked") == true && $("#agree2").is(":checked") == true && $("#agree3").is(":checked") == true && $("#agree4").is(":checked") == true ){
	               $("#signUpAgree").attr({
	                   "method" :"post",
	                   "action" : "/member/signUpForm"
	               })
	               $("#signUpAgree").submit();
	           }else{
	               alert("필수 사항을 모두 선택해주세요.");
	           }
	       })
	
	       $("#cancel").click(function(){
	           location.href="/login";
	       })
	   })
	
	   function selectAll(selectAll)  {
	       const checkboxes = document.getElementsByName('agree');
	
	       checkboxes.forEach((checkbox) => {
	           checkbox.checked = selectAll.checked;})
	       }
    </script>
	</head>
    <body>
        <form id="signUpAgree">
            <div id="container_agree">
                <div class="join_wrap" style="margin-bottom: -210px;">
                    <div id="join_container">                       
                        <header class="member_header">
	                		<div id="bannerSec" style="margin-left: 60px;"><img width="480" height="161" src='/resources/images/loginmain.png' alt="banner"></div>
	            		</header>
                        <div class="find_main">
                            <ul class="tab">
                                <li><a href="/login" id="tab1">로그인</a></li>
                                <li class="on"><a href="/member/signUpAgree" id="tab2">회원가입</a></li>
                            </ul>
                            <div id="complet2" class="join_content individual">
                                <p class="txt_info"><em style="color:#0b83e6;">* 개인정보 수집 및 이용에 동의를 하셔야 회원가입이 가능합니다.</em></p>
                                <p class="form tm_all">
                                    <input type="checkbox" name="agree_all" id="agree_all" class="chk_all big agree" onclick='selectAll(this)'>
                                    <label for="agree_all">전체동의(선택제외)</label>
                                </p>
                                <div class="form tm_required">
                                    <ul>
                                        <li>
                                            <input type="checkbox" id="agree" name="agree" class="chk agree" required="required">
                                            <label for="agree">OhMyBaby 회원 이용약관 <span class="text__importance">(필수)</span></label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="agree2" name="agree" class="chk agree" required="required">
                                            <label for="agree2">전자금융서비스 이용약관 <span class="text__importance">(필수)</span></label>            
                                        </li>
                                        <li>
                                            <input type="checkbox" id="agree3" name="agree" class="chk agree" required="required">
                                            <label for="agree3">개인정보 수집 및 이용 <span class="text__importance">(필수)</span></label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="agree4" name="agree" class="chk agree" required="required">
                                            <label for="agree4">만 14세 이상입니다 <span class="text__importance">(필수)</span></label>                            
                                        </li>
                                        <li>
                                            <input type="checkbox" id="personal_info_third_party_support_agr" name="personal_info_third_party_support_agr" class="chk agree">
                                            <label for="personal_info_third_party_support_agr">개인정보 제3자 제공동의 <span class="text__importance">(선택)</span></label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="personal_info_collect_use_agr" name="personal_info_collect_use_agr" class="chk agree">
                                            <label for="personal_info_collect_use_agr">개인정보 수집 및 이용 <span class="text__importance">(선택)</span></label>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="push_agree_yn" name="push_agree_yn" class="chk agree">
                                            <label for="push_agree_yn">혜택 알림 이메일, 문자 푸시 <span class="text__importance">(선택)</span></label>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <p class="txt" style="margin: 0 15px 0 15px;"><em style="color:#0b83e6;">＊고객은 동의를 거부할 권리가 있으며 동의를 거부할 경우, 사이트 가입 또는 일부 서비스 이용이 제한됩니다.</em></p>
                            <div class="btn_zone agree">
                                <button type="button" id="btn" class="btn_Atype btn_a" style="border-radius: 4px; width: 400px;"><span>동의하고 회원가입</span></button>
                            </div>
                        </div> 
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>