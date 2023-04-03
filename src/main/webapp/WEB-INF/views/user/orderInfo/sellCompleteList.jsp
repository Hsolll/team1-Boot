<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		
        <link rel="stylesheet" href="/resources/include/css/sellList.css" />
        <style type="text/css">
        	#keyword {
        		border-radius: 4px;
    			box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    			height: 34px;
        	}
        </style>
        
        <script type="text/javascript" src="/resources/include/js/sellListSearch.js"></script>
		<script type="text/javascript">
		$(function(){
			$(".content_wrap .page-header h1").html("판매주문관리");
			
			search = "<c:out value='${data.search}' />";
			start_date = "<c:out value='${data.start_date}' />";
			end_date = "<c:out value='${data.end_date}' />";
			keyword = "<c:out value='${data.keyword}' />";
			
			
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
			
			<%-- ===================== 검색 기능 시작 ===================== --%>
			<div class="searchbox">
				<form class="form-inline" id="f_search">
					<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
		
					<div class="form-group">
						<select id="search" name="search" class="form-control">
							<option value="o_id">주문번호</option>
							<option value="sp_name">상품명</option>
							<option value="u_id">구매자</option>
							<option value="o_date">주문일자</option>
						</select>
					</div>
					<div class="form-group" id="textCheck">
						<input type="text" name="keyword" id="keyword" class="w280 pl10" placeholder="검색어를입력하세요" />
					</div>
					<div class="form-group" id="dateCheck">
						<input type="date" name="start_date" id="start_date" placeholder="시작일자" class="form-control">
						<input type="date" name="end_date" id="end_date" placeholder="종료일자" class="form-control">
					</div>
					<div class="fr">
						<button type="button" class="btn_double" id="searchBtn"><span class="icon"></span>검 색</button>
						<button type="button" class="btn_double" id="allSearchBtn"><span class="icon"></span>전체검색</button>
					</div>
				</form>
            </div>
			<%-- ===================== 검색 기능 종료 ===================== --%>
			
			<%-- ================= 판매목록 보여주기 시작 ================= --%>
            <div class="sell_list mt30">
            	<div class="location">
	                <span class="location_right">
	                    <a href="/" class="list_btn">
	                        <span class="list_icon"></span>
	                        되돌아가기
	                    </a>
	                </span>
	            </div>
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
			
			<%-- ===================== 페이징 출력 시작 ===================== --%>
			<div class="text-center">
				<ul class="pagination">
					<c:if test="${ pageMaker.prev }">
						<li class="paginate_button previous">
							<a href="${ pageMaker.startPage - 1 }">Previous</a>
						</li>
					</c:if>
					<!-- 바로가기 번호 출력 -->
					<c:forEach var="num" begin="${ pageMaker.startPage }"
										 end="${ pageMaker.endPage }">
						<li class="paginate_button ${ pageMaker.cvo.pageNum == num ? 'active':'' }">
							<a href="${num}" > ${num}</a>
						</li>
					</c:forEach>
					<!-- 다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인 -->
					<c:if test="${ pageMaker.next }">
							<li class="paginate_button next">
								<a href="${ pageMaker.endPage + 1 }">Next</a>
							</li>
					</c:if>
				</ul>
			</div>
			<%-- ===================== 페이징 출력 종료 ===================== --%>
		</div>
	</body>
</html>