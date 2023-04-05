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
					} else if($("#search").val()=="product"){
						goPage();
					} else if($("#search").val()=="safe_product"){
						goPage();
					}
				});
				
				$(".paginate_button a").click(function(e){
					e.preventDefault();
					$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
					goPage();
				});
			});
			
			/* 검색을 위한 실질적인 처리 함수 */
			function goPage(){
				var url = "";
				if($("#search").val()=="product"){
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
					<div class="form-group">
						<label>검색조건</label>
						<select id="search" name="search" class="form-control">
							<option value="all">전체</option>
							<option value="product">일반</option>
							<option value="safe_product">안심거래</option>
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
							<c:when test="${not empty allProductList }">
								<c:forEach var="product" items="${allPproductList}" varStatus="status">
									<tr class="text-center" data-num="${product.p_no }">
										<td>${product.p_no }</td>
										<td class="goDetail text-left">${product.p_title }</td>
										<td class="name">${product.p_name }</td>
										<td class="text-center">${product.p_price }</td>
										<td class="text-center">${product.p_status }</td>
										<td class="text-center">${product.u_no }</td>
										<td class="text-left">${product.p_created_at }</td>		
									</tr>
								<c:if test="${not empty product.sp_no }">
									<tr class="text-center">
										<td>${product.sp_no }</td>
										<td class="text-left">${product.sp_title }</td>
										<td class="name">${product.p_name }</td>
										<td class="text-center">${product.p_price }</td>
										<td class="text-center">${product.sp_status }</td>
										<td class="text-center">${product.u_no }</td>
										<td class="text-left">${product.sp_created_at }</td>	
									</tr>	
								</c:if>
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
				<ul class="pagination">
					<!-- 이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인 -->
					<c:if test="${pageMaker.prev }">
						<li class="paginate_button previous">
							<a href="${pageMaker.startPage -1 }">Previous</a>
						</li>
					</c:if>
					
					<!-- 바로가기 번호 출력 -->
					<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
						<li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active':''}">
							<a href='${num }'>${num }</a>
						</li>
					</c:forEach>
					
					<!--  다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인 -->
					<c:if test="${pageMaker.next }">
						<li class="paginate_button next">
							<a href="${pageMaker.endPage+1 }">Next</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
		</c:if>
	</body>
</html>