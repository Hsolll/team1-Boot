<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	<link type="text/css" rel="stylesheet" href="/resources/include/css/findMemberPw.css" />
	<script type="text/javascript">
		$(function(){
			$(".content_wrap .page-header h1").html("비밀번호 찾기");
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
                <header class="member_header"></header>
                <div class="find_main">
                    <ul class="tab">
                        <li><a href="/member/findId">아이디 찾기</a></li>
                        <li class="on"><a href="/member/findPw">비밀번호 찾기</a></li>
                    </ul>
                    <section style="display: block; margin-top: 10px;">
                        <ul class="guide">
                            <li>* 가입 시 입력한 <em>이름, 아이디. 이메일</em>로 비밀번호를 찾을 수 있습니다.</li>
                            <li>* 가입 시 입력한 <em>이메일</em>로 인증번호가 전송됩니다.</li>
                        </ul>
                        <fieldset class="form_box">
                            <legend></legend>
                            <ul class="join_write">
                                <li>
                                    <label for="name" class="lable_hide">이름</label><input type="text" name="u_name" id="u_name" class="inp" placeholder="이름" maxlength="100" />
                                </li>
                                <li>
                                    <label for="id" class="lable_hide">아이디</label><input type="text" name="u_id" id="u_id" class="inp" placeholder="아이디" maxlength="25" /> 
                                </li>
                                <li>
                                    <label for="email" class="lable_hide">이메일</label><input type="text" name="u_email" id="u_email" class="inp" placeholder="이메일" maxlength="25" />
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