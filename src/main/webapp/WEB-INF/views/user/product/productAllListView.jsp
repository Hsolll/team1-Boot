<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- <script type="text/javascript" src="/resources/include/js/productCommon.js"></script> -->
<script type="text/javascript" src="/resources/include/js/heart.js"></script>
<script type="text/javascript" src="/resources/include/js/paging.js"></script>
<script type="text/javascript">
	$(".p_no").click(function(){
		let p_no = $(this).attr("id")
		console.log(p_no)
		location.href = "/product/productDetail?p_no="+p_no
	})

</script>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>썸네일</th>
				<th>제목</th>
<!-- 				<th>상품번호</th> -->
				<th>카테고리</th>
				<th>상품이름</th>
				<th>상품가격</th>
				<th>상품상태</th>
			</tr>
		</thead>
		
		
		<tbody>
			<c:choose>
				<c:when test="${not empty productList}">
					<c:forEach var="product" items="${productList}">
					<tr>
						<td class="thumb">
								<div class="heart_con">
									<div class="heart ${product.prod_like}">
									</div>
									<form class="heartForm">
										<input type="text" name="prod_like" class="like he" value="1" readonly/>
										<input type="text" name="u_no" class="he" value="${member.u_no}" readonly/>
										<input type="text" name="p_no" class="he" value="${product.p_no}" readonly/>
									</form>
								</div>
<!-- 									<input name="prod_like" class="heart" type="button" value="하트"/> -->
							<c:if test="${not empty product.p_thumb}">
								<img class="thumb_c p_no" id="${product.p_no}" src="/uploadStorage/product/thumbnail/${product.p_thumb}"/>
							</c:if>
							<c:if test="${empty product.p_thumb}">
								<img class="p_no" id="${product.p_no}" src="/resources/images/common/noimage.png"/>
							</c:if>
						</td>
						<td class="p_no" id="${product.p_no}">${product.p_title}</td>
<%-- 						<td class="p_no">${product.p_no}</td> --%>
						<td>${product.p_cate}</td>
						<td>${product.p_name}</td>
						<td>
						  <c:if test="${product.p_price == 0}">무료나눔</c:if>
						  <c:if test="${product.p_price != 0}">${product.p_price}</c:if>
						</td>
						<td>${product.p_status}</td>
					</tr>
					
					</c:forEach>
				</c:when>
				<c:otherwise>
					<p>상품이 존재하지 않습니다</p>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<%-- =================== 페이징 출력 시작 (클라이언트 페이징 소스 그대로 가져오기) ============== --%>
	<div class="text-center">
		<ul class="pagination">
			<!-- 이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인. -->
			<c:if test="${pageMaker.prev}">
				<li class="paginate_button previous">
					<a href="${pageMaker.startPage - 1}">Previous</a>
				</li>
			</c:if>
					
			<!-- 바로가기 번호 출력 -->
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active':''}">
					<a href="#">${num}</a>
				</li>
			</c:forEach>
	
			<!-- 다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인. -->
			<c:if test="${pageMaker.next}">
				<li class="paginate_button next">
					<a href="${pageMaker.endPage + 1 }">Next</a>
				</li>
			</c:if> 
		</ul>
	</div>

</body>
</html>