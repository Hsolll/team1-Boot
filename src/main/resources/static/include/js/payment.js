
$(function() {

	$(".content_wrap .page-header h1").html("주문/결제");	

	var IMP = window.IMP;
	IMP.init("imp54405822");

 	let name = $("#sp_name").text();
    let price = $("#sp_price").text().replace(',', '');
    let email = $("#u_email").text();
    let buyer = $("input[name='receiver']").val();
    let tel = $("input[name='receiver_tel']").val();
    
    let address = $("input[name='address1']").val() + ", " + $("input[name='address2']").val();
    console.log("상품명 : " + name);
    console.log("가격 : " + price);
    console.log("이메일 : " + email);
    console.log("구매자 : " + buyer);
    console.log("연락처 : " + tel);
    console.log("우편번호 : " + zip)
    console.log("주소 : " + address);

	$("#buy_btn").click(function() {	// 결제하기 버튼 클릭 시 결제처리 함수 호출

		if($("input[name='address2']").val() == ""){
			alert("상세주소를 입력해주세요.");
			return;
		} else {
			// 배송지 정보를 신규로 작성한 경우 주소 테이블에 정보 추가
			if($("input:radio[id='new']").is(":checked")){	// 배송지 정보를 새로입력 선택 시
				let add_name = $("input[name='add_name']").val();
				let u_no = $("input[name='u_no']").val();
				let zip = $("input[name='zip']").val();
				let address = $("input[name='address1']").val();
				let sub_address = $("input[name='address2']").val();
				$.ajax({
		    		url: "/address/insert", 
		    		type: 'POST',
		    		dataType: 'text',
		    		data: {
						u_no : u_no,
			    		zip : zip,
			    		address : address,
			    		sub_address : sub_address,
			    		add_name : add_name
		    		},
		    		success : function(result){
						
						if(result == "배송지 등록 성공"){
							console.log(reulst);
							payment();
						} else{
							alert(result);
							//location.href="/safe/productOrder?sp_no=" + sp_no;
						}
					},
					error : function() {
						alert("결제 실패");
						//location.href="/safe/productDetail?sp_no=" + sp_no;
					}
		    	});
			} else{
				payment();
			}
		}

	});

});


/* 결제 시 전달할 값을 미리  */
function payment(){
   let data = {
      orderNum : createOrderNum(),
      name : $("#sp_name").text(),
      price : $("#sp_price").text().replace(',', ''),
      email : $("#u_email").text(),
      buyer_name : $("input[name='receiver']").val(),
      tel : $("input[name='receiver_tel']").val(),
      address : $("input[name='address1']").val() + ", " + $("input[name='address2']").val(),
      zip : $("input[name='zip']").val()
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
		    		receiver : rsp.buyer_name,	// 수령인 이름
		    		receiver_tel : rsp.buyer_tel,	// 수령인 연락처
		    		o_address : "(" + rsp.buyer_postcode + ") " + rsp.buyer_addr,	// 배송지 주소
		    		price : rsp.paid_amount
		    		//기타 필요한 데이터가 있으면 추가 전달
	    		},
	    		success : function(result){
					let sp_no = $("input[name='sp_no']").val();
					
					if(result == "결제 성공"){
						alert(result);
						location.href="/order/buyList";
					
					} else{
						alert(result);
						location.href="/safe/productDetail?sp_no=" + sp_no;
					}
				},
				error : function() {
					alert("결제 실패");
					location.href="/safe/productDetail?sp_no=" + sp_no;
				}
	    	});
		} else {			// 결제 실패 시
			let sp_no = $("input[name='sp_no']").val();
			console.log(rsp);
			alert("결제에 실패했습니다.");
			location.href="/safe/productOrder?sp_no=" + sp_no;
		}
	});

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



/*// 결제 성공 시 
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
}*/
