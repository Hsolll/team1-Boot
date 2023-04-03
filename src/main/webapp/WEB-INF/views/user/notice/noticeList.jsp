<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script src="/resources/include/js/common.js"></script>
		<script type="text/javascript">
	$(function(){	
			/* 검색 후 검색 대상과 검색 단어 출력 */
			$(".content_wrap .page-header h1").html("공지사항");
			
			let msg = "<c:if test='${empty memberLogin}'>회원만 이용할 수 있습니다.</c:if>";
			let word="<c:out value='${noticeVO.keyword}' />";  // 보여주기 태그
			let value="";
			if(word!=""){ 
				$("#keyword").val("<c:out value='${noticeVO.keyword}' />");
				$("#search").val("<c:out value='${noticeVO.search}' />");
			
				if($("#search").val()!='an_content'){
					if($("#search").val()=='an_title') value = "#list tr td.goDetail";
					else if($("#search").val()=='an_no') value="#list tr td.no";
					console.log($(value+":contains('"+word+"')").html());
			    	$(value+":contains('"+word+"')").each(function () {
						let regex = new RegExp(word,'gi');
						$(this).html($(this).html().replace(regex,"<span>"+word+"</span>"));
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
			$("#search").change(function() {
				if($("#search").val()=="all"){
					$("#keyword").val("전체 데이터 조회합니다.");
				}else if($("#search").val()!="all"){
					$("#keyword").val("");
					$("#keyword").focus();
				}
			});
		
			/* 검색 버튼 클릭 시 처리 이벤트 */
			$("#searchData").click(function(){
				if($("#search").val()!="all"){ // 제목/내용/작성자 선택시 검색어 유효성 체크
					if(!chkData("#keyword","검색어를")) return;
				}
				$("#pageNum").val(1);
				goPage();
			});
			
			
			/* 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트 */		
			$(".goDetail").click(function(){
				let an_no =  $(this).parents("tr").attr("data-num");	
				$("#an_no").val(an_no);
				console.log("글번호 : "+an_no);
				// 상세 페이지로 이동하기 위해 form 추가 (id : detailForm) 
				$("#detailForm").attr({
					"method":"get",
					"action":"/notice/noticeDetail"
				});
				$("#detailForm").submit(); 
			});
			
			$(".paginate_button a").click(function(e){
				e.preventDefault();
				$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
				goPage();
			});
			
			
		}); // $ 함수 종료문
		
		/* 검색을 위한 실질적인 처리 함수 */
		function goPage(){
			if($("#search").val()=="all"){
				$("#keyword").val("");
			} 
		
			$("#f_search").attr({
				"method":"get",
				"action":"/notice/noticeList"
			});
			$("#f_search").submit();
		}
	</script>
	</head>

<body>
<%-- ============== container 시작 ====================  --%>
<div class="contentContainer container"> 
	<form id="detailForm">
		<input type="hidden" id="an_no" name="an_no" />
	</form>
	
	<%-- ============== 검색기능 시작 ====================  --%>
	<div id="noticeSearch" class="text-right">
		<form id="f_search" name="f_search" class="form-inline">
			<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
			<div class="form-group ml-auto">
				<label>검색조건</label>
				<select id="search" name="search"  class="form-control m-l-10">
					<option value="all">전체</option>
					<option value="an_no">글번호</option>
					<option value="an_title">제목</option>
				</select>
				<input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" class="form-control m-l-10" />
				<button type="button" id="searchData" class="btn">검색</button>
			</div>
		</form>
	</div>
<%--================== 검색기능 종료 ===================  --%>

<%-- =================== 리스트 시작  ================= --%>
	<div id="noticeList" class="table-responsive">
		<table summary="공지사항 리스트" class="table table-striped m-t-15" style="margin-top: 30px;">
			<thead>
				<tr>
					<th data-value="an_no" class="order text-center col-md-1" >공지글 번호</th>
					<th class="text-center col-md-1">구분</th>
					<th class="text-center col-md-1">작성자</th>
					<th class="text-center col-md-2">제목</th>
					<th class="text-center col-md-3">등록일</th>
					<th data-value="an_cnt" class="order text-center col-md-1">조회수</th>
				</tr>
			</thead>
	 		<tbody id="list" class="table-striped" >
				<!-- 데이터 출력 -->
				<c:choose>
					<c:when test="${not empty noticeList}" >
						<c:forEach var="notice" items="${noticeList}" varStatus="status">
							<tr class="text-center" data-num="${notice.an_no}">
								<td class="no text-center">${notice.an_no}</td>
								<td class="text-center">
								${notice.an_category}
								</td>
								<td class="text-center">${notice.a_name}</td>
								<td class="goDetail text-center" style="cursor:pointer;">${notice.an_title}</td>
								<td class="text-center">${notice.an_created_at}</td>
								<td class="text-center">${notice.an_cnt}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="6" class="tac text-center">등록된 게시글이 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody> 
		</table>
	</div>
	<%-- =================== 리스트 종료  ================= --%>
	
	<%-- =================== 페이징 출력 시작 =============== --%>
		<div class="text-center">
			<ul class="pagination">
			<!-- 이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인. -->
				<c:if test="${pageMaker.prev}">
					<li class="paginate_button previous">
						<a href="${pageMaker.startPage -1}">Previous</a>
					</li>
				</c:if>
				
				<!-- 바로가기 번호 추력 -->
				<c:forEach var="num" begin="${pageMaker.startPage}"
									 end="${pageMaker.endPage}">
				 <li class="paginate_button ${pageMaker.cvo.pageNum == num? 'active':''}">
				 	<a href="${num}">${num}</a>
				 </li>
				</c:forEach>
				
				<!-- 다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인. -->
				<c:if test="${pageMaker.next}">
					<li class="paginate_button next">
		 				<a href="${pageMaker.endPage + 1}">Next</a>
					</li>
				</c:if>
			</ul>
		</div>
</div>
<%-- ============== container 종료 ====================  --%>
</body>
</html>