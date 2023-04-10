<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<link type="text/css" rel="stylesheet" href="/resources/include/css/community.css" />
		<script>
			$(function(){
				
				$("#listBtn").click(function(){
					location.href="/serviceCenter/serviceList";
				});
				
				$("#updateBtn").click(function(){
					$("#form_data").attr({
						"action":"/serviceCenter/serviceUpdateForm"
					});
					$("#form_data").submit();
				});
				
				$("#deleteBtn").click(function(){
					if(confirm("해당 문의를 삭제하시겠습니까?")){
						$("#form_data").attr({
							"method":"get",
							"action":"/serviceCenter/serviceDelete"
						});
						$("#form_data").submit();						
					}
				});
			});
			
		</script>
	</head>
	<body>
		<div style="position: relative;">
			<form id="form_data">
				<input type="hidden" name="sc_no" id="sc_no" value="${ serviceDetail.sc_no }" />
			</form>
			
			<div class="detail_table mt30">
				<c:set var="member" value="${memberLogin.u_no}" />
				<c:set var="service" value="${serviceDetail.u_no}" />
				<fmt:parseNumber var="member" type="number" value="${member}"/>
				<fmt:parseNumber var="service" type="number" value="${service}"/>
				<c:choose>
					<c:when test="${member eq service }">
						<div class="buttonList tr">
							<button type="button" class="buttonWhite" id="updateBtn">EDIT</button>
							<button type="button" class="buttonWhite" id="deleteBtn">DELETE</button>
							<button type="button" class="buttonBlack" id="listBtn">LIST</button>
						</div>
					</c:when>
					<c:otherwise>
						<div class="buttonList tr" style="display: block;">
							<button type="button" class="buttonBlack" id="listBtn">LIST</button>
						</div>
					</c:otherwise>
				</c:choose>
	            <table class="detailView">
	                <colgroup>
	                </colgroup>
	                <thead>
	                    <tr class="text-center">
	                        <th>${serviceDetail.sc_title}</th>
	                    </tr>
	                </thead>
	                <tbody>
	                	<tr>
							<td style="border: 0;">
								<div class="detail_date">
									<div>
										<span><em>Date : </em>${ serviceDetail.sc_created_at }</span>
									</div>
									<div>
										<span><em>Name : </em>${ serviceDetail.u_name }</span>
										<span><em>Hits : </em>${ serviceDetail.sc_readcnt }</span>
									</div>
								</div>
							</td> 
						</tr>
						<tr>
							<td>
								<div class="detail_content">
									<p>${ serviceDetail.sc_content }</p>
								</div>
							</td>
						</tr>
	                </tbody>
	            </table>
	        </div>
		</div>
	</body>
</html>