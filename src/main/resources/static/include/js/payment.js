
$(function() {
	
	$(".content_wrap .page-header h1").html("주문/결제");
	
	var IMP = window.IMP;
	IMP.init("imp54405822");

	$("#buy_btn").click(function() {	// 결제하기 버튼 클릭 시 결제처리 함수 호출
		payment();
	});

});


function payment(){
	let data = {
		orderNum : createOrderNum(),
		name : $("#sp_name").text(),
		price : $("#sp_price").text().replace(',', ''),
		email : $("#u_email").text(),
		buyer_name : $("#u_name").text(),
		tel : $("#u_tel").text(),
		address : '서울시 강남구 역삼동 테헤란로' /*$("#address").text()*/,
		zip : '123-456' /*$("#zip").text()*/
	}
	console.log("data : " + data);
	console.log(data.orderNum);
	
	requestPay(data);
}


/* 결제 처리 함수 API */
function requestPay(data) {
	IMP.request_pay({
		pg: 'html5_inicis',
		pay_method: 'card',
		merchant_uid: data.orderNum,
		name: data.name,
		amount: data.price,
		buyer_email: data.email,
		buyer_name: data.buyer_name,
		buyer_tel: data.tel,
		buyer_addr: data.address,
		buyer_postcode: data.zip
	}, function(rsp) { // callback
		if (rsp.success) {	// 결제 성공 시
			console.log("결제를 성공했습니다.");
			
			console.log(rsp);
			
			let sp_no = $("input[name='sp_no']").val();
			console.log("sp_no : " + sp_no);
			let u_no = $("input[name='u_no']").val();
			console.log("u_no : " + u_no);
			
	    	//서버에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	    	$.ajax({
	    		url: "/payments/complete", 
	    		type: 'POST',
	    		dataType: 'text',
	    		data: {
					sp_no : sp_no,	// 상품번호
					u_no : u_no,	// 회원번호
		    		pay_id : rsp.imp_uid,	// 결제번호
		    		o_id : rsp.merchant_uid,	// 주문번호
		    		price : rsp.paid_amount
		    		//기타 필요한 데이터가 있으면 추가 전달
	    		},
	    		success : function(result){
					alert(result);
				
					location.href="/safe/productBuy";
				
				},
				error : function() {
					alert("결제 실패");
						
					location.href="/safe/productDetail?sp_no=" + sp_no;
				}
	    		
	    	});
	    	
		} else {			// 결제 실패 시
			console.log(rsp);
			alert("결제에 실패했습니다.");
		}
	});
}


// 결제 성공 시 
function paymentComplete(data) {
	
	 $.ajax({
		url: "/payment/complete",
        method: "POST",
        data: data,
	})
	.done(function(result) {
        swal({
			text: result,
			closeOnClickOutside : false
		})
		.then(function(){
			location.replace("/safe/productBuy");
		})
	}) // done 
    .fail(function() {
		alert("에러");
		location.replace("/");
	}) 
}


/* 주문번호 생성 함수 - YYYYMMDD + 랜덤숫자 6자리 */
function createOrderNum() {
	const date = new Date();
	const year = date.getFullYear();
	const month = String(date.getMonth() + 1).padStart(2, "0");
	const day = String(date.getDate()).padStart(2, "0");

	let orderNum = year + month + day + "-";
	for (let i = 0; i < 8; i++) {
		orderNum += Math.floor(Math.random() * 8);
	}
	return orderNum;
}