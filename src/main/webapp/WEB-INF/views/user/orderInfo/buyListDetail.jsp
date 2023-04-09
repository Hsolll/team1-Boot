<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

		<script type="text/javascript">
			$(function(){
				$(".content_wrap .page-header h1").html("주문 상세정보~~~");

				
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
						//console.log(result);

						console.log("---------- 추출 정보 ----------")
						console.log(result.response.amount);
						
						console.log("---------- 출력 정보 ----------")
					},
					error : function() {
						alert("실패");
					}
		    	});
				
				
				/* 배송조회 
				$("#parcelSearchBtn").click(function(){
					let o_no = "${detail.o_no}";
					console.log("o_no = " + o_no);
					
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
				});*/
				

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
		<div class="container">
		
			<div>
		
		        <div class="order_detail_content">
		            <div>
		                <button>목록보기</button>
		            </div>
		            
		            <div class="detail_section order_num">
		                <p>주문번호</p>
		                <span>주문날짜</span>
		            </div>
		
		            <div class="seller_info">
		                <div class="detail_section">
		                    <p class="seller_id">판매자아이디</p>
		                    <span class="seller_info_detail">판매자정보 확인하기 > </span>
		                </div>
		            </div>
		
		            <div class="order_info">
		                <div class="order_list_item">
		                    <img src="#" alt="상품 썸네일">
		                </div>
		                <div class="product_info">
		                    <span class="icon_text">주문상태</span>
		                    <span>상품명</span>
		                </div>
		                <div class="product_price">
		                    <strong>상품가격</strong>
		                </div>
		            </div>
		            <div class="buttonBox">
		                <button class="whiteBtn" id="parcelSearchBtn">배송조회</button>
		                <button class="whiteBtn">구매확정</button>
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
		                            <span>수령인이름</span>
		                        </li>
		                        <li>
		                            <strong>연락처</strong>
		                            <span>핸드폰번호</span>
		                        </li>
		                        <li>
		                            <strong>배송지</strong>
		                            <span>수령주소</span>
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
		                <div>
		                    <ul class="payment_info">
		                        <li>
		                            <strong>결제금액</strong>
		                            <p class="amount">
		                                <span>10,000</span>원
		                            </p>
		                        </li>
		                        <li class="type_payment">
		                            <strong>결제방법</strong>
		                            <span>카드</span>
		                        </li>
		                        <li class="type_payment">
		                            <strong>결제날짜</strong>
		                            <span>date</span>
		                        </li>
		                    </ul>
		                </div>
		            </div>
		        </div>
		    </div>
			
		</div>
		<%-- ===================== 배송 조회 폼 ===================== --%>
		<form id="searchForm" name="searchForm" ><!-- style="display: none;" -->
            <input type="hidden" id="t_key" name="t_key">
            <input type="hidden" name="t_code" id="t_code">
            <input type="hidden" name="t_invoice" id="t_invoice">
       	</form>
	</body>
</html>