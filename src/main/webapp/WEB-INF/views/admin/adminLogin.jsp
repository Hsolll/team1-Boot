<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>관리자 로그인</title>
		<link rel="stylesheet" href="/resources/include/dist/css/bootstrap.min.css">
    <link href="/resources/include/dist/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/include/css/style.css">
    <link rel="stylesheet" href="/resources/include/dist/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <script type="text/javascript" src="/resources/include/js/jquery-3.6.2.min.js"></script>
    <script src="/resources/include/dist/js/main-js.js"></script>
    <script src="/resources/include/dist/js/bootstrap.bundle.js"></script>
    <script type="text/javascript" src="/resources/include/js/common.js"></script>
		<style>
		    html,
		    body {
		        height: 100%;
		    }
		
		    body {
		        display: -ms-flexbox;
		        display: flex;
		        -ms-flex-align: center;
		        align-items: center;
		        padding-top: 40px;
		        padding-bottom: 40px;
		    }
	    </style>
	    
	    <script type="text/javascript">
	    	$(function(){
	    		let errorMsg = "${errorMsg}";
	    		if(errorMsg!=""){
	    			alert(erroMsg);
	    			errorMsg="";
	    		}
	    		
	    		$("#loginBtn").click(function(){
	    			if(!chkData("#a_id", "아이디를")) return;
	    			else if(!chkData("#a_pwd", "비밀번호를")) return;
	    			else{
	    				$("#loginForm").attr({
	    					"method":"post",
	    					"action":"/admin/login"
	    				});
	    				$("#loginForm").submit();
	    			}
	    		});
	    	});
	    </script>
	</head>
	<body>
		<div class="splash-container">
	        <div class="card ">
	            <div class="card-header text-center"><a href="../index.html"><img class="logo-img" src="/resources/include/dist/assets/images/logo.png" alt="logo"></a><span class="splash-description">Please enter your user information.</span></div>
	            <div class="card-body">
	                <form id="loginForm">
	                    <div class="form-group">
	                        <input class="form-control form-control-lg" id="a_id" name="a_id" type="text" placeholder="ID" autocomplete="off">
	                    </div>
	                    <div class="form-group">
	                        <input class="form-control form-control-lg" id="a_pwd" name="a_pwd" type="password" placeholder="Password">
	                    </div>
	                    <!-- 
	                    <div class="form-group">
	                        <label class="custom-control custom-checkbox">
	                            <input class="custom-control-input" type="checkbox"><span class="custom-control-label">Remember Me</span>
	                        </label>
	                    </div> -->
	                    <button type="button" class="btn btn-primary btn-lg btn-block" id="loginBtn">Sign in</button>
	                </form>
	            </div>
	        </div>
	    </div>
	</body>
</html>