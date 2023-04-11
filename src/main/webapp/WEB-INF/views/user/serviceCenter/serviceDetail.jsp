<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<link type="text/css" rel="stylesheet" href="/resources/include/css/community.css" />
		<script>
			$(function(){
				
				$(".listBtn").click(function(){
					location.href="/serviceCenter/serviceList";
				});
				
				$("#updateButton").click(function(){
					
					$("#update").attr({
						"action":"/serviceCenter/serviceUpdateForm"
					});
					$("#update").submit();
				});
				
				$("#delButton").click(function(){
					if(confirm("해당 문의를 삭제하시겠습니까?")){
						$("#update").attr({
							"method":"get",
							"action":"/serviceCenter/serviceDelete"
						});
						$("#update").submit();						
					}
				});
			});
			
		</script>
	</head>
	<body>
		<div style="position:relative;">
			<div class="detail_table mt30">
				<c:set var="member" value="${memberLogin.u_no }"/>
				<c:choose>
					<c:when test="${memberLogin.u_no eq serviceDetail.u_no }">
						<div class="buttonList tr">
							<button type="button" id="updateButton" class="buttonWhite">EDIT</button>
							<button type="button" id="delButton" class="buttonWhite">DELETE</button>
							<button type="button" class="buttonBlack listBtn">LIST</button>
						</div>
					</c:when>
					<c:otherwise>
						<div class="buttonList tr" style="display:block;">
							<button type="button" class="buttonBlack listBtn">LIST</button>
						</div>
					</c:otherwise>
				</c:choose>
				<form id="update" name="update" >
					<input type="hidden" id="sc_no" name="sc_no" value=${serviceDetail.sc_no }>
				</form>
				<table class="table table-bordered thBgGray">
					<colgroup>
					</colgroup>	
					<thead>
						<tr class="text-center">
							<th>${serviceDetail.sc_title }</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="border:0;">
								<div class="detail_date">
									<span><em>Date : </em>${serviceDetail.sc_created_at }</span>
								</div>
								<div>
									<span><em>Name : </em>${serviceDetail.u_name }</span>
									<span><em>Hits : </em>${serviceDetail.sc_readcnt }</span>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="detail_content">
									<p>${serviceDetail.sc_content }</p>
								</div>
							</td>
						</tr>
					</tbody>
				</table>	
			</div>
		</div>
	</body>
</html>