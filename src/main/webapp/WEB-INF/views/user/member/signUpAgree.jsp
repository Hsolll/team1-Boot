<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />	
		<title>Insert title here</title>
	
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		<link type="text/css" rel="stylesheet" href="/resources/include/css/agree.css" />
	<link type="text/css" rel="stylesheet" href="/resources/include/css/signUp.css" />
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		
		<link rel="stylesheet" type="text/css" href="/resources/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/dist/css/bootstrap-theme.css" />
		
		<script type="text/javascript" src="/resources/include/js/jquery-3.6.2.min.js"></script>
		<script type="text/javascript" src="/resources/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		$(function(){
			let agree = $('#agree').is(':checked');
			let agree2 = $('#agree2').is(':checked');
			let agree3 = $('#agree3').is(':checked');
			let agree4 = $('#agree4').is(':checked');
			$("#next").click(function(){
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
			  const checkboxes 
			       = document.getElementsByName('agree');
			  
			  checkboxes.forEach((checkbox) => {
			    checkbox.checked = selectAll.checked;
			  })
			}
		</script>
	</head>
	<body>
	<form id="signUpAgree">
		<div id="container">
        <div class="join_wrap">
            <div id="join_container" role="main">
            
                <div class="join_header">                  
                </div>
                <div class="find_main">
                    <ul class="tab" role="tablist">
                        <li id="tabPrvt" role="presentation" ><a href="/login" id="tab1" role="tab" onclick="toggleTab('tabPrvt');" aria-controls="tabPrvt" data-log-actionid-area="tab" data-log-actionid-label="tab" aria-selected="false">로그인</a></li>
                        <li id="tabBsns" role="presentation" class="on"><a href="/member/signUpAgree" id="tab2" role="tab" onclick="toggleTab('tabBsns');" aria-controls="tabBsns" data-log-actionid-area="tab" data-log-actionid-label="tab" aria-selected="true">회원가입</a></li>
                    </ul> 
                <div id="complet2" class="join_content individual">
                    <p class="txt_info"><em style="color:#0b83e6;">회원/전자금융서비스 이용약관과 개인정보 수집 및 이용에 동의를 하셔야 회원가입이 가능합니다.</em></p>
                    <p class="form tm_all">
                        <input type="checkbox" name="" id="agree_all" class="chk_all big agree" onclick='selectAll(this)'>
                        <label for="agree_all">전체동의(선택제외)</label>
                    </p>
                    <div class="form tm_required">
                        <ul>
                            <li>
                                <input type="checkbox" id="agree" name="agree" class="chk agree" required="required">
                                <label for="agree">OhMyBaby 회원 이용약관 <span class="text__importance">(필수)</span></label>
                                <a href="javascript:openAgreement('http://member2.gmarket.co.kr/TermsPolicy/BuyerTermsPolicy');" class="btn_agreeview" aria-describedby="agree">약관 전체보기</a>
                            </li>
                            <li>
                                <input type="checkbox" id="agree2" name="agree" class="chk agree" required="required">
                                <label for="agree2">전자금융서비스 이용약관 <span class="text__importance">(필수)</span></label>
                                <a href="javascript:openAgreement('http://member2.gmarket.co.kr/TermsPolicy/FinanceTermsPolicy');" class="btn_agreeview" aria-describedby="agree2">약관 전체보기</a>
                            </li>
                            <li>
                                <input type="checkbox" id="agree3" name="agree" class="chk agree" required="required">
                                <label for="agree3">개인정보 수집 및 이용 <span class="text__importance">(필수)</span></label>
                                <a href="#iframe_agree" class="btn_agreeview" aria-describedby="agree3">내용보기</a>
                            </li>
                            <li>
                                <input type="checkbox" id="agree4" name="agree" class="chk agree" required="required">
                                <label for="agree4">만 14세 이상입니다 <span class="text__importance">(필수)</span></label>                            
                            </li>
                            <li style="display: none;">
                                <input type="checkbox" id="g9_join_agr" name="g9_join_agr" class="chk agree">
                                <label for="g9_join_agr">OhMyBaby 회원 이용약관 <span class="text__importance">(선택)</span></label>
                                <a href="javascript:openAgreement('https://www.g9.co.kr//Member/MemberShip/MemberShipAgreement');" class="btn_agreeview" aria-describedby="g9_join_agr">약관 전체보기</a>
                            </li>
                            <li>
                                <input type="checkbox" id="personal_info_third_party_support_agr" name="personal_info_third_party_support_agr" class="chk agree">
                                <label for="personal_info_third_party_support_agr">개인정보 제3자 제공동의 <span class="text__importance">(선택)</span></label>
                                <a href="#iframe_agree" class="btn_agreeview" aria-describedby="personal_info_third_party_support_agr">내용보기</a>
                            </li>
                            <li>
                                <input type="checkbox" id="personal_info_collect_use_agr" name="personal_info_collect_use_agr" class="chk agree">
                                <label for="personal_info_collect_use_agr">개인정보 수집 및 이용 <span class="text__importance">(선택)</span></label>
                                <a href="#iframe_agree" class="btn_agreeview" aria-describedby="personal_info_collect_use_agr">내용보기</a>
                            </li>
                            <li>
                                <input type="checkbox" id="push_agree_yn" name="push_agree_yn" class="chk agree">
                                <label for="push_agree_yn">혜택 알림 이메일, 문자 푸시 <span class="text__importance">(선택)</span></label>
                            </li>
                        </ul>
                    </div>
                </div>
    
                <p class="txt">＊고객은 동의를 거부할 권리가 있으며 동의를 거부할 경우, 사이트 가입 또는 일부 서비스 이용이 제한됩니다.</p>
    
                <div class="btn_zone agree">
                    <button type="button" id="next" class="bg_area btn_bg l1 md" style="border-radius:10px; border:0px;"><span>동의하고 회원가입</span></button>
                    <button type="button" id="cancel" class="bg_area btn_bg l2" style="border-radius:10px; border:0px;"><span>이전</span></button>
                </div>
    
                
            </div> 
            <!--// join_container -->
        </div>
    </div>
    </div>
    </form>
	</body>
</html>