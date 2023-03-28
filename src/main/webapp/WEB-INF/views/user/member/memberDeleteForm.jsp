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
		<link type="text/css" rel="stylesheet" href="/resources/include/css/delete.css" />
	
		<!--[if lt IE 9]>
		<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		
		<link rel="stylesheet" type="text/css" href="/resources/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/dist/css/bootstrap-theme.css" />
		
		<script type="text/javascript" src="/resources/include/js/jquery-3.6.2.min.js"></script>
		<script type="text/javascript" src="/resources/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function(){
				
				$("#btn").click(function(){
					alert("회원탈퇴 되었습니다. 이용해주셔서 감사합니다.");
								$("#u_status").attr('value','NUSING');
								$("#memberDelete").attr({
			    					"method" :"post",
			    					"action" : "/member/memberDelete"
			    				})
			    				$("#memberDelete").submit();
				})
			})
		</script>
	</head>
	<body>
	<form id="memberDelete">
	<input type="hidden" name="u_no" value="${memberLogin.u_no }" />
	<input type="hidden" id="u_status" name="u_status" value="${memberLogin.u_status }" />
            <div id="container">
            <div class="join_wrap">
                <div id="join_container" role="main">
                    <div class="join_header">
                        <h1>회원탈퇴</h1>                  
                    </div>
                    <div id="complet2" class="join_content individual">
                        <h1 style="margin-bottom: 30px">OhMyBaby를 탈퇴하신다니 아쉬워요.</h1>
                        <p> 
                            탈퇴하시려는 이유를 작성해 주세요. 더 나은 서비스를 위해 개선하겠습니다.
                        </p>
                        <div class="form tm_required">
                            <ul>
                                <li>
                                    <input type="checkbox" id="agree" name="agree" class="chk agree">
                                    <label for="agree">[편의성] 웹사이트 또는 앱 이용하는데 불편해서</label>
                                    
                                </li>
                                <li>
                                    <input type="checkbox" id="agree2" name="agree" class="chk agree">
                                    <label for="agree2">[결제] 결제과정이 불편하거나 복잡해서</label>
                                    
                                </li>
                                <li>
                                    <input type="checkbox" id="agree3" name="agree" class="chk agree">
                                    <label for="agree3">[고객센터] 불편사항에 대한 처리 응대가 마음에 안들어서</label>
                                   
                                </li>
                                <li>
                                    <input type="checkbox" id="agree4" name="agree" class="chk agree">
                                    <label for="agree4">[상품] 내가 찾는 상품이 없거나 가격이 비싸서</label>                            
                                </li>
                                <li>
                                    <input type="checkbox" id="g9_join_agr" name="g9_join_agr" class="chk agree">
                                    <label for="g9_join_agr">기타 </label>      
                                </li>
                                <li>
                                    
                                     <textarea id="result" placeholder="기타 사유를 입력해주세요"></textarea>
                                </li>
                                
                            </ul>
                        </div>
                    </div>
        
                    <p class="txt">＊그동안 OhMyBaby를 이용해주셔서 감사합니다. *</p>
        
                    <div class="btn_zone agree">
                        <button type="button" id="btn" class="bg_area btn_bg l1 md" style="border-radius:10px; border:0px;"><span>회원탈퇴</span></button>
                        <button type="button" id="btn1" class="bg_area btn_bg l2" style="border-radius:10px; border:0px;"><span>이전</span></button>
                    </div>
        
                    
                </div> 
                <!--// join_container -->
            </div>
        </div>
        </form>
	</body>
</html>