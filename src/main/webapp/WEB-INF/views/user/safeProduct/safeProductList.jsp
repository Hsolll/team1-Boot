<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

		<link rel="stylesheet" href="/resources/include/css/sellList.css">
		
		<script type="text/javascript">
			$(function(){
				$(".content_wrap .page-header h1").html("상품 목록");
				
				/* 제목 클릭 시 상세 페이지 이동을 위한 처리 이벤트 */
				$(".goDetail").click(function(){
					let sp_no = $(this).parents("tr").attr("data-num");
					//console.log("sp_no = " + sp_no);
					$("#sp_no").val(sp_no);
					$("#detailForm").attr({
						"method":"get",
						"action":"/safe/productDetail"
					});
					$("#detailForm").submit();
				});
			});
		</script>
	</head>
	<body>
		<div class="contentContainer container">
		
			<form name="detailForm" id="detailForm">
				<input type="hidden" name="sp_no" id="sp_no" >
			</form>
			
			<%-- ===================== 검색 기능 시작 ===================== --%>
			
			<%-- ===================== 검색 기능 종료 ===================== --%>
			
			
			
			<%-- ===================== 리스트 시작 ===================== --%>
			<div id="safeProduct" class="table-height">
				<table summary="안심상품 리스트" class="table table-striped" id="tableList">
					<thead>
						<tr class="text-center">
							<th data-value="sp_no" class="order text-center col-md-1">번호</th>
							<th class="text-center col-md-5">제목</th>
							<th class="text-center col-md-1">판매자ID</th>
							<th class="text-center col-md-2">가격</th>
							<th class="text-center col-md-1">거래상태</th>
							<th data-value="sp_created_at" class="text-center col-md-2">등록일</th>
						</tr>
					</thead>
					<tbody id="list" class="table-striped">
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${ not empty safeProduct }">
								<c:forEach var="safe" items="${ safeProduct }" varStatus="status">
									<tr class="text-center" data-num="${safe.sp_no }">
										<td>${ safe.sp_no }</td>
										<td class="goDetail text-left">${ safe.sp_title }</td>
										<td class="name">${ safe.u_id }</td>
										<td>
											<fmt:formatNumber value="${safe.sp_price}" groupingUsed="true"/>
										</td>
										<td>${ safe.sp_status }</td> 
										<td>${ safe.sp_created_at }</td> 
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4" class="tac text-center">등록된 상품 정보가 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<%-- ===================== 리스트 종료 ===================== --%>
			
			
			
			<%-- ===================== 페이징 출력 시작 ===================== --%>
			
			<%-- ===================== 페이징 출력 종료 ===================== --%>
			
			
			
			<%-- ===================== 글쓰기 버튼 시작 ===================== --%>
			
		</div>
	</body>
</html>