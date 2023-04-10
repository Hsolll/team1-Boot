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
   
      <link rel="shortcut icon" href="/resources/image/icon.png" />
      <link rel="apple-touch-icon" href="/resources/image/icon.png" />
   
      <!--[if lt IE 9]>
      <script src="/resources/js/html5shiv.js"></script>
      <![endif]-->
      
      <link rel="stylesheet" type="text/css" href="/resources/dist/css/bootstrap.min.css" />
      <link rel="stylesheet" type="text/css" href="/resources/dist/css/bootstrap-theme.css" />
      
      <script type="text/javascript" src="/resources/include/js/jquery-3.6.2.min.js"></script>
      <script type="text/javascript" src="/resources/dist/js/bootstrap.min.js"></script>
      <script type="text/javascript">
       $(function(){
          $.ajax({
               url : "/socialChk",
               type : "post",
               dataType : "text",
               data : {"u_email" : $("#u_email").val()},
               success : function(data){
                  if(data == 'N'){
                     $("#naverLogin").attr({
                          "method" :"post",
                          "action" : "/socialLogin"
                       })
                       $("#naverLogin").submit();
                  }else if(data == 'K'){
                     alert("카카오 로그인 회원입니다. 카카오 로그인을 이용해주세요.");
                     location.href="/login"
                  }else if(data =="U"){
                     alert("일반회원입니다 일반로그인 해주세요.");
                     location.href="/login"
                  }else{
                     alert("추가정보 입력 후 회원가입이 가능합니다.");
                     location.href="/member/naverSignUp"
                  }
               }
            })
       })
      </script>
   </head>
   <body>
      <form id="naverLogin">
         <input type="hidden" id="u_email" name="u_email" value="${socialLogin }"/>
      </form>
   </body>
</html>