<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
   <head>
      <title>replyServiceCenterWriteForm</title>
      
      <script src="/resources/vendor/jquery/jquery-3.3.1.min.js"></script>
      <script type="text/javascript">
      		$(function(){
      			$(".dashboard-wrapper .page-header h1").html("문의관리");
      			$("#replyBtn").click(function(){
    				$("#replyForm").attr({
    					"method":"post",
    					"action":"/admin/serviceCneterInsert"
    				});
    				$("#replyForm").submit();		
    			});
      			$("#resetBtn").click(function(){
					location.href = "/admin/serviceCenterList";
				});
      		});
      		
    			
    		
      </script>
   </head>
   <body>
   		<div>
   		
   		
   			<%-- 댓글 입력 화면 --%>
	
		 <form id="replyForm" name="replyForm">
		 	<input type="hidden" id="sc_no" name=sc_no value="${serviceDetail.sc_no}">
		 	<input type="hidden" id="sc_pwd" name=sc_pwd value="${serviceDetail.sc_pwd}">
			  <div class="panel panel-default rowTable">
			  	<table>
			  		
			  		<tbody>
			  				<tr>
								<th>글번호</th> 
								<td><input type="text" value="${serviceDetail.sc_no}" readonly="readonly" /></td>
								<th>작성일</th> 
								<td>${serviceDetail.sc_created_at}</td> 
							</tr>
							<tr>
								<th>작성자</th>
								<td colspan="3"><input type="text" value="${serviceDetail.u_name}" readonly="readonly" /></td>
							</tr>
							<tr>
								<th>글제목</th>
								<td colspan="3">
									<input type="text" class="form-control" name="as_title" id="as_title" value="ㄴ[답글] [${serviceDetail.u_name}]고객님의 문의입니다" readonly="readonly" />
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan="3">
									<textarea class="form-control" name="as_content" rows="8"></textarea>
								</td>
							</tr>
			  		</tbody>
			  	</table>
			  </div>
		</form>
		<div class="btnArea">
			<button id="replyBtn"type="button" class="btn btn-dark">저장</button>
			<button id="resetBtn"type="button" class="btn btn-dark">취소</button>
		</div>
   		</div>
   		
   </body>
</html>