<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

      <link type="text/css" rel="stylesheet" href="/resources/include/css/order.css" />
      <link type="text/css" rel="stylesheet" href="/resources/include/css/insertView.css" />
      <!-- iamport.payment.js -->
       <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
       <!-- 주소 검색 api -->
       <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
       
       <script src="/resources/include/js/payment.js"></script>
      <script type="text/javascript">
         $(function(){
            
            let name = $("#sp_name").text();
            let price = $("#sp_price").text().replace(',', '');
            let email = $("#u_email").text();
            let buyer = $("input[name='receiver']").val();
            let tel = $("input[name='receiver_tel']").val();
            let zip = $("input[name='zip']").val();
            let address = $("input[name='address1']").val() + ", " + $("input[name='address2']").val();
            console.log("상품명 : " + name);
            console.log("가격 : " + price);
            console.log("이메일 : " + email);
            console.log("구매자 : " + buyer);
            console.log("연락처 : " + tel);
            console.log("우편번호 : " + zip)
            console.log("주소 : " + address);
            
            
            
            $("input[id='new']").click(function(){
               console.log("new 클릭");
               
               $("input[name='receiver']").val("");
               $("input[name='receiver_tel']").val("");
               $("input[name='zip']").val("");
               $("input[name='address1']").val("");
               $("input[name='address2']").val("");
               
            });
            
            $("input[id='same']").click(function(){
               console.log("same 클릭");
               
               $("input[name='receiver']").val("${memberLogin.u_name}");
               $("input[name='receiver_tel']").val("${memberLogin.u_phone}");
               $("input[name='zip']").val("${address.zip}");
               $("input[name='address1']").val("${address.address}");
               $("input[name='address2']").val("${address.sub_address}");
               
            });
            
            $("#address_btn").click(function(){
               execPostCode();
            });
            
            function execPostCode() {
                  new daum.Postcode({
                      oncomplete: function(data) {
                         // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
          
                         // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                         // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                         var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                         var extraRoadAddr = ''; // 도로명 조합형 주소 변수
          
                         // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                         // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                         if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                             extraRoadAddr += data.bname;
                         }
                         // 건물명이 있고, 공동주택일 경우 추가한다.
                         if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                         }
                         // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                         if(extraRoadAddr !== ''){
                             extraRoadAddr = ' (' + extraRoadAddr + ')';
                         }
                         // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                         if(fullRoadAddr !== ''){
                             fullRoadAddr += extraRoadAddr;
                         }
          
                         // 우편번호와 주소 정보를 해당 필드에 넣는다.
                         console.log(data.zonecode);
                         console.log(fullRoadAddr);
                         
                         
                         $("input[name='zip']").val(data.zonecode);
                         $("input[name='address1']").val(fullRoadAddr);
                         
                         /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                         document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
                         document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
                     }
                  }).open();
              }

            
            
         });
         
      </script>
   </head>
   <body>
      <div class="container">
         <form name="f_data" id="f_data" method="post">
            <input type="hidden" id="sp_no" name="sp_no" value="${ detail.sp_no }">
               <input type="hidden" name="u_no"  value="${ memberLogin.u_no }" />
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
                               <td id="u_name">${memberLogin.u_name}</td>
                           </tr>
                           <tr>
                               <th>연락처</th>
                               <td id="u_tel">${memberLogin.u_phone}</td>
                           </tr>
                           <tr>
                               <th>이메일</th>
                               <td id="u_email">${memberLogin.u_email}</td>
                           </tr>
                           <tr>
                               <th>주소</th>
                               <td id="address">${address.full_address}</td>
                           </tr>
                       </tbody>
                   </table>
               </div>
               
               <div class="list_item_info mt30">
                   <h3 class="info_title">배송지정보</h3>
                   <form id="addressForm">
                       <table class="order_product_info">
                           <colgroup>
                               <col style="width: 150px;">
                               <col>
                           </colgroup>
                           <tbody>
                               <tr>
                                   <th>배송지 정보</th>
                                   <td>
                                       <input type="radio" id="same" name="delevery_info" checked>
                                       <label for="same" class="mr10">주문자정보와 동일</label>
                                       <input type="radio" id="new" name="delevery_info">
                                       <label for="new" class="mr10">새로입력</label>
                                   </td>
                               </tr>
                               <tr>
                                   <th>배송받는 분</th>
                                   <td>
                                       <input type="text" name="receiver" class="w200" maxlength="10" value="${memberLogin.u_name}" />
                                   </td>
                               </tr>
                               <tr>
                                   <th>휴대폰</th>
                                   <td>
                                       <input type="text" name="receiver_tel" class="w200" maxlength="12" value="${memberLogin.u_phone}" />
                                   </td>
                               </tr>
                               <tr>
                                   <th>주소</th>
                                   <td>
                                       <input type="text" name="zip" id="zip" class="w70" maxlength="7" value="${address.zip}" readonly="readonly" />
                                       <button type="button" id="address_btn" class="address_btn">주소찾기</button>
                                       <input type="text" id="address1" name="address1" class="w500 db" placeholder="주소를 입력하세요." value="${address.address}" readonly="readonly"  />
                                       <input type="text" id="address2" name="address2" class="w500 db" placeholder="상세주소를 입력하세요." value="${address.sub_address}" />
                                   </td>
                               </tr>
                           </tbody>
                       </table>
                   </form>
               </div>
               
               <div class="payway">
                   <div class="mt30">
                       <h3 class="info_title">결제방법 선택</h3>
                       <div class="box_blue">
                           <p class="text-left mt10 text24 text_blue">
                               총결제금액 : <fmt:formatNumber value="${detail.sp_price}" groupingUsed="true"/> 원
                           </p>
                           <div class="mt15 hr_top p15 pl0">
                               <input type="radio" id="card" name="card" value="card" checked />
                               <label for="card">신용카드</label>
                           </div>
                           <ul class="pt10 hr_top txt12">
                               <li>- 불법신용카드 거래 시 민형사상의 책임을 질 수 있습니다. </li>
                           </ul>
                       </div>
                   </div>
               </div>
   
               <div class="payBtn_bg">
                   <button id="buy_btn" class="btn_blue">결제하기</button>
               </div>
           </div>
         <%-- ================= 상세 정보 보여주기 끝 ================= --%>
      </div>
   </body>
</html>