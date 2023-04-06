<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

		<link type="text/css" rel="stylesheet" href="/resources/include/css/insertView.css" />
		<link type="text/css" rel="stylesheet" href="/resources/include/css/order.css" />
		<script type="text/javascript" src="/resources/include/js/common.js" ></script>

		<script type="text/javascript">
		$(function(){
			$(".content_wrap .page-header h1").html("상품등록");
			
			/* 전화번호 자동 입력 */
			let u_phone1 = "${fn:substring(memberLogin.u_phone,0,3)}";
			let u_phone2 = "${fn:substring(memberLogin.u_phone,3,7)}";
			let u_phone3 = "${fn:substring(memberLogin.u_phone,7,11)}";
			$("#sp_phone1").val(u_phone1);
			$("#sp_phone2").val(u_phone2);
			$("#sp_phone3").val(u_phone3);
			
			
			/* 가격입력창 숫자만 입력 */
			$('input[onlyNumber]').on('keyup', function () {
				
			    $(this).val($(this).val().replace(/[^0-9]/g, ""));
			    
			});
			
			
			/* 계좌정보 등록버튼 클릭 시 */
			$("#insertButton").click(function(){
				let bank = $("#bankSelect option:selected").val();
				console.log("bank : " + bank);
				
				let account = $("input[name='account']").val();
				console.log("account : " + account);
				
				$("#bank").val(bank);
				$("#account").val(account);
				
				let value = JSON.stringify({
					u_no : $("#u_no").val(),
					bank : $("#bank").val(),
					account : $("#account").val()
				});
				
				$.ajax({
		    		url: "/account/insertAccount",
		    		type: 'post',
		    		headers : {
						"Content-Type":"application/json"
					},
					dataType : "text",
					data: value,
		    		success : function(result){
		    			if(result == "success"){
							console.log("계좌정보가 등록되었습니다.");
							// 전송 후 입력값 초기화
							$("#u_no").val("");
							$("#bank").val("");
							$("#account").val("");
		    			}else{
		    				alert("계좌정보 등록을 실패했습니다.");
		    				return;
		    			}
					},
					error : function() {
						alert("계좌정보 등록을 실패했습니다.");
					}
		    	});
			});
			
			/* 계좌정보 수정버튼 클릭 시 */
			$("#updateButton").click(function(){
				let bank = $("#bankSelect option:selected").val();
				
				let account = $("input[name='account']").val();
				
				let userNum = $("input[name='userNum']").val();
				
				
				let value = JSON.stringify({
					u_no : userNum,
					bank : bank,
					account : account
				});
				
				$.ajax({
		    		url: "/account/updateAccount",
		    		type: 'post',
		    		headers : {
						"Content-Type":"application/json"
					},
					dataType : "text",
					data: value,
		    		success : function(result){
		    			if(result == "success"){
							console.log("계좌정보가 수정되었습니다.");
							// 전송 후 입력값 초기화
							$("#userNum").val("");
							$("#bank").val("");
							$("#account").val("");
							
							location.href = "/safe/productInsertView";
							
		    			}else{
		    				alert("계좌정보 수정을 실패했습니다.");
		    				return;
		    			}
					},
					error : function() {
						alert("계좌정보 수정을 실패했습니다.");
					}
		    	});
			});
			
			
			/* 입력버튼 클릭 시 */
			$("#insertBtn").click(function(){
				let u_no = $("#u_id").parents("tr").attr("data-no");
				console.log("u_no = " + u_no);
				let p_no = $("#selectBox option:selected").attr("data-no");
				console.log("p_no : " + p_no);
				
				$("#u_no").val(u_no);
				$("#p_no").val(p_no);
				console.log("u_no : " + $("#u_no").val());
				console.log("p_no : " + $("#p_no").val());
				console.log("sp_title : " + $("#sp_title").val());
				console.log("sp_name : " + $("#sp_name").val());
				console.log("sp_price : " + $("#sp_price").val());
				console.log("sp_content : " + $("#sp_content").val());
				
				if($("input:radio[id='yes']").is(":checked")){
					if(!chkData("#sp_pwd", "비밀번호를")) return;
				}
				
				console.log("입력한 상품 가격 : " + $("#sp_price").val());
				
				// 입력값 체크
				if(!chkData("#sp_title", "제목을")) return;
				//else if(!selectData("#sp_name", "상품을")) return;
				else if(!chkData("#sp_price", "가격을")) return;
				else if(!chkData("#sp_price", "가격을")) return;
				else if(!chkData("#sp_content", "내용을")) return;
				else {
					
					if($("#sp_price").val() < 1000){
						alert("상품 가격은 1000원보다 작을 수 없습니다.");
						return;
					}
					
					$("#insertForm").attr({
						"method":"post",
						"enctype":"multipart/form-data", // enctype 속성의 기본 값은 "application/x-www-form-urlcencoded". POST방식 폼 전송에 기본 값으로 사용
						"action":"/safe/productInsert"
					});
					$("#insertForm").submit();
				}
				
			});

		});
		</script>
	</head>
	<body>
	
		<c:if test="${!empty msg}">
			<script>
				alert("${msg}");
				<c:remove var="msg"/>
			</script>
		</c:if>
		
		<!-- Modal -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document" style="top: 250px;">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalCenterTitle">계좌관리</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
					  	</button>
					</div>
					<div class="modal-body">
						<h4>계좌번호 등록하기</h4>
						
						<div class="list_item_info mt30">
			                <form id="accInsertForm">
			                	<input type="hidden" name="u_no" />
			                	<input type="hidden" name="p_no" />
			                    <table class="order_product_info">
			                        <colgroup>
			                            <col style="width: 140px;">
			                            <col>
			                        </colgroup>
			                        <tbody>
			                        	<tr>
			                                <th>은행명</th>
			                                <td>
			                                    <select id="bankSelect" class="w200" >
			                                    	<option value="${ account.bank }">${ account.bank }</option>
			                                    	<option value=HSBC은행>HSBC은행</option>
											 		<option value="KEB하나은행">KEB하나은행</option>
											 		<option value="SC은행">SC은행</option>
											 		<option value="경남은행">경남은행</option>
											 		<option value="광주은행">광주은행</option>
											 		<option value="국민은행">국민은행</option>
											 		<option value="기업은행">기업은행</option>
											 		<option value="농협">농협</option>
											 		<option value="대구은행">대구은행</option>
											 		<option value="부산은행">부산은행</option>
											 		<option value="산업은행">산업은행</option>
											 		<option value="새마을금고">새마을금고</option>
											 		<option value="수협">수협</option>
											 		<option value="신한은행">신한은행</option>
											 		<option value="신협">신협</option>
											 		<option value="우리은행">우리은행</option>
											 		<option value="전북은행">전북은행</option>
											 		<option value="제주은행">제주은행</option>
											 		<option value="카카오뱅크">카카오뱅크</option>
											 		<option value=케이뱅크>케이뱅크</option>
											 		<option value="한국씨티은행">한국씨티은행</option>
			                                    </select>
			                                </td>
			                            </tr>
			                            <tr>
			                                <th>예금주</th>
			                                <td>
			                                    <input type="text" name="u_name" class="w200" value="${ memberLogin.u_name }" readonly="readonly"/>
			                                    <input type="hidden" id="userNum" name="userNum" value="${ memberLogin.u_no }" />
			                                </td>
			                            </tr>
			                            <tr>
			                                <th>계좌번호</th>
			                                <td>
			                                    <input type="text" name="account" id="account" class="w200 tl pr5" value="${ account.account }" maxlength="20" autocomplete="off" />
			                                </td>
			                            </tr>
			                        </tbody>
			                    </table>
			                </form>
			            </div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
						<c:choose>
							<c:when test="${ not empty account }">
								<button type="button" class="btn btn-primary" id="updateButton">수정하기</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-primary" id="insertButton">등록하기</button>
							</c:otherwise>
						</c:choose>
						
					</div>
				</div>
			</div>
		</div>
		
		<div class="container">
			
			<%-- ================= 입력 정보 보여주기 시작 ================= --%>
            <div class="info_wrapper">

	            <div class="list_item_info mt30">
	                <h3 class="info_title">판매자정보</h3>
	                <table class="order_user_info">
	                    <colgroup>
	                        <col style="width: 150px;">
	                        <col>
	                    </colgroup>
	                    <tbody>
	                        <tr data-no="${memberLogin.u_no}">
	                            <th>이름/아이디</th>
	                            <td id="u_id">${memberLogin.u_name}/${memberLogin.u_id}</td>
	                        </tr>
	                        <tr>
	                            <th>연락처</th>
	                            <td>
	                            	${fn:substring(memberLogin.u_phone,0,3)}-${fn:substring(memberLogin.u_phone,3,7)}-${fn:substring(memberLogin.u_phone,7,11)}
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>계좌번호</th>
	                            <td>
	                            	<c:choose>
										<c:when test="${ not empty account }">
											<span>${ account.bank }</span>&nbsp;&nbsp;${ account.account }
										</c:when>
										<c:otherwise>
											<span>계좌번호를 등록해주세요.</span>
										</c:otherwise>
									</c:choose>
	                                <button type="button" id="accInsertBtn" class="accBtn ml15" data-toggle="modal" data-target="#exampleModalCenter">입금계좌 등록/변경</button>
	                            </td>
	                        </tr>
	                    </tbody>
	                </table>
	            </div>
	            
	            <div class="list_item_info mt30">
	                <h3 class="info_title">상품정보</h3>
	                <form id="insertForm">
	                	<input type="hidden" name="u_no" id="u_no" />
	                	<input type="hidden" name="p_no" id="p_no" />
	                    <table class="order_product_info">
	                        <colgroup>
	                            <col style="width: 150px;">
	                            <col>
	                        </colgroup>
	                        <tbody>
	                        	<tr>
	                                <th>상품 선택</th>
	                                <td>
	                                    <select id="selectBox">
	                                    	<option>상품을 선택해주세요</option>
	                                    	<c:choose>
												<c:when test="${ not empty productList }">
													<c:forEach var="productList" items="${ productList }" varStatus="status">
														<option data-no="${productList.p_no}" value="${productList.p_name}">${productList.p_name}</option>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<tr>
														<td colspan="4" class="tac text-center">등록된 상품 정보가 존재하지 않습니다.</td>
													</tr>
												</c:otherwise>
											</c:choose>
	                                    </select>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>제목</th>
	                                <td>
	                                    <input type="text" name="sp_title" id="sp_title" class="w400" maxlength="50" />
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>상품명</th>
	                                <td>
	                                    <input type="text" name="sp_name" id="sp_name" class="w400" placeholder="상품을 선택해주세요." maxlength="50" readonly="readonly"/>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>가격</th>
	                                <td>
	                                    <input type="text" onlyNumber name="sp_price" id="sp_price" class="w200 tr pr5" placeholder="0" maxlength="8" /> 원
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>연락처</th>
	                                <td>
	                                    <input type="text" name="sp_phone1" id="sp_phone1" class="w50 tl pl2" maxlength="3" readonly="readonly" />
	                                    <input type="text" name="sp_phone2" id="sp_phone2" class="w50 tl pl2" maxlength="3" readonly="readonly" />
	                                    <input type="text" name="sp_phone3" id="sp_phone3" class="w50 tl pl2" maxlength="3" readonly="readonly" />
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>결제 비밀번호</th>
	                                <td class="pwdRadio">
	                                	<input type="radio" id="no" name="pwdCheck" checked>
	                                    <label for="no" class="mr10">비밀번호 사용안함</label>
	                                    <input type="radio" id="yes" name="pwdCheck">
	                                    <label for="yes" class="mr10">비밀번호 사용</label>
	                                	
	                                    <input type="password" name="sp_pwd" id="sp_pwd" class="w145 pl10" maxlength="15" />
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>상세정보</th>
	                                <td><textarea name="sp_content" id="sp_content" cols="60" class="w700" rows="20"></textarea></td>
	                            </tr>
	                        </tbody>
	                    </table>
	                </form>
	            </div>
	
	            <div class="payBtn_bg">
	                <button type="button" id="insertBtn" class="btn_blue">등록하기</button>
	            </div>
	        </div>
			<%-- ================= 입력 정보 보여주기 끝 ================= --%>
		</div>
	</body>
</html>