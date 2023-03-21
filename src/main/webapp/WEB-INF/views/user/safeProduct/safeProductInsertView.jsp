<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

		<link type="text/css" rel="stylesheet" href="/resources/include/css/insertView.css" />
		<link type="text/css" rel="stylesheet" href="/resources/include/css/order.css" />

		<script type="text/javascript">
		$(function(){
			$(".content_wrap .page-header h1").html("상품등록");
			

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
	                        <tr>
	                            <th>이름/아이디</th>
	                            <td>홍길동/user01</td>
	                        </tr>
	                        <tr>
	                            <th>연락처</th>
	                            <td>010-1234-1234</td>
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
	                    <table class="order_product_info">
	                        <colgroup>
	                            <col style="width: 150px;">
	                            <col>
	                        </colgroup>
	                        <tbody>
	                            <tr>
	                                <th>제목</th>
	                                <td>
	                                    <input type="text" name="item_title" id="item_title" class="w400" maxlength="50" />
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>상품명</th>
	                                <td>
	                                    <input type="text" name="item_name" id="item_name" class="w400" maxlength="50" />
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>가격</th>
	                                <td>
	                                    <input type="text" name="item_price" id="item_price" class="w200 tr pr5" placeholder="0" maxlength="8" /> 원
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>연락처</th>
	                                <td>
	                                    <input type="text" name="item_tel" id="item_tel" class="w400 pl10" placeholder="'-' 를 제외한 숫자만 입력해주세요." maxlength="15" />
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>상세정보</th>
	                                <td><textarea name="item_detail" id="item_detail" cols="60" class="w700" rows="20"></textarea></td>
	                            </tr>
	                        </tbody>
	                    </table>
	                </form>
	            </div>
	
	            <div class="payBtn_bg">
	                <button id="insertBtn" class="btn_blue">등록하기</button>
	            </div>
	        </div>
			<%-- ================= 입력 정보 보여주기 끝 ================= --%>
		</div>
	</body>
</html>