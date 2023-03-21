
$(function() {
	
	var IMP = window.IMP;
	IMP.init("imp54405822");


	$(".content_wrap .page-header h1").html("주문/결제");

	$("#buy_btn").click(function() {	// 결제하기 버튼 클릭 시 결제처리 함수 호출
		requestPay();
	});

});


/* 결제 처리 함수 API */
function requestPay() {
	IMP.request_pay({
		pg: 'html5_inicis',
		pay_method: 'card',
		merchant_uid: createOrderNum(),
		name: '당근 10kg',
		amount: 100,
		buyer_email: 'Iamport@chai.finance',
		buyer_name: '포트원 기술지원팀',
		buyer_tel: '010-1234-5678',
		buyer_addr: '서울특별시 강남구 삼성동',
		buyer_postcode: '123-456'
	}, function(rsp) { // callback
		if (rsp.success) {	// 결제 성공 시
	                    
	        // 주문목록 만드는 함수 -> 함수안에서 ajax로 처리

			location.href = "/safe/productBuy";	// 구매목록으로 이동
			
		} else {			// 결제 싶래 시
			console.log(rsp);
			alert("결제에 실패했습니다.");
		}
	});
}


/* 주문번호 생성 함수 - YYYYMMDD + 랜덤숫자 6자리 */
function createOrderNum() {
	const date = new Date();
	const year = date.getFullYear();
	const month = String(date.getMonth() + 1).padStart(2, "0");
	const day = String(date.getDate()).padStart(2, "0");

	let orderNum = year + month + day;
	for (let i = 0; i < 6; i++) {
		orderNum += Math.floor(Math.random() * 8);
	}
	return orderNum;
}