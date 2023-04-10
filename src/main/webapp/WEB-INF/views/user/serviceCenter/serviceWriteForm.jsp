<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script src="/resources/include/js/common.js"></script>
	<link type="text/css" rel="stylesheet" href="/resources/include/css/communityWrite.css" />
	<script type="text/javascript">
			$(function(){
				$("#addBtn").click(function(){
					if(!chkData("#sc_title", "제목을")) return;
					else if(!chkData("#sc_content", "내용을")) return;
					else if(!chkData("#sc_pwd", "비밀번호")) return;
					else{
						
						$("#writeForm").attr({
							"method":"post",
							"enctype":"multipart/form-data",
							"action":"/serviceCenter/serviceWrite"
						});
						$("#writeForm").submit();
					}	
				});
				
				$("#cancelBtn").click(function(){
					$("#writeForm").each(function(){
						this.reset();
					});
				});
				
				$("#listBtn").click(function(){
					location.href="/serviceCenter/serviceList";
				});
				
			});
		</script>

	</head>
	<body>
		<div class="community_wite">
			<form name="writeForm" id="writeForm">
				<input type="hidden" id="u_no" name="u_no" value="${memberLogin.u_no }">
				<table>
					<colgroup>
						<col style="width:150px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<td>작성자</td>
							<td><input type="text" id="u_name" name="u_name" class="w350" value="${memberLogin.u_name }" readonly="readonly"></td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input type="text" id="sc_title" name="sc_title" class="w350" value="[${memberLogin.u_name }]고객님의 문의입니다" readonly="readonly"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea id="sc_content" name="sc_content" style="width: 500px; height: 250px; resize: none"></textarea></td>
						</tr>
						<tr>
							<td>문의글 비밀번호</td>
							<td><input type="password" id="sc_pwd" name="sc_pwd" class="w350" maxlength="20"></td>
						</tr>
						
					</tbody>
				</table>
				<div class="buttonArea">
					<button id="addBtn" type="button" class="buttonBlack">등록하기</button>
					<button id="cancelBtn" type="button" class="buttonWhite">다시하기</button>
					<button id="listBtn" type="button" class="buttonBlack">목록</button>
				</div>
			</form>
		</div>
	</body>
</html>