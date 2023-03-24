<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

		<link type="text/css" rel="stylesheet" href="/resources/include/css/order.css" />
		<!-- iamport.payment.js -->
	    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	    <script src="/resources/include/js/payment.js"></script>
		<script type="text/javascript">
			$(function(){
				$(".content_wrap .page-header h1").html("주문/결제");
				
				let name = $("#sp_name").text();
				let price = $("#sp_price").text().replace(',', '');
				let email = $("#u_email").text();
				let buyer = $("#u_name").text();
				let tel = $("#u_tel").text();
				let address = $("#address").text();
				let zip = $("#zip").text();
				console.log("상품명 : " + name);
				console.log("가격 : " + price);
				console.log("이메일 : " + email);
				console.log("구매자 : " + buyer);
				console.log("연락처 : " + tel);
				console.log("주소 : " + address + ", " + zip);
				
				
			});
			
		</script>
	</head>
	<body>
		<div class="container">
			<form name="f_data" id="f_data" method="post">
				<input type="hidden" id="sp_no" name="sp_no" value="${ detail.sp_no }">
            	<input type="hidden" name="u_no"  value="${ detail.u_no }" />
			</form>
			<%-- ================= 주문 정보 보여주기 시작 ================= --%>
            <div class="info_wrapper">
	            <div class="list_item_info">
	                <h3 class="info_title">상품정보</h3>
	                <div class="box_blue">
	                    <p class="text-left mb5">
	                        <span class="list_img_blue"></span>
	                        <span id="sp_name" class="text24">${detail.sp_name}</span>
	                    </p>
	                    <p class="text-left text18">
	                        판매가 : 
	                        <span id="sp_price">
	                        	<fmt:formatNumber value="${detail.sp_price}" groupingUsed="true"/>
	                        </span>
	                        원
	                    </p>
	                    <p class="text-left mt10 text24 text_blue">
	                        총결제금액 : <fmt:formatNumber value="${detail.sp_price}" groupingUsed="true"/> 원
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
	                            <td id="u_name">${detail.u_name}</td>
	                        </tr>
	                        <tr>
	                            <th>연락처</th>
	                            <td id="u_tel">010-1234-1234</td>
	                        </tr>
	                        <tr>
	                            <th>이메일</th>
	                            <td id="u_email">asdf@asdf.asdf</td>
	                        </tr>
	                        <tr>
	                            <th>주소</th>
	                            <td id="address">서울시 강남구 역삼동 테헤란로</td>
	                        </tr>
	                    </tbody>
	                </table>
	            </div>
	            
	            <div class="list_item_info mt30">
	                <h3 class="info_title">배송지정보</h3>
	            </div>
	
	            <div class="payBtn_bg">
	                <button id="buy_btn" class="btn_blue">결제하기</button>
	            </div>
	        </div>
			<%-- ================= 상세 정보 보여주기 끝 ================= --%>
		</div>
	</body>
</html>