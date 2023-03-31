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
		<link type="text/css" rel="stylesheet" href="/resources/include/css/memberUpdateForm.css" />
		<link type="text/css" rel="stylesheet" href="/resources/include/css/myPageSub.css" />
	
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		
		<link rel="stylesheet" type="text/css" href="/resources/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/dist/css/bootstrap-theme.css" />
		
		<script type="text/javascript" src="/resources/include/js/jquery-3.6.2.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script type="text/javascript">
		
	$(function(){
		
		
		let getNickChk = RegExp(/^[a-zA-Zㄱ-힣0-9]{2,10}$/);
		let getPwdChk = RegExp(/^(?=.*[A-Z]|[a-z])(?=.*\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8,16}$/);
		let getEmailChk = RegExp(/^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/);
		let getPhoneChk = RegExp(/^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/);
		
		let chk1 =false ,chk2 =false, chk3=false, chk4=false, chk5=false,chk6=false, chk7=false , chk8=false;
	
		$('#u_nick').keyup(function(){
			if(getNickChk.test($(this).val())){
				//$('#nickCheck').html('사용가능합니다 중복확인 해주세요.').css('color','green');
				$('#btn2').attr("disabled", false);
				$("#btn2").attr("value","N");
				//$('#btn2').show();
				//chk2 =true;
			}else{
				//$('#nickCheck').html('2~10 자의 영문 소문자,대문자, 한글, 숫자를 입력해주세요').css('color','red').show();
				//$('#btn2').hide();
				$('#btn2').attr("disabled", true);
    			$("#btn2").attr("value","N");
				chk2 =true;
			}
			
			if($(this).val() === ''){
				//$('#nickCheck').html('');
				$('#btn2').attr("disabled", true);
				$("#btn2").attr("value","N");
				chk2 =true;
			}
		})
		
		
		
		
		
		$('#u_email').keyup(function(){
			if(getEmailChk.test($(this).val())){
				//$('#emailCheck').html('사용가능합니다. 중복확인 해주세요.').css('color','green');
				$("#btn5").attr("value","N");
				$('#btn5').attr("disabled", false);
				$('#btn4').attr("disabled", true);
				chk6=false;
			}else{
				//$('#emailCheck').html('올바른 이메일을 입력해주세요').css('color','red');
				$('#btn5').attr("disabled", true);
				$('#btn4').attr("disabled", true);
				$("#btn5").attr("value","N");
				chk6 =true;
			}
			
			if($(this).val() === ''){
				$('#emailCheck').html('');
				$('#btn5').attr("disabled", true);
				$('#btn4').attr("disabled", true);
				$("#btn5").attr("value","N");
				chk6 =true;
			}
		})
		
		$('#u_phone').keyup(function(){
			if(getPhoneChk.test($(this).val())){
				//$('#phoneCheck').html('사용가능합니다').css('color','green');
				$("#btn6").attr("value","N");
				$('#btn6').attr("disabled", false);
				//chk7 =true;
			}else{
				//$('#phoneCheck').html('올바른 휴대폰번호를 입력해주세요.(-를 포함하여 입력해주세요)').css('color','red')
				chk7 =true;
				$("#btn6").attr("value","N");
				$('#btn6').attr("disabled", true);
			}
			
			if($(this).val() === ''){
				//$('#phoneCheck').html('');
				$("#btn6").attr("value","N");
				$('#btn6').attr("disabled", true);
				chk7 =true;
			}
		})
		
		$("#u_emailCheck").keyup(function(){
    			var inputCode = $("#u_emailCheck").val();        // 입력코드    
    		    var checkResult = $("#emailCodeCheck");    // 비교 결과
    		    
    		    if(inputCode == code){                            // 일치할 경우
    		        checkResult.html("인증번호가 일치합니다.").css('color','green');
    		        checkResult.attr("class", "correct");
    		        $("#btn4").attr("value","Y");
    		        chk8=false;
    		    } else {                                            // 일치하지 않을 경우
    		        checkResult.html("인증번호를 다시 확인해주세요.").css('color','red');;
    		        checkResult.attr("class", "incorrect");
    		        chk8=true;
    		    } 
    		    if($(this).val() === ''){
    				//$('#emailCodeCheck').html('');
    				chk8=true;
    			
    			}
    		    
    		});
    		
		$("#btn2").click(function(){
			$.ajax({
				url : "/member/nickChk",
				type : "post",
				dataType : "json",
				data : {"u_nick" : $("#u_nick").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 닉네임입니다.");
						chk2 =true;
					}else if(data == 0){
						$("#btn2").attr("value","Y");
						alert("사용가능한 닉네임입니다.");
						$('#btn2').attr("disabled", true);
						chk2 =false;
					}
				}
			})
		})
		
		function daumAddress(){
			new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	 
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	 
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                 // 주소변수 문자열과 참고항목 문자열 합치기
	                    addr += extraAddr;
	                
	                } else {
	                	 addr += ' ';
	                }
	 
	                $(".zip").val(data.zonecode);
	              
	                $(".address").val(addr);
	              
	                // 커서를 상세주소 필드로 이동한다.
	                // 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
	                $(".sub_address").attr("readonly",false);
	                 $(".sub_address").focus();
		 
		        }
		    }).open();  
		}
		
		$("#btn3").click(function(){
			daumAddress();
		})
		
		$("#btn4").click(function(){
    			
    			var email = $("#u_email").val();
    			var checkBox = $("#emailCheck");        // 인증번호 입력란    
    			$.ajax({
    		        
    		        type:"GET",
    		        url:"/member/updateMailCheck?email=" + email,
    		        success:function(data){
    		        	 //console.log("data : " + data);
    		        	//checkBox.attr("disabled",false);
    		        	code = data;
    		        	alert("이메일로 인증번호를 전송하였습니다.");
    		        }
    		                
    		    });
			});
		
		$("#btn5").click(function(){
			$.ajax({
				url : "/member/emailChk",
				type : "post",
				dataType : "json",
				data : {"u_email" : $("#u_email").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 이메일입니다.");
						$('#btn4').attr("disabled", true);
						chk6 =true;
					}else if(data == 0){
						$("#btn5").attr("value","Y");
						alert("사용가능한 이메일입니다.");
						$('#btn5').attr("disabled", true);
	    				$('#btn4').attr("disabled", false);
	    				$("#btn4").attr("value","N");
						
						chk6 =false;
					}
				}
			})
		})
		
		$("#btn6").click(function(){
    			$.ajax({
					url : "/member/phoneChk",
					type : "post",
					dataType : "json",
					data : {"u_phone" : $("#u_phone").val()},
					success : function(data){
						if(data == 1){
							alert("중복된 휴대폰번호입니다.");
							chk7 =true;
						}else if(data == 0){
							$("#btn6").attr("value","Y");
							alert("사용가능한 휴대폰번호입니다.");
							$('#btn6').attr("disabled", true);
							chk7 =false;
						}
					}
				})
    		})
		
    		$("#btn").click(function(){
    				
    			
    			
    			
    			if($("#btn2").val()==="Y" && $("#btn4").val()==="Y" && $("#btn5").val()==="Y" && $("#btn6").val()==="Y"  && !chk2 && !chk3 && !chk6 && !chk7&& !chk8){
    				alert("회원수정이 완료되었습니다.");
    				$("#update").attr({
    					"method" :"post",
    					"action" : "/member/memberUpdate"
    				})
    				$("#update").submit();   				
    			}else if($("#btn2").val()==="N"){
        			alert("닉네임 중복확인해주세요");
        		}else if($("#btn4").val()==="N"){
        			alert("이메일 인증 해주세요");
        		}else if($("#btn5").val()==="N"){
        			alert("이메일 중복확인해주세요");
        		}else if($("#btn6").val()==="N"){
        			alert("휴대폰번호 중복확인해주세요");
        		}
    			
    			else{
    				alert("양식을 확인해주세요");
    				console.log(chk1,chk2,chk3,chk4,chk5,chk6,chk7);
    			}		
    		})
    	})
		</script>
	</head>
	<body>
		<form id="update">
			<input type="hidden" name="u_no" value="${memberLogin.u_no }" />
			<input type="hidden" name="u_id" value="${memberLogin.u_id }" />
			
           <!--  <div class="member_wrap" style="margin: -500px 0 50px;"> -->
           <div class="member_wrap">
                <header class="member_header">                 
                </header>
                <div class="mytmall_wrap_v2" style="width: 300px;">
    
                    <!-- 마이페이지 탭 -->
      
       
                    <!-- 마이페이지 서브메뉴 영역 -->
                    <div class="mytmall_subArea_v2"> 
    <!-- 나의정보 -->
    <div class="myinfo_wrap_v4" id="leftMemberGradeInfoArea">
    
    <div class="mytmall_menu">
        
        <div class="mytmall_sub_menu" style="border-top: 0px;">
            <h3>나의 쇼핑 관리</h3>
            <ul>
                
                <li><a>좋아요(찜) 내역</a></li>
                <li><a>구매 내역</a></li>
                <li><a>판매 내역</a></li>
                
                
            </ul>
        </div>
        
        <div class="mytmall_sub_menu">
            <h3>커뮤니티 목록</h3>
            <ul>
                <li><a>작성글 확인</a></li>
                <li><a>신고 내역</a></li>
                <li><a>이벤트</a></li>       
            </ul>
        </div>
        <div class="mytmall_sub_menu">
            <h3>회원 관리</h3>
            <ul data-log-actionid-area="my_shopping_knowledge" data-log-actionid-label="menu" data-is-ab-send="1">
                <li><a href="/member/pwdChkForm">회원수정</a></li>
                <li><a href="/member/pwdChkForm2">비밀번호 수정</a></li>
                <li><a>주소 관리</a></li>
                <li><a href="/member/pwdChkForm3">회원탈퇴</a></li>
                
            </ul>
        </div>
     
        </div>
        </div>
        </div>
    </div> 
                                          
                   <section id="sectionBsns" style="margin: -430px auto; width: 500px;">
                    <div class="find_main">
                    <ul class="tab" role="tablist" style="display: inline-flex;">
                        <li id="tabPrvt" role="presentation" class="on"><a id="tab1" role="tab" onclick="toggleTab('tabPrvt');" aria-controls="tabPrvt" data-log-actionid-area="tab" data-log-actionid-label="tab" aria-selected="false">회원수정</a></li>
                        <li id="tabBsns" role="presentation"><a href="/member/pwdChkForm2" id="tab2" role="tab" onclick="toggleTab('tabBsns');" aria-controls="tabBsns" data-log-actionid-area="tab" data-log-actionid-label="tab" aria-selected="true">비밀번호수정</a></li>
                    </ul>  
                        <fieldset class="form_box" style="margin: 0px auto 0;">
                            <legend>회원수정 폼</legend>
                            <div class="join_write">
                            <ul>
                                <li>
                                    닉네임<br />
                                    <input type="text" name="u_nick" id="u_nick" class="signcheck" placeholder="닉네임" maxlength="100" value="${ update.u_nick}" />
                                    <button type="button" id="btn2" class="signbutton" style="float:right" disabled="disabled" value="Y" >중복확인</button>
                                    <span id="nickCheck"><em style="color: #0b83e6">2~10 자의 영문 소문자,대문자, 한글, 숫자 조합</em></span> <br />
                                </li>
                                <li>
                                    이메일<br />
                                    <input type="text" name="u_email" id="u_email" class="signcheck" placeholder="이메일" maxlength="100" value="${ update.u_email}" />
                                    <button type="button" id="btn5" class="signbutton" style="float:right" disabled="disabled" value="Y" >중복확인</button>
                                </li>
                                <li>
                                    인증번호<br />
                                    <input type="text" name="u_emailCheck" id="u_emailCheck" class="signcheck" placeholder="인증번호" maxlength="100" />
                                    <button type="button" id="btn4" class="signbutton" style="float:right" disabled="disabled" value="Y" >인증받기</button><br />
                                    <span id="emailCodeCheck"></span> 
                                </li>
                                <li>
                                    휴대폰번호<br />
                                    <input type="text" name="u_phone" id="u_phone" class="signcheck" placeholder="휴대폰번호" maxlength="100" value="${ update.u_phone}" />
                                    <button type="button" id="btn6" class="signbutton" style="float:right" disabled="disabled" value="Y" >중복확인</button><br />
                                    <span id="phoneCheck"><em style="color: #0b83e6">-를 제외하고 입력해주세요.</em></span> 
                                </li>
                                <li>
                                    주소<br /><button type="button" id="btn3" class="signbutton" style="float:right">주소검색</button>
                                    <input type="text" name="zip" id="zip" class="signcheck" placeholder="우편번호" maxlength="100" readonly="readonly" value="${ update.zip}" />
                                </li>
                                <li><input type="text" name="address" id="address" class="inp" placeholder="주소" maxlength="100" style="margin-bottom: 10px" readonly="readonly" value="${ update.address}" /></li>
                                <li><input type="text" name="sub_address" id="sub_address" class="inp" placeholder="상세주소" maxlength="100" style="margin-bottom: 10px" value="${ update.sub_address}" /></li>                               
                            </ul>
                            <button type="button" id="btn" class="btn_Atype btn_a" style="border-radius: 4px;"><span>회원수정</span></button>
                            <div class="c-util c-infotip">
                                <div class="c-util__item" style="margin: 5px;">                 
                            </div> 
                            </div>
                            </div>
                        </fieldset>
                        </div>
                    </section>
                    <div id="contentWrap">
                	<a href="" style="display: block;text-align: center;margin: 220px 0;">&nbsp;</a>
            </div>
                </div>
            </form>
	</body>
</html>