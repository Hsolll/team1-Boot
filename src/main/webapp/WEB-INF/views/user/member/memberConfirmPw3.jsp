<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	<link type="text/css" rel="stylesheet" href="/resources/include/css/comfirmPw.css" />
	<script type="text/javascript">
		$(function(){
			$(".content_wrap .page-header h1").html("회원 탈퇴").css("font-size","36px");;
            let getPwdChk = RegExp(/^(?=.*[A-Z]|[a-z])(?=.*\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8,16}$/);
            let chk4 = false , chk5=false;
            $('#u_pwd').keyup(function(){
                if(getPwdChk.test($(this).val())){
                    chk4= false;
                }else{
                    $('#pwdCheck').html('8~16자의 영문 대소문자, 숫자, 특수문자를 입력해주세요').css('color','red');
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
                    $('#pwdCheck').html('비밀번호 불일치').css('color','red');
                    chk5= false;
                }else{
                    $('#pwdCheck').html('비밀번호 일치').css('color','green');
                    $.ajax({
                        url : "/member/pwdChk",
                        type : "post",
                        dataType : "json",
                        data : {"u_pwd" : $("#u_pwd").val() , "u_no" : $("#u_no").val()},
                        success : function(data){
                            if(data == 1){
                                chk4=true;	     				
                            }else if(data == 0){
                                chk4 =false;
                            }
                        }
                    })
                }
            })

            $("#btn").click(function(){
                if(!chkData("#u_pwd","비밀번호를")) return;
                else if(!chkData("#u_rpwd","비밀번호 확인을")) return;
                else if(chk4){
                    $("#PwdCheck").attr({
                        "method" :"post",
                        "action" : "/member/deleteForm"
                    })
                    $("#PwdCheck").submit(); 
                }else if(!chk4){
                    alert("입력하신 비밀번호를 확인해주세요");
                }
            })
        })
	</script>
	</head>
	<body>
        <form id="PwdCheck" class="section section-login">
            <input type="hidden" name="u_no" id="u_no" value="${memberLogin.u_no }" />
            <input type="hidden" name="u_name" value="${memberLogin.u_name }" />
            <input type="hidden" name="u_id" id="u_id" value="${update.u_id }" />
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="margin:0;">
                <div id="ux-container" class="page-confirm-password">
                    <div class="header">
                        <h1 class="title" style="text-align: center;">비밀번호 입력</h1>
                        <p class="direction">
                            
                            ${memberLogin.u_name} ( <em style="color:#0b83e6;">${memberLogin.u_id}</em> ) 님,<br>
                            
                            본인 확인을 위해 비밀번호를 입력해주세요.</p>
                    </div>
                    <div class="content">
                        <label class="field">
                            <span class="section-label">비밀번호</span>                        
                            <span class="role-holder holds-tbox"><input id="u_pwd" name="u_pwd" type="password" class="tbox" placeholder="비밀번호" /></span>
                        </label>
                        <label class="field">
                            <span class="section-label">비밀번호확인</span>                        
                            <span class="role-holder holds-tbox"><input id="u_rpwd" name="u_rpwd" type="password" class="tbox" placeholder="비밀번호확인" title="비밀번호 입력" data-click-id="comm_web_confirmpw_ko_pw"></span>
                        </label>                    				
                        <div class="field btn-field">					
                            <input type="button" id="btn" class="btn btn-purple btn-wide" value="확인" data-click-id="comm_web_confirmpw_ko_confirm" style="background:#baac9a; color:#fff; cursor: pointer; text-align: center; outline: none;">
                        </div>           		
                    </div>
                </div>
            </div>
        </form>	
    </body>
</html>