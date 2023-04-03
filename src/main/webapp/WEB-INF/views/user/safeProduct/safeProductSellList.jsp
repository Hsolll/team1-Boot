<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		
        <link rel="stylesheet" href="/resources/include/css/sellList.css" />
		<script type="text/javascript">
		$(function(){
			$(".content_wrap .page-header h1").html("판매목록");
			
			
			$(".updateBtn").click(function(){
				let sp_no = $(this).parents("tr").attr("data-num");
				console.log("sp_no = " + sp_no);
				
				$("#sp_no").val(sp_no);
				$("#f_data").attr({
					"method":"get",
					"action":"/safe/productUpdateView"
				});
				$("#f_data").submit();
			});
			
			$(".deleteBtn").click(function(){
				let sp_no = $(this).parents("tr").attr("data-num");
				console.log("sp_no = " + sp_no);
				
				$("#sp_no").val(sp_no);
				$("#f_data").attr({
					"method":"get",
					"action":"/safe/productDelete"
				});
				$("#f_data").submit();
			});

		});
		</script>
	</head>
	<body>
		<c:if test="${!empty msg}">
			<script>
				alert("${msg}");
				<c:remove var="msg"/>
			</script>
		</c:if>
		
		<div class="container">
			<form id="f_data">
				<input type="hidden" id="sp_no" name="sp_no" />
			</form>
		
			
			<%-- ================= 판매목록 보여주기 시작 ================= --%>
            <div class="sell_list">
	            <table class="tb_sell">
	                <colgroup>
	                    <col style="width: 10%">
	                    <col>
	                    <col style="width: 18%">
	                    <col style="width: 15%">
	                    <col style="width: 13%">
	                    <col style="width: 14%">
	                </colgroup>
	                <thead>
	                    <tr>
	                        <th scope="col">등록일자</th>
	                        <th scope="col">제목</th>
	                        <th scope="col">상품명</th>
	                        <th scope="col">가격</th>
	                        <th scope="col">현재상태</th>
	                        <th scope="col">수정/삭제</th>
	                    </tr>
	                </thead>
	                <tbody>
	                
	                	<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${ not empty sellList }">
								<c:forEach var="sellList" items="${ sellList }" varStatus="status">
									<tr class="text-center" data-num="${sellList.sp_no }">
										<td>${ sellList.sp_created_at }</td>
										<td class="goDetail tl">${ sellList.sp_title }</td>
										<td class="name">${ sellList.sp_name }</td>
										<td>
											<fmt:formatNumber value="${sellList.sp_price}" groupingUsed="true"/>
										</td>
										<td>${ sellList.sp_status }</td> 
										<td>
											<c:choose>
												<c:when test="${sellList.sp_status eq '판매중'}">
													<button type="button" class="btn_swh updateBtn">수정</button>
													<button type="button" class="btn_swh deleteBtn">삭제</button>
												</c:when>
												<c:otherwise>
													<button type="button" class="btn_swh" style="cursor: default;">${sellList.sp_status}</button>
												</c:otherwise>
											</c:choose>
				                        </td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="6" class="tac text-center">등록된 상품 정보가 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
	                </tbody>
	            </table>
	        </div>
			<%-- ================= 판매목록 보여주기 끝 ================= --%>
		</div>
	</body>
</html>