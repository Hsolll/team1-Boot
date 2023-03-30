<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

		<link type="text/css" rel="stylesheet" href="/resources/include/css/insertView.css" />
		<link type="text/css" rel="stylesheet" href="/resources/include/css/order.css" />
		<script type="text/javascript" src="/resources/include/js/common.js" ></script>

		<script type="text/javascript">
		$(function(){
			$(".content_wrap .page-header h1").html("상품등록");

			let u_phone1 = "${fn:substring(memberLogin.u_phone,0,3)}";
			let u_phone2 = "${fn:substring(memberLogin.u_phone,3,7)}";
			let u_phone3 = "${fn:substring(memberLogin.u_phone,7,11)}";
			$("#sp_phone1").val(u_phone1);
			$("#sp_phone2").val(u_phone2);
			$("#sp_phone3").val(u_phone3);
			
			
			$("input:radio[id='no']").is(":checked")
			
			/* option 선택 시 이벤트 */
			$("#selectBox").change(function(){
				console.log($(this).val()); //value값 가져오기
				console.log($("#selectBox option:selected").text()); //text값 가져오기
				let sp_name = $("#selectBox option:selected").text();
				$("#sp_name").val(sp_name);
			});
			
			
			$("#insertBtn").click(function(){
				let u_no = $("#u_id").parents("tr").attr("data-no");
				console.log("u_no = " + u_no);
				
				$("#u_no").val(u_no);
				console.log("u_no : " + $("#u_no").val());
				console.log("sp_title : " + $("#sp_title").val());
				console.log("sp_name : " + $("#sp_name").val());
				console.log("sp_price : " + $("#sp_price").val());
				console.log("sp_content : " + $("#sp_content").val());
				
				// 입력값 체크
				if(!chkData("#sp_title", "제목을")) return;
				else if(!chkData("#sp_name", "상품명을")) return;
				else if(!chkData("#sp_price", "가격을")) return;
				else if(!chkData("#b_pwd", "비밀번호를")) return;
				else {
					if($("#file").val()!=""){ // 업로드할 이미지 파일이 존재한다면
						// 확장자가 png, jpg, gif 외 파일을 업로드 할 수 없습니다 또는 gif, png, jpg 파일만 업로드 할 수 있습니다.  라고 유효성 체크 
						if (!chkFile($("#file"))) return; // 이미지 파일만 업로드 가능. 
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
	                                신한은행 123123123123
	                                <a href="" class="accBtn ml15">입금계좌 등록/변경</a>
	                            </td>
	                        </tr>
	                    </tbody>
	                </table>
	            </div>
	            
	            <div class="list_item_info mt30">
	                <h3 class="info_title">상품정보</h3>
	                <form id="insertForm">
	                	<input type="hidden" name="u_no" id="u_no" />
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
	                                    <input type="text" name="sp_name" id="sp_name" class="w400" maxlength="50" readonly="readonly"/>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>가격</th>
	                                <td>
	                                    <input type="text" name="sp_price" id="sp_price" class="w200 tr pr5" placeholder="0" maxlength="8" /> 원
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>연락처</th>
	                                <td>
	                                    <input type="text" name="sp_phone1" id="sp_phone1" class="w50 tl pl2" maxlength="3" />
	                                    <input type="text" name="sp_phone2" id="sp_phone2" class="w50 tl pl2" maxlength="3" />
	                                    <input type="text" name="sp_phone3" id="sp_phone3" class="w50 tl pl2" maxlength="3" />
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>결제 비밀번호</th>
	                                <td class="pwdRadio">
	                                	<input type="radio" id="no" name="pwdCheck" checked>
	                                    <label for="no" class="mr10">비밀번호 사용안함</label>
	                                    <input type="radio" id="yes" name="pwdCheck">
	                                    <label for="yes" class="mr10">비밀번호 사용</label>
	                                	
	                                    <input type="text" name="sp_pwd" id="sp_pwd" class="w145 pl10" maxlength="15" />
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