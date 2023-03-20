<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

		<link type="text/css" rel="stylesheet" href="/resources/include/css/order.css" />
		<!-- iamport.payment.js -->
	    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	    
		<script type="text/javascript">
			var IMP = window.IMP; 
	        IMP.init("imp54405822");
	        
			$(function(){
				$(".content_wrap .page-header h1").html("주문/결제");
				
				$("#buy_btn").click(function(){
					requestPay();
				});

			});
			
			function requestPay() {
	            IMP.request_pay({
	                pg : 'html5_inicis',
	                pay_method : 'card',
	                merchant_uid: "57008833-33004", 
	                name : '당근 10kg',
	                amount : 1004,
	                buyer_email : 'Iamport@chai.finance',
	                buyer_name : '포트원 기술지원팀',
	                buyer_tel : '010-1234-5678',
	                buyer_addr : '서울특별시 강남구 삼성동',
	                buyer_postcode : '123-456'
	            }, function (rsp) { // callback
	                if (rsp.success) {
	                    console.log(rsp);
	                } else {
	                    console.log(rsp);
	                }
	            });
	        }
		</script>
	</head>
	<body>
		<div class="container">
			<%-- <form name="f_data" id="f_data" method="post">
				<input type="hidden" name="sp_no" value="${ detail.sp_no }">
			</form> --%>

			
			<%-- ================= 주문 정보 보여주기 시작 ================= --%>
            <div class="info_wrapper">
                        <div class="list_item_info">
                            <h3 class="info_title">상품정보</h3>
                            <div class="box_blue">
                                <p class="text-left mb5">
                                    <span class="list_img_blue"></span>
                                    <span class="text24">상품이름</span>
                                </p>
                                <p class="text-left text18">
                                    판매가 : 
                                    <span>100,000</span>
                                    원
                                </p>
                                <p class="text-left mt10 text24 text_blue">
                                    총결제금액 : 100,000원
                                </p>
                            </div>
                        </div>

                        <div class="list_item_info mt30">
                            <h3 class="info_title">주문자정보</h3>
                            <table class="order_user_info">
                                <colgroup>
                                    <col style="width: 150px;">
                                    <col>
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th>주문자명</th>
                                        <td>user01</td>
                                    </tr>
                                    <tr>
                                        <th>연락처</th>
                                        <td>010-1234-1234</td>
                                    </tr>
                                    <tr>
                                        <th>이메일</th>
                                        <td>asdf@asdf.asdf</td>
                                    </tr>
                                    <tr>
                                        <th>주소</th>
                                        <td>서울시 강남구 역삼동 테헤란로</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        
                        <div class="list_item_info mt30">
                            <h3 class="info_title">배송지정보</h3>
                        </div>

                        <div class="payBtn_bg">
                            <button id="buy_btn" class="buy_btn">결제하기</button>
                        </div>
                    </div>
			
			
			
			<%-- ================= 상세 정보 보여주기 끝 ================= --%>
		</div>
	</body>
</html>