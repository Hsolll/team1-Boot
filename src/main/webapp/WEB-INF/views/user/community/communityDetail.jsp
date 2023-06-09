<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		
		<link type="text/css" rel="stylesheet" href="/resources/include/css/community.css" />
		<script type="text/javascript">
			$(function(){
				$(".content_wrap .page-header h1").html("상세페이지");
				
				/* LIST 버튼 클릭 시 처리 이벤트 */
				$("#listBtn").click(function(){
					let category = "<c:out value='${detail.c_category}' />";
					console.log("category : " + category);
					location.href="/community/communityList?c_category=" + category;
				});
				
				/* EDIT 버튼 클릭 시 처리 이벤트 */
				$("#updateBtn").click(function(){
					$("#form_data").attr({
						"method":"get",
						"action":"/community/updateView"
					});
					$("#form_data").submit();
				});
				
				
				/* DELETE 버튼 클릭 시 처리 이벤트 */
				$("#deleteBtn").click(function(){
					if(confirm("정말 삭제하시겠습니까?")){
						$("#form_data").attr({
							"method":"get",
							"action":"/community/deleteCommunity"
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
				<input type="hidden" name="c_no" id="c_no" value="${ detail.c_no }" />
				<input type="hidden" name="c_category" id="c_category" value="${ detail.c_category }" />
				<input type="hidden" name="c_file" value="${detail.c_file}" />
				<input type="hidden" name="c_thumb" value="${detail.c_thumb}" />
			</form>
			
			<div class="detail_table mt30">
				<c:set var="member" value="${memberLogin.u_no}" />
				<c:set var="community" value="${detail.u_no}" />
				<fmt:parseNumber var="member" type="number" value="${member}"/>
				<fmt:parseNumber var="community" type="number" value="${community}"/>
				<c:choose>
					<c:when test="${member eq community }">
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
	                <thead>
	                    <tr class="text-center">
	                        <th>${detail.c_title}</th>
	                    </tr>
	                </thead>
	                <tbody>
	                	<tr>
							<td style="border: 0;">
								<div class="detail_date">
									<div>
										<span><em>Date : </em>${ detail.c_created_at }</span>
									</div>
									<div>
										<span><em>Name : </em>${ detail.u_id }</span>
										<span><em>Hits : </em>${ detail.c_cnt }</span>
									</div>
								</div>
							</td> 
						</tr>
						<tr>
							<td>
								<div class="detail_content">
									<p>${ detail.c_content }</p>
								</div>
								<c:if test="${not empty detail.c_file}">
									<div class="detail_image">
										<img src="/uploadStorage/community/${detail.c_file}" />
									</div>
								</c:if>
							</td>
						</tr>
	                </tbody>
	            </table>
	        </div>
	        <%-- 댓글 입력폼, 리스트 삽입 --%>
	        <jsp:include page="communityReply.jsp" />
		</div>
	</body>
</html>