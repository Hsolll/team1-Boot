<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		
        <link rel="stylesheet" href="/resources/include/css/sellList.css" />
		<script type="text/javascript">
		$(function(){
			$(".content_wrap .page-header h1").html("판매자 주문목록");
			
			
			/* 발송완료 버튼 클릭 시 주문상태 배송중으로 변경 
			 * 추후 운송장 등록으로 변경 예정 */
			$(".sendBtn").click(function(){
				let o_no = $(this).parents("tr").attr("data-num");
				console.log("o_no = " + o_no);
				
				$("#o_no").val(o_no);
				$("#f_data").attr({
					"method":"get",
					"action":"/order/send"
				});
				$("#f_data").submit();
			});
			

		});
		</script>
	</head>
	<body>
		<div class="container">
			<form name="f_data" id="f_data">
				<input type="hidden" id="o_no" name="o_no" />
			</form>
			
			<%-- ================= 판매목록 보여주기 시작 ================= --%>
            <div class="sell_list">
	            <table class="tb_sell">
	                <colgroup>
	                    <col style="width: 16%">
	                    <col>
	                    <col style="width: 12%">
	                    <col style="width: 12%">
	                    <col style="width: 10%">
	                    <col style="width: 10%">
	                    <col style="width: 12%">
	                </colgroup>
	                <thead>
	                    <tr>
	                        <th scope="col">주문번호</th>
	                        <th scope="col">상품명</th>
	                        <th scope="col">구매자</th>
	                        <th scope="col">가격</th>
	                        <th scope="col">현재상태</th>
	                        <th scope="col">운송장등록</th>
	                        <th scope="col">주문일시</th>
	                    </tr>
	                </thead>
	                <tbody>
		                <c:choose>
							<c:when test="${ not empty sellList }">
								<c:forEach var="sellList" items="${ sellList }" varStatus="status">
									<tr class="text-center" data-num="${sellList.o_no }">
										<td>${ sellList.o_id }</td>
										<td>${ sellList.sp_name }</td>
										<td>${ sellList.buyer }</td>
										<td>
											<fmt:formatNumber value="${sellList.sp_price}" groupingUsed="true"/>
										</td>
										<td>${ sellList.o_status }</td> 
										<td>
											<c:choose>
												<c:when test="${sellList.o_status eq '결제완료'}">
													<button type="button" class="btn_swh sendBtn">발송완료</button>
												</c:when>
												<c:when test="${sellList.o_status eq '배송중'}">
													<span style="font-size: 13px;">발송완료</span>
												</c:when>
												<c:when test="${sellList.o_status eq '거래완료'}">
													<span style="font-size: 13px;">거래완료</span>
												</c:when>
												<c:otherwise>
													<span style="font-size: 12px;">구매자취소</span>
												</c:otherwise>
											</c:choose>
										</td>
										<td>${ sellList.o_date }</td> 
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