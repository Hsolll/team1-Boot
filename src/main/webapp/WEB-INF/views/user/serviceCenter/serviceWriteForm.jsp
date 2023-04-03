<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script src="/resources/include/js/common.js"></script>
	
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
		<div class="contentContainer container">
			 <div class="text-center"><h2>문의 등록</h2></div> 
			
			<form name="writeForm" id="writeForm">
				<table class="table table-striped">
				<tbody>
				
					<tr hidden="true">
						<td>사용자번호</td>
						<td class="text-left"><input type="text" id="u_no" name="u_no" value="${memberLogin.u_no }" ></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td class="text-left"><input type="text" id="u_name" name="u_name" value="${memberLogin.u_name }" readonly="readonly"></td>
					</tr>
					<tr>
						<td>제목</td>
						<td class="text-left"><input type="text" id="sc_title" name="sc_title" value="[${memberLogin.u_name }]고객님의 문의입니다" readonly="readonly"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td class="text-left"><textarea id="sc_content" name="sc_content" style="width: 500px; height: 250px; resize: none"></textarea></td>
					</tr>
					<tr>
						<td>문의글 비밀번호</td>
						<td class="text-left"><input type="password" id="sc_pwd" name="sc_pwd" maxlength="20"></td>
					</tr>
					
				</tbody>
			</table>
				<div class="text-left inline">
					<button id="addBtn" type="button" class="btn btn-success">등록하기</button>
					<button id="cancelBtn" type="button" class="btn btn-success">다시하기</button>
					<button id="listBtn" type="button" class="btn btn-success">목록</button>
				</div>
			</form>
		</div>
	</body>
</html>