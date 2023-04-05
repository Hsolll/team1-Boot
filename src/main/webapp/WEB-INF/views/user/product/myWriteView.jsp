<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script type="text/javascript" src="/resources/include/js/paging.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
 <script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
 <script src="//code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
 
 <style>

 </style>
<script type="text/javascript">
/*수정하기*/
	$(function(){
		$(".update").click(function(){
			$(this).parents($(".udForm")).attr({
				"method" : "GET",
				"action" : "/product/update"
			})
			$(this).parents($(".udForm")).submit();
		});
		
		
		$(".delete").click(function(){
			let isBoss = confirm("정말로 삭제하실건가요?");
	
			if(isBoss) {
			    $(this).parents($(".udForm")).attr({
					"method" : "GET",
					"action" : "/product/pdelete"
				})
				$(this).parents($(".udForm")).submit();
				
			}
			alert("삭제되었습니다")
			
			
		})
		
		$(".p_no1").click(function(){
			var p_no = $(this).attr("id")
			location.href = "/product/productDetail?p_no="+p_no
		})
	});

</script>
</head>
<body>
<table>
		<c:choose>
			<c:when test="${not empty wlist}">
				<c:forEach var="product" items="${wlist}">
				<tr>
						<td class="thumb">
							<div class="p_status">${product.p_status}</div>
								<div class="heart_con">
									<div class="heart ${product.prod_like}">
									</div>
									<form class="heartForm">
										<input type="text" name="prod_like" class="like he" value="1" readonly/>
										<input type="text" name="u_no" class="he un" value="${member.u_no}" readonly/>
										<input type="text" name="p_no" class="he" value="${product.p_no}" readonly/>
									</form>
								</div>
							<c:if test="${not empty product.p_thumb}">
								<img class="thumb_c p_no1" id="${product.p_no}" src="/uploadStorage/product/thumbnail/${product.p_thumb}"/>
							</c:if>
							<c:if test="${empty product.p_thumb}">
								<img class="p_no1" id="${product.p_no}" src="/resources/images/common/noimage.png"/>
							</c:if>
							<div class="p_info">
							<div class="tit">
								<div class="p_title" id="${product.p_no}">${product.p_title}</div>
							  <c:if test="${product.p_price == 0}">무료나눔</c:if>
						 	 <c:if test="${product.p_price != 0}">${product.p_price}원</c:if>
							</div>
							
						</div>
						<div>
					    	<form class="udForm">
					    		<input type="hidden" name="p_no" value="${product.p_no}"/>
								<input type="button" class="delete" value="삭제"/>
								<input type="button" class="update" value="수정"/>
							</form>
						</div>
					</td>
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<p>상품이 존재하지 않습니다</p>
			</c:otherwise>
		</c:choose>
	</table>
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
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<li class="paginate_button4 ${pageMaker.cvo.pageNum == num ? 'active':''}">
					<a href="#">${num}</a>
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