<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/admin.jspf" %>
<script>
			$(function(){
				
				let word="<c:out value='${ProductVO.keyword}' />";
				let value="";
				if(word!= ""){
					$("#keyword").val("<c:out value='${ProductVO.keyword}' />");
					$("#search").val("<c:out value='${ProductVO.search}' />");
					
					if($("#search").val()!='b_content'){
						if($("#search").val()=='p_title') value="#list tr td.goDetail";
						else if($("#search").val()=='p_name') value="#list tr td.name";
						console.log($(value+":contains('"+word+"')").html());
						$(value+":contains('"+word+"')").each(function(){
							let regex = new RegExp(word,'gi');
							$(this).html($(this).html().replace(regex,"<span class='required'>"+word+"</span>"));
						});
					}
				}
				
				$("#keyword").bind("keydown", function(event){
					if(event.keyCode == 13){
						event.preventDefault();
					}
				});
				
				$("#search").change(function(){
					if($("#search").val()=="all"){
						$("#keyword").val("전체 데이터 조회합니다.");
					} else if($("search").val()!="all"){
						$("#keyword").val("");
						$("#keyword").focus();
					}
				});
				
				$("#searchData").click(function(){
					if($("#search").val()!='all'){
						if(!chkData("#keyword", "검색어를")) return;
					}
					$("#pageNum").val(1);
					goPage();
				});
				
				
				$("#upBtn").click(function(){
					
				});
				
				$("#downBtn").click(function(){
					
				});
				
				$(".goDetail").click(function(){
					let b_num = $(this).parents("tr").attr("data-num");
					$("#p_no").val(p_no);
					
					$("#detailForm").attr({
						"method":"get",
						"action":"/board/boardDetail"
					});
					$("#detailForm").submit();
				});
				
				$(".paginate_button a").click(function(e){
					e.preventDefault();
					$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
					goPage();
				});
			});
			
			/* 검색을 위한 실질적인 처리 함수 */
			function goPage(){
				if($("#search").val()=="all"){
					$("#keyword").val("");
				}
				$("#f_search").attr({
					"method":"get",
					"action":"/admin/product/productList"
				});
				$("#f_search").submit();
			}
		</script>
	</head>
	<body>
		<div class="contentContainer container">
			<!-- <div class="contentTit page-header"><h3 class="text-center">글 목록</h3></div> -->
			<form id="detailForm">
				<input type="hidden" id="p_no" name="p_no">
			</form>
			
			<div class="contentBtn text-right">
				<input type="button" value="승인" id="upBtn" class="btn btn-success">
				<input type="button" value="거절" id="downBtn" class="btn btn-danger">
			</div>
			
			<div id="boardList" class="table-height">
				<table summary="게시판 리스트" class="table table-striped">
					<thead>
						<tr>	
							<th data-value="p_no" class="order text-center col-md-1">상품번호</th>
							<th class="text-center col-md-3">이미지</th>
							<th class="text-center col-md-2">제목</th>
							<th class="text-center col-md-2">상품명</th>
							<th class="text-center col-md-2">가격</th>
							<th data-value="b_date" class="order col-md-1">작성일</th>
						</tr>
					</thead>
					<tbody id="list" class="table-striped">
						<c:choose>
							<c:when test="${not empty productList }">
								<c:forEach var="product" items="${productList}" varStatus="status">
									<tr class="text-center" data-num="${product.p_no }">
										<td>${product.p_no }</td>
										<td>
											<c:if test="${not empty product.p_thumb }">
												<img src="/uploadStorage/product/thumbnail/${product.p_thumb }">
											</c:if>
											<c:if test="${empty product.p_thumb}">
												<img src="/resources/images/common/icon.png" alt="이미지 없음">
											</c:if>
										</td>
										<td class="goDetail text-left">${product.p_title }</td>
										<td class="name">${product.p_name }</td>
										<td class="text-center">${product.p_price }</td>
										<td class="text-left">${product.p_created_at }</td>		
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<td colspan="4" class="tac text-center">등록된 상품이 존재하지 않습니다.</td>
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
			
			<div id="pSearch" class="text-right">
				<form id="f_search" name="f_search" class="form-inline">
					<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum }">
					<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount }">
					<div class="form-group">
						<label>검색조건</label>
						<select id="search" name="search" class="form-control">
							<option value="all">전체</option>
							<option value="p_name">상품명</option>
							<option value="p_title">제목</option>
							<option value="p_cate">카테고리</option>
						</select>
							<input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" class="form-control">
						<button type='button' id="searchData" class="btn btn_success">검색</button>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>