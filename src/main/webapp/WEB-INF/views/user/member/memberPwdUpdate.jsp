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
      <link type="text/css" rel="stylesheet" href="/resources/include/css/memberPwUpdate.css" />
   
      <!--[if lt IE 9]>
      <script src="/resources/js/html5shiv.js"></script>
      <![endif]-->
      
      <link rel="stylesheet" type="text/css" href="/resources/dist/css/bootstrap.min.css" />
      <link rel="stylesheet" type="text/css" href="/resources/dist/css/bootstrap-theme.css" />
      
      <script type="text/javascript" src="/resources/include/js/jquery-3.6.2.min.js"></script>
      <script type="text/javascript" src="/resources/include/js/common.js"></script>
      <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
      <script type="text/javascript">
      $(function(){
         let getPwdChk = RegExp(/^(?=.*[A-Z]|[a-z])(?=.*\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8,16}$/);
         let chk4 = false , chk5=false;
         $('#u_pwd').keyup(function(){           
             if(getPwdChk.test($(this).val())){
                chk4=true , chk5=true;
                console.log(chk4,chk5);
             }else{
                console.log(chk4,chk5);
                chk4= false;
             }
          })
          
          $('#u_rpwd').keyup(function(){
             
             if(getPwdChk.test($(this).val())){
                chk4,chk5=true;
                console.log(chk4,chk5);
             }
                else{
                console.log(chk4,chk5);
                chk5=false;
             }
          }) 
          
          $("#btn").click(function(){
             if(!chkData("#u_pwd","비밀번호를")){ 
                return;
             }else if(!chkData("#u_rpwd","비밀번호 확인을")){ 
                return;
             }
             else if($("#u_pwd").val()!==$("#u_rpwd").val()){
                alert("비밀번호가 일치하지 않습니다.");
                 chk5= false;
             }
             else if(chk4 && chk5){
               var result = confirm("변경 하시겠습니까?");
                 
                 if(result)
                 {
                    $("#memberPwdupdate").attr({
                      "method" :"post",
                      "action" : "/member/memberPwdUpdate"
                   })
                   $("#memberPwdupdate").submit();
                
                   alert("비밀번호가 변경되어 로그아웃됩니다."); 
                 }            
             }else {
                alert("양식을 확인해주세요");
                console.log(chk4,chk5);
             }
          })
      })
      </script>
   </head>
   <body>
      <form id="memberPwdupdate">
      <input type="hidden" name="u_no" value="${memberLogin.u_no }" />
         <div class="member_wrap"> 
               <header class="member_header"></header>
                <div class="find_main" style="height: 420px;">
                   <ul class="tab" style="height:100px;">
                      <li><a id="tab1">회원수정</a></li>
                      <li class="on"><a href="/member/pwdChkForm2" id="tab2">비밀번호수정</a></li>
                   </ul>  
                <section style="display: block;">
                   <ul class="guide">
                            <li><em style="color: #0b83e6">*비밀번호를 입력해주세요</em></li>
                    </ul>
                        <fieldset class="form_box">                  
                            <div class="join_write">
                            <ul>
                                <li>
                                    비밀번호
                                    <input type="password" name="u_pwd" id="u_pwd" class="inp" placeholder="비밀번호" maxlength="100" /><br />
                                    <span id="pwdCheck"><em>8~16자의 영문 대소문자, 숫자, 특수문자를 1가지 이상 반드시 포함하여 조합</em></span>
                                </li>
                                <li>
                                    비밀번호 확인
                                    <input type="password" name="u_rpwd" id="u_rpwd" class="inp" placeholder="비밀번호 확인" maxlength="100" /><span id="pwdCheck"></span>
                                </li>
                                
                                </ul>
                            <button type="button" id="btn" class="btn_Atype btn_a" style="border-radius: 4px;"><span>비밀번호수정</span></button>
                            <div class="c-util c-infotip">
                                <div class="c-util__item" style="margin: 5px;">                 
                            </div> 
                            </div>
                            </div>
                        </fieldset>
                    </section>
                   </div>
                </div>
            </form>
   </body>
</html>