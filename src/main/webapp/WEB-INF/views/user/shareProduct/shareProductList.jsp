<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		
		<link rel="stylesheet" type="text/css" href="/resources/include/css/product.css">
		<script type="text/javascript">
			$(function(){
				$(".content_wrap .page-header h1").html("나눔상품 목록");
				
				
				//-----------------------------// 상세페이지 이동 //--------------------------------------------//
				$(".p_no").click(function(){
					let p_no = $(this).attr("id")
					console.log(p_no)
					location.href = "/product/productDetail?p_no="+p_no
				});
				
			});
		</script>
	</head>
	<body>
		<div class="contentContainer container">
			<ul class="prdList mt30">
		     	<c:choose>
		       		<c:when test="${not empty productList}">
		         		<c:forEach var="product" items="${productList}">
		           			<li>
		               			<div class="imgBox">
			                  	 	<c:if test="${not empty product.p_thumb}">
			                        	<img class="thumb_c p_no" id="${product.p_no}" src="/uploadStorage/product/thumbnail/${product.p_thumb}"/>
			                     	</c:if>
			                     	<c:if test="${empty product.p_thumb}">
			                        	<img class="p_no" id="${product.p_no}" src="/resources/images/common/noimage.png"/>
			                     	</c:if>
		               			</div>
				               	<div class="txtArea">
			                  		<ul>
			                     		<li class="prdName" id="${product.p_no}">${product.p_title}</li>
			                     		<li class="sellerName" id="${product.u_id}" class="mt10">${product.u_id}</li>
				                     	<li class="subName">${product.p_status}</li>
				                     	<li class="prdPrice text-center">무료나눔</li>
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
		   	<%-- =================== 페이징 출력 시작 (클라이언트 페이징 소스 그대로 가져오기) ============== 
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
							<a href="#" class="a">${num}</a>
						</li>
					</c:forEach>
			
					<!-- 다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인. -->
					<c:if test="${pageMaker.next}">
						<li class="paginate_button next">
							<a href="${pageMaker.endPage + 1 }">Next</a>
						</li>
					</c:if> 
				</ul>
			</div> --%>
		</div>
	</body>
</html>