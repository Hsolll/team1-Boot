<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

		<link rel="stylesheet" href="/resources/include/css/sellList.css">
		
		<script type="text/javascript">
			$(function(){
				$(".content_wrap .page-header h1").html("상품 목록");
				
				/* 제목 클릭 시 상세 페이지 이동을 위한 처리 이벤트 */
				$(".goDetail").click(function(){
					let sp_no = $(this).parents("tr").attr("data-num");
					//console.log("sp_no = " + sp_no);
					$("#sp_no").val(sp_no);
					$("#detailForm").attr({
						"method":"get",
						"action":"/safe/productDetail"
					});
					$("#detailForm").submit();
				});
				
				/* 검색 체크박스 하나만 선택하기 */
				$("input[type='checkbox']").click(function(){
					if(this.checked) {
				        const checkboxes = $("input[type='checkbox']");
				        for(let ind = 0; ind < checkboxes.length; ind++){
				            checkboxes[ind].checked = false;
				        }
				        this.checked = true;
				    } else {
				        this.checked = false;
				    }
				});
				
				
				/* 검색 후 검색 대상과 검색 단어 출력 */
				let word="<c:out value='${safeProductVO.keyword}' />";
				let value="";
				
				if(word!=""){
					$("#keyword").val("<c:out value='${safeProductVO.keyword}' />");
					$("#search").val("<c:out value='${safeProductVO.search}' />");
				
					if($("#search").val()!='sp_name'){
						//:contains()는 특정 텍스트를 포함한 요소반환 	
						if($("#search").val()=='u_id') value = "#list tr td.name";
						else if($("#search").val()=='sp_title') value="#list tr td.goDetail";
						console.log($(value + ":contains('" + word + "')").html());
						//$("#list tr td.goDetail:contains('노력')").html() => <span class='required'>노력</span>에 대한 명언
				    	$(value + ":contains('" + word + "')").each(function () {
							let regex = new RegExp(word,'gi');
							$(this).html($(this).html().replace(regex,"<span class='required'>"+word+"</span>"));
				    	});
					}
				}
				
				/* 입력 양식 enter 제거 */
				$("#keyword").bind("keydown", function(event){
					 if (event.keyCode == 13) {
					        event.preventDefault();
					    }
				});
				
				/* 검색 대상이 변경될 때마다 처리 이벤트 */
				$("input[type='checkbox']").change(function() {
					
					let search = $("input[type='checkbox'][name='key']:checked").val()
					$("input[name='search']").val(search);
					//console.log($("input[name='search']").val());
					
					if($("input[id='all']").is(":checked")){
						$("#keyword").val("전체 데이터를 조회합니다.");
					}else if($("#search").val()!="all"){
						$("#keyword").val("");
						$("#keyword").focus();
					}
				});
				
				
				/* 검색 버튼 클릭 시 처리 이벤트 */
				$("#searchData").click(function(){
					
					if($("input[type='checkbox'][name='key']:checked").val() != "all"){ // 제목/내용/작성자 선택시 검색어 유효성 체크
						if(!chkData("#keyword","검색어를")) return;
					}
					goPage();
				});
				
				/* 페이징 처리 함수 */
				$(".paginate_button a").click(function(e){
					e.preventDefault();
					$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
					goPage();
				});
				
				
			}); // $ 함수 종료
			
			/* 검색을 위한 실질적인 처리 함수 */
			function goPage(){
				if($("#search").val()=="all"){
					$("#keyword").val("");
				}

				$("#f_search").attr({
					"method":"get",
					"action":"/safe/productList"
				});
				$("#f_search").submit();
			}
		</script>
	</head>
	<body>
		<div class="contentContainer container">
		
			<form name="detailForm" id="detailForm">
				<input type="hidden" name="sp_no" id="sp_no" >
			</form>
			
			<%-- ===================== 검색 기능 시작 ===================== --%>
			<div class="searchbox">
				<form id="f_search" name="f_search">
					<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
            		<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
                	<input type="hidden" id="search" name="search" value="all" />
	                <div class="keywordbox">
	                    <span class="keyword">
	                        <input type="checkbox" name="key" id="all" class="m0" value="all" checked />
	                        <label for="all">통합검색</label>
	                        <input type="checkbox" name="key" id="u_id" value="u_id" class="m0" />
	                        <label for="u_id">판매자ID</label>
	                        <input type="checkbox" name="key" id="sp_title" value="sp_title" class="m0" />
	                        <label for="sp_title">제목</label>
	                        <input type="checkbox" name="key" id="sp_name" value="sp_name" class="m0" />
	                        <label for="sp_name">상품명</label>
	                    </span>
	                </div>
	                <div class="searchbox_right block">
	                    <span>
	                        <input type="text" class="w280 pl10" name="keyword" id="keyword" value="검색어를 입력하세요" maxlength="30" />
	                    </span>
	                    <a href="#" id="searchData" class="btn_gray fr"><span class="icon"></span>검 색</a>
	                </div>
                </form>
            </div>
			<%-- ===================== 검색 기능 종료 ===================== --%>
			
			
			
			<%-- ===================== 리스트 시작 ===================== --%>
			<div id="safeProduct" class="table-height mt30">
				<div class="location">
	                <span class="location_right">
	                    <a href="/" class="list_btn">
	                        <span class="list_icon"></span>
	                        되돌아가기
	                    </a>
	                </span>
	            </div>
				<table summary="안심상품 리스트" class="tb_sell table-hover" id="tableList">
					<colgroup>
	                    <col style="width: 7%">
	                    <col>
	                    <col style="width: 13%">
	                    <col style="width: 13%">
	                    <col style="width: 10%">
	                    <col style="width: 12%">
	                </colgroup>
					<thead>
						<tr class="text-center">
						<th scope="col" data-value="sp_no" class="order">번호</th>
							<th scope="col">제목</th>
							<th scope="col">판매자ID</th>
							<th scope="col">가격</th>
							<th scope="col">거래상태</th>
							<th scope="col" data-value="sp_created_at">등록일</th>
						</tr>
					</thead>
					<tbody id="list" class="table-striped">
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${ not empty safeProduct }">
								<c:forEach var="safe" items="${ safeProduct }" varStatus="status">
									<tr class="text-center" data-num="${safe.sp_no }">
										<td>${ safe.sp_no }</td>
										<td class="goDetail tl">${ safe.sp_title }</td>
										<td class="name">${ safe.u_id }</td>
										<td>
											<fmt:formatNumber value="${safe.sp_price}" groupingUsed="true"/>
										</td>
										<td>${ safe.sp_status }</td> 
										<td>${ safe.sp_created_at }</td> 
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4" class="tac text-center">등록된 상품 정보가 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<%-- ===================== 리스트 종료 ===================== --%>
			
			
			
			<%-- ===================== 페이징 출력 시작 ===================== --%>
			<div class="text-center">
				<ul class="pagination">
					<c:if test="${ pageMaker.prev }">
						<li class="paginate_button previous">
							<a href="${ pageMaker.startPage - 1 }">Previous</a>
						</li>
					</c:if>
					<!-- 바로가기 번호 출력 -->
					<c:forEach var="num" begin="${ pageMaker.startPage }"
										 end="${ pageMaker.endPage }">
						<li class="paginate_button ${ pageMaker.cvo.pageNum == num ? 'active':'' }">
							<a href="${num}" > ${num}</a>
						</li>
					</c:forEach>
					<!-- 다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인 -->
					<c:if test="${ pageMaker.next }">
							<li class="paginate_button next">
								<a href="${ pageMaker.endPage + 1 }">Next</a>
							</li>
					</c:if>
				</ul>
			</div>
			<%-- ===================== 페이징 출력 종료 ===================== --%>
			
			
			
			<%-- ===================== 글쓰기 버튼 시작 ===================== --%>
			
		</div>
	</body>
</html>