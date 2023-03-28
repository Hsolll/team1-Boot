<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/resources/include/js/productCommon.js"></script>
<style type="text/css">
	table,th,td{
					border:1px solid black;
					border-collapse: collapse;
					
				}
		table#detailTable{
					width : 1000px;
		}
		table#replyTable,table.replyTable{
					width:500px;
		}
		#replyTr,.replyTr{
			height: 100px;
		}
		#replyUserId,.replyUserId{
			height: 50px;
		}
		#replyInput,.replyInput{
			width: 300px;
			height: 100px;
		}
		
		
		
		
</style>

</head>
<body>
	<h1><a href="/">OH MY BABY</a></h1>
<!-- 		중고마켓 페이지로 돌아가기 -->
	<h2><a href="/product/productList">중고마켓페이지</a></h2>
	<p>${member.u_name}님 안녕하세요</p>
	<h1>상세페이지</h1>
	<div id="detail">
		<table id="detailTable">
			<thead>
				<tr>
					<th>상품이미지</th>
<!-- 					<th>상품번호</th> -->
<!-- 					<th>회원번호</th> -->
					<th>카테고리</th>
					<th>상품제목</th>
					<th>상품이름</th>
					<th>상품가격</th>
					<th>상품상태</th>
					<th>상품상세설명</th>
					<th>지역</th>
					<th>거래방법</th>
					<th>등록일</th>
<!-- 					<th>관리자 승인여부</th> -->
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<c:if test="${not empty detail.p_file}">
							<img src="/uploadStorage/product/${detail.p_file}"/>
						</c:if>
						
						<c:if test="${empty detail.p_file}">
							<img src="/resources/images/common/noimage.png"/>
						</c:if>
					</td>
<%-- 					<td><input type="hidden" value="${detail.p_no}"/></td> --%>
<%-- 					<td>${detail.u_no}</td> --%>
					<td>${detail.p_cate}</td>
					<td>${detail.p_title}</td>
					<td>${detail.p_name}</td>
					<td>
						<c:if test="${detail.p_price == 0}">무료나눔</c:if>
					    <c:if test="${detail.p_price != 0}">${detail.p_price}</c:if>	
					</td>
					<td>${detail.p_status}</td>
					<td>${detail.p_content}</td>
					<td>${detail.p_local}</td>
					<td>${detail.trans_method}</td>
					<td>${detail.p_created_at}</td>
<%-- 					<td>${detail.p_adm_per}</td> --%>
				</tr>
			</tbody>
		</table>
	</div>
 	<h1>댓글</h1>
 	<div id="reply">
 		<h2>작성하기</h2>
 		<form id="replyForm">
	 		<table id="replyTable">
	 			<tr id="replyUserId">
	 				<th>유저닉네임</th>
	 				<td colspan="2">${member.u_nick}</td>
	 			</tr>
	 			<tr id="replyTr">
	 				<th>댓글내용</th>
	 				<td>
						<input type="hidden" name="p_no" value="${detail.p_no}" readonly/><br>
						<input type="hidden" name="u_no" value="${member.u_no}" readonly><br>
		 				<input id="replyInput" name="pr_content" type="text" placeholder="댓글을 입력해주세요"/><br>
		 				<input id="replyConfirm" type="button" value="등록"/><br>
	 				</td>
	 			</tr>
	 		</table>
 		</form>
 		
 		
 		<h2>댓글조회</h2>
 		<table class="replyTable">
	 		<c:choose>
	 			<c:when test="${not empty list}">
	 				<c:forEach var="rlist" items="${list}">
	 					<tr class="replyUserId">
			 				<th>유저닉네임</th>
			 				<td>${rlist.u_nick}</td>
			 				<td>${rlist.pr_created_at}</td>
			 			</tr>
			 			<tr class="replyTr">
			 				<th>댓글내용</th>
			 				<td colspan="2">
			 					<div class="replyInput">${rlist.pr_content}</div>
			 				</td>
			 			</tr>
	 				</c:forEach>
	 			</c:when>
	 			<c:otherwise>
	 				<p>비어있습니다</p>
	 			</c:otherwise>
	 		</c:choose>
 		</table>
 	</div>
 	
 	
 	
 	
</body>
</html>