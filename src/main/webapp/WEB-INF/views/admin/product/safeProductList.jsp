<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/admin.jspf" %>
<script>
			$(function(){
				let admin = "<c:out value='${adminLogin.a_no }'/>";
				if(admin == ""){
					alert("잘못된 접근입니다.");
					location.href="/admin/login";
				}
				$("#search").change(function(){
					if($("#search").val()=="all"){
						goPage();
					} else if($("#search").val()=="safe_product"){
						goPage();
					}
				});
				
				$(".page-item a").click(function(e){
					e.preventDefault();
					$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
					goPage();
				});
			});
			
			/* 검색을 위한 실질적인 처리 함수 */
			function goPage(){
				var url = "";
				if($("#search").val()=="all"){
					url = "/admin/product/productList"
				} else if($("#search").val()=="safe_product"){
					url = "/admin/product/safeProductList"
				}
				$("#f_search").attr({
					"method":"get",
					"action":url
				});
				$("#f_search").submit();
			}
		</script>
	</head>
	<body>
	<c:if test='${not empty adminLogin }'>
		<div class="contentContainer">
			<!-- <div class="contentTit page-header"><h3 class="text-center">글 목록</h3></div> -->
			<form id="detailForm">
				<input type="hidden" id="p_no" name="p_no">
			</form>
			
			<div id="pSearch" class="text-right">
				<form id="f_search" name="f_search" class="form-inline">
					<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum }">
					<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount }">
					<div class="form-group ml-auto">
							<label>상품 종류 </label>
							<select id="search" name="search" class="form-control m-l-10">
								<option value="all">전체</option>
								<option value="safe_product" selected="selected">안심거래</option>
							</select>
						</div>
				</form>
			</div>
			
			<div id="boardList" class="table-height">
				<table summary="게시판 리스트" class="table table-striped">
					<thead>
						<tr>	
							<th data-value="p_no" class="order text-center col-md-1">상품번호</th>
							<th class="text-center col-md-2">제목</th>
							<th class="text-center col-md-2">상품명</th>
							<th class="text-center col-md-2">가격</th>
							<th class="text-center col-md-2">상태</th>
							<th class="text-center col-md-1">사용자</th>
							<th data-value="b_date" class="order col-md-2">작성일</th>
						</tr>
					</thead>
					<tbody id="list" class="table-striped">
						<c:choose>
							<c:when test="${not empty safeProductList }">
								<c:forEach var="product" items="${safeProductList}" varStatus="status">
									<tr class="text-center" data-num="${product.p_no }">
										<td>${product.sp_no }</td>
										<td class="goDetail text-left">${product.sp_title }</td>
										<td class="name">${product.sp_name }</td>
										<td class="text-center">${product.sp_price }</td>
										<td class="text-center">${product.sp_status }</td>
										<td class="text-center">${product.u_no }</td>
										<td class="text-left">${product.sp_created_at }</td>		
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<td colspan="7" class="tac text-center">등록된 상품이 존재하지 않습니다.</td>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			
			<div class="text-center">
				<nav aria-label="Page navigation example">
					  <ul class="pagination justify-content-center">
					  	<c:if test="${pageMaker.prev}">
						    <li class="page-item disabled">
						    
						      <a class="page-link" href="${pageMaker.startPage -1}" tabindex="-1">Previous</a>
						    </li>
					    </c:if>
					    
					    <c:forEach var="num" begin="${pageMaker.startPage}"
												 end="${pageMaker.endPage}">
						    <li class="page-item ${pageMaker.cvo.pageNum == num ? 'active':''}">
						    	<a class="page-link" href="${num}">${num}</a>
						    </li>
					    </c:forEach>
					    
					    <c:if test="${pageMaker.next}">
						    <li class="page-item">
						      <a class="page-link" href="${pageMaker.endPage + 1}">Next</a>
						    </li>
					    </c:if>
					  </ul>
				</nav>
			</div>
		</div>
		</c:if>
	</body>
</html>