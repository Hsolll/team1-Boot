<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	<link type="text/css" rel="stylesheet" href="/resources/include/css/findMember.css" />
	<script type="text/javascript">
	$(function(){
		   $(".content_wrap .page-header h1").html("아이디 찾기");
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
                <header class="member_header"></header>
                <div class="find_main">
                    <ul class="tab" role="tablist">
                        <li class="on"><a href="/member/findId" id="tab1">아이디 찾기</a></li>
                        <li><a href="/member/findPw" id="tab2">비밀번호 찾기</a></li>
                    </ul>
                    <section class="find_result find_result_id" style="margin-top: 100px;">
                        <p class="txt_desc">아이디 찾기 결과입니다.</p>
                        <ul class="id_list">
                            <li class="tid_box">
                                <div class="id_info_box">
                                    <p class="id_auto_msg">일치하는 아이디가 없습니다. 이름과 이메일을 확인해주세요</p>
                                </div>
                            </li>               
                        </ul>
                        <div class="btn_box">
                            <button type="button" id="btn1" class="btn_Atype btn_a">
                                <span>확인</span>
                            </button> 
                        </div>
                    </section>
                </div>
            </div>
        </c:if> 		
        <c:if test="${check == 0 }">
            <div class="member_wrap">
                <header class="member_header"></header>
                <div class="find_main">
                    <ul class="tab" role="tablist">
                        <li class="on"><a href="/member/findId" id="tab1">아이디 찾기</a></li>
                        <li><a href="/member/findPw" id="tab2">비밀번호 찾기</a></li>
                    </ul>           
                    <section class="find_result find_result_id" style="margin-top: 100px;">
                        <p class="txt_desc">아이디 찾기 결과입니다.</p>
                        <ul class="id_list">       
                            <li class="tid_box">
                                <div class="id_info_box">  
                                    <p class="id_auto_msg">찾으시는 아이디는 <em style="color:#0b83e6;">${u_id}</em> 입니다.</p>
                                </div>
                            </li>               
                        </ul> 
                        <div class="btn_box">
                            <button type="button" id="btn" class="btn_Atype btn_a">
                                <span>로그인하기</span>
                            </button>
                        </div>
                    </section>
                </div>
            </div>
        </c:if>	 
	</body>
</html>