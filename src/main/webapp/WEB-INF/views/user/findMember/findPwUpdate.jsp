<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	<link type="text/css" rel="stylesheet" href="/resources/include/css/findMemberPw.css" />
	<script type="text/javascript">
		$(function(){
			$(".content_wrap .page-header h1").html("비밀번호 찾기");
            let getPwdChk = RegExp(/^(?=.*[A-Z]|[a-z])(?=.*\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8,16}$/);
            let chk4=false , chk5=false, chk8=false;
            $('#u_pwd').keyup(function(){
                if(getPwdChk.test($(this).val())){

                }else{
                    chk4= false;
                }
                if($(this).val() === ''){
                    $('#pwdCheck').html('');
                    chk4= false;
                }
            })
            
            $('#u_rpwd').keyup(function(){
                getPwdChk.test($(this));
                if($(this).val() === ''){
                    $('#pwdCheck').html('');
                    chk5= false;
                }
                if($("#u_pwd").val()!==$("#u_rpwd").val() && $("#u_pwd").val()!==''){
                    chk5= false;
                }else{
                    chk4 = true ,chk5= true;
                }
            })
            var email = $("#u_email").val();
            var checkBox = $("#emailCheck");        // 인증번호 입력란    
            $.ajax({
                type:"GET",
                url:"/member/findPwMailCheck?email=" + email,
                success:function(data){
                    code = data;
                    alert("이메일로 인증번호를 전송하였습니다.");
                }
            });

            $("#u_emailCheck").keyup(function(){
                var inputCode = $("#u_emailCheck").val();        // 입력코드    
                var checkResult = $("#emailCodeCheck");    // 비교 결과
                if(inputCode == code){                            // 일치할 경우
                    checkResult.html("인증번호가 일치합니다.").css('color','green');
                    checkResult.attr("class", "correct");
                    chk8=true;
                } else {                                            // 일치하지 않을 경우
                    checkResult.html("인증번호를 다시 확인해주세요.").css('color','red');;
                    checkResult.attr("class", "incorrect");
                    chk8=false;
                } 
                if($(this).val() === ''){
                    $('#emailCodeCheck').html('');
                    chk8=false;
                }
            });
            
            $("#btn").click(function(){
                if(chk4 && chk5 && chk8){
                    $("#findPwUpdate").attr({
                        "method" :"post",
                        "action" : "/member/findPwUpdate"
                    })
                    $("#findPwUpdate").submit();
                    alert("비밀번호가 재설정 되었습니다.");
                }else{
                    alert("양식을 확인해주세요");
                    console.log(chk4,chk5,chk8);
                }
            })
        })
	</script>
	</head>
	<body>
        <c:if test="${check == 0 }">
            <form id="findPwUpdate">
                <div class="member_wrap">
                    <header class="member_header"></header>
                    <div class="find_main" style="height: 625px;">
                        <ul class="tab">
                            <li><a href="/member/findId">아이디 찾기</a></li>
                            <li class="on"><a href="/member/findPw">비밀번호 찾기</a></li>
                        </ul>          
                        <section id="sectionBsns" style="display: block;">
                            <ul class="guide">
                                <li><em>*</em> 가입 시 입력한 <em>이메일</em>로 인증번호가 전송되었습니다.</li>
                                <li><em>*</em> 인증번호 확인 후 비밀번호를 재설정 해주세요.</li>
                                <li><em>* 8~16자의 영문 대소문자, 숫자, 특수문자를 입력해주세요</em></li>
                            </ul>
                            <fieldset class="form_box">
                                <legend></legend>
                                <ul class="join_write">
                                    <li>
                                        <label for="email" class="lable_hide">이메일</label><input type="text" name="u_email" id="u_email" class="inp" value="${u_email }" readonly="readonly" />
                                    </li>
                                    <li>
                                        <label for="emailcode" class="lable_hide">인증번호</label><input type="text" name="u_emailCheck" id="u_emailCheck" class="inp" placeholder="인증번호" maxlength="25" /> <span id="emailCodeCheck"></span><br />
                                    </li>
                                    <li>
                                        <label for="pwd" class="lable_hide">비밀번호</label><input type="password" name="u_pwd" id="u_pwd" class="inp" placeholder="비밀번호" maxlength="25" />
                                    </li>
                                    <li>
                                        <label for="pwd" class="lable_hide">비밀번호 확인</label><input type="password" name="u_rpwd" id="u_rpwd" class="inp" placeholder="비밀번호확인" maxlength="25" /><span id="pwdCheck"></span>
                                    </li>                                    
                                </ul>
                                <button type="button" id="btn" class="btn_Atype btn_a"><span>확인</span></button>
                            </fieldset>
                        </section>
                    </div>
                </div>
            </form>
        </c:if>
	</body>
</html>