<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

		
		<script type="text/javascript" src="/resources/include/js/jquery.number.min.js"></script>
		<link type="text/css" rel="stylesheet" href="/resources/include/css/buyListDetail.css" />

		<script type="text/javascript">
			$(function(){
				$(".content_wrap .page-header h1").html("주문 상세정보");
				
				let o_no = ${detail.o_no};
				console.log("o_no = " + o_no);
				
				let value = JSON.stringify({
					pay_id : "${detail.pay_id}",
				});
				
				/* 결제 상세정보 가져오기 */
				$.ajax({
		    		url: "/order/paymentDetail",
		    		type: 'post',
		    		headers : {
						"Content-Type":"application/json"
					},
					dataType : "json",
					data: value,
					success : function(result){
						console.log(result);

						console.log("---------- 추출 정보 ----------")
						console.log(result.response.amount);
						console.log(result.response.emb_pg_provider);
						console.log(result.response.card_name);
						console.log(result.response.card_number);
						
						if(result.response.emb_pg_provider != null){
							$("#emb_pg_provider").text(result.response.emb_pg_provider);							
						} else{
							$("#card_name").text(result.response.card_name);
							$("#card_number").text(" / " + result.response.card_number);							
						}
						
						$("#amount").text($.number(result.response.amount));
						
						$("#receipt_url").prop('href', result.response.receipt_url);
					},
					error : function() {
						console.log("결제정보 조회 실패");
					}
		    	});
				
				
				/* 배송조회 */
				$("#parcelSearchBtn").click(function(){
					
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
						error : function() {
							alert("등록된 배송정보가 없습니다.");
						}
			    	});
				});
				

				// 배송상태 자동변경
				$.ajax({
		    		url: "/delivery/deliveryTracking?o_no=" + o_no,
					dataType : "json",
		    		success : function(result){
						console.log(result);

						let tracking = result.trackingDetails;
						console.log("---------- 추출 정보 ----------")
						console.log(tracking);
						
						let lastIndex = tracking.length - 1;
						let kind = tracking[lastIndex].kind
						console.log("---------- 출력 정보 ----------")
						console.log(kind);
						$(".icon_text").text(kind);
					},
					error : function() {
						console.log("배송정보 없음");
					}
		    	});
				
				
				/* 구매 확정 */
				$("#confirmBtn").click(function(){
					let o_no = ${detail.o_no};
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
			// 배송조회 처리함수
			function goSubmit(){
				let win = window.open('','newPopup','scrollbars=yes, width=480, height=1100');	// 새 창으로 띄우기
				let form = document.searchForm;
				
				form.action = "http://info.sweettracker.co.kr/tracking/4";
				form.method = "post";
				form.target = "newPopup";
				form.submit();
			}
		</script>
	</head>
	<body>
		<div class="container">
		
			<div>
				<div class="location">
	                <span class="location_right">
	                    <a href="/order/buyList" class="list_btn">
	                        <span class="list_icon"></span>
	                        목록으로 가기
	                    </a>
	                </span>
	            </div>
	            
		        <div class="order_detail_content">
		        
		            <div class="detail_section order_num">
		                <p>${detail.o_id}</p>
		                <span>${detail.o_date}</span>
		                <a href="#" id="receipt_url">영수증보기</a>
		            </div>
		
		
		            <div class="detail_section seller_info p15">
		                <div class="detail_section">
		                    <p class="seller_id">${detail.seller }</p>
		                    <span class="seller_info_detail">판매자정보 확인하기 > </span>
		                </div>
		            </div>
		
		
		            <div class="detail_section order_info p15">
		                <div class="order_list_item">
		                    <c:if test="${not empty detail.p_thumb}">
								<img class="" src="/uploadStorage/product/${detail.p_thumb}"/>
							</c:if>
		                </div>
		                <div class="product_wrap">
		                	<div class="product_info">
			                    <span class="icon_text">${detail.o_status}</span>
			                    <span>${detail.p_name}</span>
			                </div>
			                <div class="product_info">
			                    <strong>
			                    	<fmt:formatNumber value="${detail.sp_price}" groupingUsed="true"/> 원
			                    </strong>
			                </div>
			                
			                <div class="buttonBox">
				                <button type="button" class="whiteBtn" id="parcelSearchBtn">배송조회</button>
				                <c:if test="${detail.o_status ne '결제완료'}">
				                	<button type="button" class="whiteBtn" id="confirmBtn">구매확정</button>
				                </c:if>
				            </div>
		                </div>
		            </div>
		            
		            
		            <div class="detail_section">
			            <div class="info_area">
			                <div class="info_head">
			                    <h3>배송지정보</h3>
			                </div>
			                <div class="info_cont">
			                    <ul class="person_info">
			                        <li>
			                            <strong>수령인</strong>
			                            <span>${detail.receiver}</span>
			                        </li>
			                        <li>
			                            <strong>연락처</strong>
			                            <span>${detail.rec_tel}</span>
			                        </li>
			                        <li>
			                            <strong>배송지</strong>
			                            <span>${detail.o_address}</span>
			                        </li>
			                    </ul>
			                </div>
			            </div>
			        </div>
			        
			        <div class="detail_section">
			            <div class="info_area">
			                <div class="info_head">
			                    <h3>결제상세</h3>
			                </div>
			                <div class="info_cont">
			                    <ul class="payment_info">
			                        <li>
			                            <strong id="emb_pg_provider"></strong><strong id="card_name"></strong> 사용
			                            <strong id="card_number"></strong>
			                            <p class="amount">
			                                <span id="amount">10,000</span> 원
			                            </p>
			                        </li>
			                        <li class="type_payment">
			                            <strong>${detail.pay_date}</strong>
			                        </li>
			                    </ul>
			                </div>
			            </div>
			        </div>

		        </div>
		
		    </div>
			
		</div>
		<%-- ===================== 배송 조회 폼 ===================== --%>
		<form id="searchForm" name="searchForm" >
            <input type="hidden" id="t_key" name="t_key">
            <input type="hidden" name="t_code" id="t_code">
            <input type="hidden" name="t_invoice" id="t_invoice">
       	</form>
	</body>
</html>