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
						$("#emb_pg_provider").text(result.response.emb_pg_provider);
						
						$("#amount").text($.number(result.response.amount));
						
						$("#receipt_url").prop('href', result.response.receipt_url);
					},
					error : function() {
						alert("실패");
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
						alert("실패");
					}
		    	});
				
				// 운송장 등록버튼 클릭 시
				$("#insertBtn").click(function(){
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
				
				
				// 운송장 수정버튼 클릭 시
				$("#insertBtn").click(function(){
					// 모달창 open
					$("#sendButton").click(function(){
						
						/* 모달창에서 택배사 코드, 운송장번호 입력받기 */
						let t_code = $("#parcelSelect option:selected").val();
						let t_invoice = $("input[name='invoice']").val();
						
						$("#o_no").val(o_no);
						$("#t_code").val(t_code);
						$("#t_invoice").val(t_invoice);
						
						let value = JSON.stringify({
							o_no : $("#o_no").val(),
				    		t_code : $("#t_code").val(),
				    		t_invoice : $("#t_invoice").val()
						});
						
						$.ajax({
				    		url: "/delivery/updateDelivery",
				    		type: 'post',
				    		headers : {
								"Content-Type":"application/json"
							},
							dataType : "text",
							data: value,
				    		success : function(result){
				    			if(result == "success"){
									console.log("운송장 정보 수정에 성공했습니다.");
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
	
		<!-- Modal -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document" style="position: relative; top: 300px;">
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
				                <c:if test="${not empty delivery}">
					                <button type="button" class="whiteBtn changeBtn" id="changeBtn" data-toggle="modal" data-target="#exampleModalCenter">운송장 수정</button>
				                </c:if>
				                <c:if test="${empty delivery}">
					                <button type="button" class="whiteBtn changeBtn" id="insertBtn" data-toggle="modal" data-target="#exampleModalCenter">운송장 등록</button>
				                </c:if>
				            </div>
		                </div>
		            </div>
		            
		            
		            <div class="detail_section">
			            <div class="info_area">
			                <div class="info_head">
			                    <h3>구매자정보</h3>
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
			                    <h3>결제정보</h3>
			                </div>
			                <div class="info_cont">
			                    <ul class="payment_info">
			                        <li>
			                            <strong id="emb_pg_provider"></strong> 사용
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