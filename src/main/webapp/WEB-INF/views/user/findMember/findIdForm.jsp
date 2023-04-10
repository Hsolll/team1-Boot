<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	<link type="text/css" rel="stylesheet" href="/resources/include/css/findMember.css" />
	<script type="text/javascript">
	$(function(){
		   $(".content_wrap .page-header h1").html("아이디 찾기");
           $("#btn").click(function(){
               if($("#u_name").val()===''){
                   alert("이름을 입력해주세요");
               }else if($("#u_email").val()===''){
                   alert("이메일을 입력해주세요");
               }else{
                   $("#findId").attr({
                       "method" :"post",
                       "action" : "/member/findId"
                   })
                   $("#findId").submit();
               }
           })
       })
	</script>
	</head>
	<body>
        <form id="findId">
            <div class="member_wrap">
                <header class="member_header"></header>
                <div class="find_main">
                    <ul class="tab" role="tablist">
                        <li class="on"><a href="/member/findId" id="tab1">아이디 찾기</a></li>
                        <li><a href="/member/findPw" id="tab2">비밀번호 찾기</a></li>
                    </ul>
                    <section style="display: block;">
                        <ul class="guide">
                            <li style="padding-top: 35px;"><em>*</em> 가입 시 입력한 <em>이름, 이메일</em>로 아이디를 찾을 수 있습니다.</li>
                        </ul>
                        <fieldset class="form_box">
                            <legend></legend>
                            <ul class="join_write">
                                <li>
                                    <label for="name" class="lable_hide">이름</label><input type="text" name="u_name" id="u_name" class="inp" placeholder="이름" maxlength="100" />
                                </li>
                                <li>
                                    <label for="email" class="lable_hide">이메일</label><input type="text" name="u_email" id="u_email" class="inp" placeholder="이메일" maxlength="25" />
                                </li>
                            </ul>
                            <button type="button" id="btn" class="btn_Atype btn_a"><span>확인</span></button>
                        </fieldset>
                    </section>
                </div>
            </div>
        </form>
	</body>
</html>