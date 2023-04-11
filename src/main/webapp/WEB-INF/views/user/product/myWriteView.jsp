<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
		<script type="text/javascript" src="/resources/include/js/paging.js"></script>
		<link rel="stylesheet"
			href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
		<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="//code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
		
		<style>
		</style>
		<script type="text/javascript">
			/*수정하기*/
			$(function() {
				$(".update").click(function() {
					$(this).parents($(".udForm")).attr({
						"method" : "GET",
						"action" : "/product/update"
					})
					$(this).parents($(".udForm")).submit();
				});
		
				$(".delete").click(function() {
					let isBoss = confirm("정말로 삭제하실건가요?");
		
					if (isBoss) {
						$(this).parents($(".udForm")).attr({
							"method" : "GET",
							"action" : "/product/pdelete"
						})
						$(this).parents($(".udForm")).submit();
		
					}
					alert("삭제되었습니다")
		
				})
		
				$(".p_no1").click(function() {
					var p_no = $(this).attr("id")
					location.href = "/product/productDetail?p_no=" + p_no
				})
			});
		</script>
	</head>
	<body>
		<ul class="prdList mt30">
	
			<c:choose>
				<c:when test="${not empty wlist}">
					<c:forEach var="product" items="${wlist}">
						<li>
							<div class="buttonBox">
								<form class="udForm">
									<input type="hidden" name="p_no" value="${product.p_no}" /> 
									<input type="button" class="delete btn w100 mr10" value="삭제" /> 
									<input type="button" class="update btn w100" value="수정" />
								</form>
							</div>
							<div class="heart_con">
								<form class="heartForm">
									<input type="text" name="u_no" class="he u" value="${member.u_no}" readonly /> 
									<input type="text" name="p_no" class="he p" value="${product.p_no}" readonly />
								</form>
								<div class="heart ${product.prod_like }"></div>
							</div>
							<div class="imgBox">
								<c:if test="${not empty product.p_thumb}">
									<img class="thumb_c p_no" id="${product.p_no}" src="/uploadStorage/product/thumbnail/${product.p_thumb}" />
								</c:if>
								<c:if test="${empty product.p_thumb}">
									<img class="p_no" id="${product.p_no}" src="/resources/images/common/noimage.png" />
								</c:if>
	
							</div>
							<div class="txtArea">
								<ul>
									<li class="prdName" id="${product.p_no}">${product.p_title}</li>
									<li class="sellerName" id="${product.u_id}" class="mt10">${product.u_id}</li>
									<li class="subName">${product.p_status}</li>
									<li class="prdPrice"><c:if test="${product.p_price == 0}">무료나눔</c:if>
										<c:if test="${product.p_price != 0}">
											<fmt:formatNumber value="${product.p_price}" groupingUsed="true" />
											<em>원</em>
										</c:if>
									</li>
								</ul>
							</div>
						</li>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<p>상품이 존재하지 않습니다</p>
				</c:otherwise>
			</c:choose>
		</ul>
		<%-- =================== 페이징 출력 시작 (클라이언트 페이징 소스 그대로 가져오기) ============== --%>
		<div class="text-center">
			<ul class="pagination">
				<!-- 이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인. -->
				<c:if test="${pageMaker.prev}">
					<li class="paginate_button previous2">
						<a href="${pageMaker.startPage - 1}">Previous</a>
					</li>
				</c:if>
	
				<!-- 바로가기 번호 출력 -->
				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li class="paginate_button4 ${pageMaker.cvo.pageNum == num ? 'active':''}">
						<a href="#" class="a">${num}</a>
					</li>
				</c:forEach>
	
				<!-- 다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인. -->
				<c:if test="${pageMaker.next}">
					<li class="paginate_button next2">
						<a href="${pageMaker.endPage + 1 }">Next</a>
					</li>
				</c:if>
			</ul>
		</div>
	</body>
</html>