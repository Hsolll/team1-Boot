<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		
        <link rel="stylesheet" href="/resources/include/css/sellList.css" />
		<script type="text/javascript">
		$(function(){
			$(".content_wrap .page-header h1").html("판매완료 목록");
			

		});
		</script>
	</head>
	<body>
		<div class="container">
			
			<%-- ================= 판매목록 보여주기 시작 ================= --%>
            <div class="sell_list">
	            <table class="tb_sell">
	                <colgroup>
	                    <col style="width: 17%">
	                    <col style="width: 15%">
	                    <col>
	                    <col style="width: 13%">
	                    <col style="width: 13%">
	                    <col style="width: 12%">
	                    <col style="width: 13%">
	                </colgroup>
	                <thead>
	                    <tr>
	                        <th scope="col">주문번호</th>
	                        <th scope="col">주문일시</th>
	                        <th scope="col">상품명</th>
	                        <th scope="col">구매자</th>
	                        <th scope="col">가격</th>
	                        <th scope="col">현재상태</th>
	                        <th scope="col">운송장등록</th>
	                    </tr>
	                </thead>
	                <tbody>
		                <c:choose>
							<c:when test="${ not empty sellList }">
								<c:forEach var="sellList" items="${ sellList }" varStatus="status">
									<tr class="text-center" data-num="${sellList.o_no }">
										<td>${ sellList.o_id }</td>
										<td>${ sellList.o_date }</td>
										<td>${ sellList.sp_name }</td>
										<td>${ sellList.buyer }</td>
										<td>
											<fmt:formatNumber value="${sellList.sp_price}" groupingUsed="true"/>
										</td>
										<td>${ sellList.o_status }</td> 
										<td>
											<button type="button" id="" >운송장등록</button>
										</td> 
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="6" class="tac text-center">판매된 상품 정보가 존재하지 않습니다.</td>
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