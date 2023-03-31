<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		
        <link rel="stylesheet" href="/resources/include/css/sellList.css" />
		<script type="text/javascript">
			$(function(){
				$(".content_wrap .page-header h1").html("구매 목록");
				
				if("${changeFail}" != ""){
					let comment = "${changeFail}";
					alert(comment);
				}
				
				
				$(".paymentCancelBtn").click(function(){
					
					let o_no = $(this).parents("tr").attr("data-no");
					console.log("o_no = " + o_no);
					$("#o_no").val(o_no);
					$("#f_data").attr({
						"method":"get",
						"action":"/payments/cancel"
					});
					$("#f_data").submit();
				});
				
				
				$(".gotoPaymentBtn").click(function(){
					let sp_no = $(this).parents("tr").attr("data-sp");
					console.log("sp_no = " + sp_no);
					
					location.href="/safe/productOrder?sp_no=" + sp_no;
				});
				
				
				$(".confirmBtn").click(function(){
					let o_no = $(this).parents("tr").attr("data-no");
					console.log("o_no = " + o_no);
					
					$.ajax({
			    		url: "/order/confirm", 
			    		type: 'GET',
			    		dataType: 'text',
			    		data: {"o_no" : o_no},
			    		success : function(result){
							if(result == "처리성공"){
								console.log(result);
								
								$("#o_no").val(o_no);
								$("#f_data").attr({
									"method":"get",
									"action":"/order/complete"
								});
								$("#f_data").submit();
								
							}else{
								alert(result);
							}
						},
						error : function() {
							
						}
					});
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
			
			<form name="f_data" id="f_data">
				<input type="hidden" name="o_no" id="o_no" />
			</form>
		
			
			<%-- ================= 판매목록 보여주기 시작 ================= --%>
            <div class="sell_list">
	            <table class="tb_sell">
	                <colgroup>
	                    <col style="width: 15%">
	                    <col style="width: 13%">
	                    <col>
	                    <col style="width: 12%">
	                    <col style="width: 13%">
	                    <col style="width: 10%">
	                    <col style="width: 10%">
	                </colgroup>
	                <thead>
	                    <tr>
	                        <th scope="col">주문번호</th>
	                        <th scope="col">주문일시</th>
	                        <th scope="col">상품명</th>
	                        <th scope="col">판매자</th>
	                        <th scope="col">가격</th>
	                        <th scope="col">현재상태</th>
	                        <th scope="col">상태변경</th>
	                    </tr>
	                </thead>
	                <tbody>
		                <c:choose>
							<c:when test="${ not empty buyList }">
								<c:forEach var="buyList" items="${ buyList }" varStatus="status">
									<tr class="text-center" data-no="${buyList.o_no}" data-sp="${buyList.sp_no}">
										<td>${ buyList.o_id }</td>
										<td>${ buyList.o_date }</td>
										<td>${ buyList.sp_name }</td>
										<td>${ buyList.seller }</td>
										<td>
											<fmt:formatNumber value="${buyList.sp_price}" groupingUsed="true"/>
										</td>
										<td>${ buyList.o_status }</td> 
										<td>
											<c:choose>
												<c:when test="${buyList.o_status eq '결제완료'}">
													<button type="button" class="btn_swh paymentCancelBtn" >결제취소</button>
												</c:when>
												<c:when test="${buyList.o_status eq '결제취소'}">
													<button type="button" class="btn_swh gotoPaymentBtn" >재결제</button>
												</c:when>
												<c:when test="${buyList.o_status eq '거래완료'}">
													<span style="font-size: 14px;"> 거래완료 </span>
												</c:when>
												<c:otherwise>
													<button type="button" class="btn_swh confirmBtn" >구매확정</button>
												</c:otherwise>
											</c:choose>
										</td> 
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="7" class="tac text-center">구매한 상품 정보가 존재하지 않습니다.</td>
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