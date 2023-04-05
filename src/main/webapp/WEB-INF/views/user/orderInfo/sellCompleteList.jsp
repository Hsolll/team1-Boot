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
        	.close {
        		position: absolute;
			    top: 10px;
			    right: 10px;
        	}
        	.insert_invoice {
        		display: flex;
       		    align-items: center;
        		width: 100%;
        		height: 70px;
        	}
        	#parcelSelect {
        		display: inline-block;
        		border: 1px solid #C9C9C9;
        		outline: none;
			    height: 30px;
			    margin: 20px 10px;
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
			
			
			/* 모달창에서 택배사 코드, 운송장번호 입력받기 */
			$("#parcelSelect").change(function(){
				let t_code = $("#parcelSelect option:selected").val();
				console.log("t_code : " + t_code);
				
				let t_invoice = $("input[name='invoice']").val();
				console.log("t_invoice : " + t_invoice);
			});
			
			$(".sendBtn").click(function(){
				let o_no = $(this).parents("tr").attr("data-num");
				console.log("o_no = " + o_no);
				
				/* 발송완료 버튼 클릭 시 주문상태 배송중으로 변경 
				 * 추후 운송장 등록으로 변경 예정 */
				$("#sendButton").click(function(){
					console.log("o_no = " + o_no);
					
					/* 모달창에서 택배사 코드, 운송장번호 입력받기 */
					let t_code = $("#parcelSelect option:selected").val();
					console.log("t_code : " + t_code);
					
					let t_invoice = $("input[name='invoice']").val();
					console.log("t_invoice : " + t_invoice);
					
					$("#o_no").val(o_no);
					$("#t_code").val(t_code);
					$("#t_invoice").val(t_invoice);
					
					let value = JSON.stringify({
						o_no : $("#o_no").val(),
			    		t_code : $("#t_code").val(),
			    		t_invoice : $("#t_invoice").val()
					});
					
					$.ajax({
			    		url: "/delivery/insertDelivery",
			    		type: 'post',
			    		headers : {
							"Content-Type":"application/json"
						},
						dataType : "text",
						data: value,
			    		success : function(result){
			    			if(result == "success"){
								console.log("운송장 정보 저장에 성공했습니다.");
								// 전송 후 입력값 초기화
								$("#o_no").val("");
								$("#t_code").val("");
								$("#t_invoice").val("");
			    			}else{
			    				return;
			    			}
						},
						error : function() {
							alert("실패");
						}
			    	});
					
					$("#f_data").attr({
						"method":"get",
						"action":"/order/send"
					});
					$("#f_data").submit();
				});
			});
			
			/* 배송조회 */
			$("#parcelSearchBtn").click(function(){
				let o_no = $(this).parents("tr").attr("data-num");
				console.log("o_no = " + o_no);
				$("#o_no").val(o_no);
				
				
				$.ajax({
		    		url: "/delivery/deliveryInfo?o_no=" + o_no, 
		    		type: 'get',
					dataType : "text",
		    		success : function(result){
						console.log(result);
						
						let obj = JSON.parse(result);
						
						let t_code = obj.t_code;
						let t_invoice = obj.t_invoice;
						let t_key = obj.t_key;
						
						$("input[name='t_code']").val(t_code);
						$("input[name='t_invoice']").val(t_invoice);
						$("input[name='t_key']").val(t_key);
						
						goSubmit();
					},
					error : function(xhr, textStatus, errorThrown) {
						alert("실패");
					}
		    	});
				
			});
			

		});
		
		function goSubmit(){
			let win = window.open('','newPopup','scrollbars=yes, width=480, height=1100');
			let form = document.searchForm;
			
			form.action = "http://info.sweettracker.co.kr/tracking/4";
			form.method = "post";
			form.target = "newPopup";
			form.submit();
		}
		</script>
	</head>
	<body>
		<!-- Button trigger modal
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
		  	Launch demo modal
		</button> -->
	
		<!-- Modal -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalCenterTitle">운송장등록</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
					  	</button>
					</div>
					<div class="modal-body">
						<h4>운송장번호 등록하기</h4>
						<div class="insert_invoice">
					 	<select id="parcelSelect">
					 		<option>택배사를 선택해주세요</option>
					 		<option value="04">CJ대한통운</option>
					 		<option value="05">한진택배</option>
					 		<option value="08">롯대택배</option>
					 		<option value="01">우체국택배</option>
					 		<option value="06">로젠택배</option>
					 		<option value="23">경동택배</option>
					 		<option value="46">CU편의점택배</option>
					 		<option value="24">GS편의점택배</option>
					 	</select>
					 	<input type="text" name="invoice" id="invoice" placeholder="운송장번호를 입력해주세요." class="w350" />
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary" id="sendButton">등록하기</button>
					</div>
				</div>
			</div>
		</div>
		
		<div class="container">
			<form name="f_data" id="f_data">
				<input type="hidden" id="o_no" name="o_no" />
				<input type="hidden" id="t_code" name="t_code" />
				<input type="hidden" id="t_invoice" name="t_invoice" />
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
													<button type="button" class="btn_swh sendBtn" data-toggle="modal" data-target="#exampleModalCenter">운송장등록</button>
												</c:when>
												<c:when test="${sellList.o_status eq '배송중'}">
													<button type="button" id="parcelSearchBtn" class="btn_swh">배송조회</button>
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
			
			<%-- ===================== 배송 조회 폼 ===================== --%>
			<form id="searchForm" name="searchForm" ><!-- style="display: none;" -->
	            <input type="hidden" id="t_key" name="t_key">
	            <input type="hidden" name="t_code" id="t_code">
	            <input type="hidden" name="t_invoice" id="t_invoice">
        	</form>
    	</div>
	</body>
</html>