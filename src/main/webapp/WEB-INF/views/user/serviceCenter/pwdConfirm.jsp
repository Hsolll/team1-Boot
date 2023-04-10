<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

		<script src="/resources/include/js/common.js"></script>
		
		<script src="/resources/include/js/servicePwd.js"></script>
		
		<link rel="stylesheet" href="/resources/include/css/servicePwd.css">
	</head>
	<body>
		<div class="contentContainer container">
			<form name="detailForm" id="detailForm">
				<input type="hidden" id="sc_no" name="sc_no" value='${data.sc_no }'>
				<input type="hidden" id="as_no" name="as_no" value='${data.as_no }'>
			</form>
			<div class="text-center">
				<div class="form-container">
					<div class="pwdContainer">
						<form name="pwdForm" id="pwdForm">
							<input type="hidden" name="sc_no" value=${data.sc_no }>
							PASSWORD   <input type="password" id="sc_pwd" name="sc_pwd" maxlength="20">
						</form>
						<div class="text-center btn-group">
							<input type="button" value="확인하기" id="chkBtn" class="btn btn-default">
							<input type="button" value="취소하기" id="cancelBtn" class="btn btn-default">
							<input type="button" value="목록보기" class="btn btn-default listBtn">
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>