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
      			$("#replyBtn").click(function(){
    				$("#replyForm").attr({
    					"method":"post",
    					"action":"/admin/serviceCneterInsert"
    				});
    				$("#replyForm").submit();		
    			});
      		});
      		
    			
    		
      </script>
   </head>
   <body>
   		<div class="container">
   		
   		
   			<%-- 댓글 입력 화면 --%>
	
		 <form id="replyForm" name="replyForm">
		 	<input type="hidden" id="sc_no" name=sc_no value="${serviceDetail.sc_no}">
		 	<input type="hidden" id="sc_pwd" name=sc_pwd value="${serviceDetail.sc_pwd}">
			  <div class="panel panel-default rowTable">
			  	<table class="table">
			  		<colgroup>
			  			<col style="width: 14%">
			  			<col>
			  		</colgroup>
			  		<tbody>
			  			<tr>
			  				<th scope="row">제목</th>
			  				<td>
			  					<input type="text" class="form-control" name="as_title" id="as_title" value="ㄴ[답글] [${serviceDetail.u_name}]고객님의 문의입니다" readonly="readonly" />
			  				</td>
			  			</tr>
			  			<tr>
			  				<th scope="row">댓글내용</th>
			  				<td>
			  					<textarea name="as_content" id="as_content" class="form-control" rows="3" ></textarea>
			  				</td>
			  			</tr>
			  		</tbody>
			  	</table>
			  </div>
		</form>
		<div class="btnArea">
			<button id="replyBtn"type="button" class="btn btn-dark">저장</button>
		</div>
   		</div>
   		
   </body>
</html> 