<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<script type="text/javascript">
			$(function(){
				$("#addBtn").click(function(){
					if(!chkData("#f_title", "제목을")) return;
					else if(!chkData("#f_content", "내용을")) return;
					else{
						
						$("#insertForm").attr({
							"method":"post",
							"enctype":"multipart/form-data",
							"action":"/admin/faqInsert"
						});
						$("#insertForm").submit();
					}	
				});
				
				$("#cancelBtn").click(function(){
					$("#intForm").each(function(){
						this.reset();
					});
				});
				
				$("#listBtn").click(function(){
					location.href="http://localhost:8080/admin/faqList"
				})
				
			});
		</script>
		
		<style>
			div.text-left{
				margin-top: 50px;
			}
		</style>
	</head>
	<body>
		<div class="contentContainer container">
			 <div class="text-center"><h2>글 등록</h2></div> 
			
			<form name="insertForm" id="insertForm">
				<table class="table table-striped">
				<tbody>
					<tr>
						<td>작성자</td>
						<td class="text-left"><input type="text" id="a_no" name="a_no" value="${adminLogin.a_no }"></td>
					</tr>
					<tr>
						<td>제목</td>
						<td class="text-left"><input type="text" id="f_title" name="f_title"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td class="text-left"><textarea id="f_content" name="f_content" style="width: 500px; height: 250px;"></textarea></td>
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