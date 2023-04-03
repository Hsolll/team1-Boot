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
			let word="<c:out value='${faqVO.keyword}' />";
			let value="";
			if(word!= ""){
				$("#keyword").val("<c:out value='${faqVO.keyword}' />");
				$("#search").val("<c:out value='${faqVO.search}' />");
				
				if($("#search").val()!='f_content'){
					if($("#search").val()=='f_title') value="#list tr td";
					console.log($(value+":contains('"+word+"')").html());
					$(value+":contains('"+word+"')").each(function(){
						let regex = new RegExp(word,'gi');
						$(this).html($(this).html().replace(regex,"<span>"+word+"</span>"));
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
			
			
			$("#insertFormBtn").click(function(){
				location.href="/admin/faq/faqInsertForm";
			});
			
			$(".updateBtn").click(function(){
				let f_no = $(this).parents("tr").attr("data-no");
				$("#f_no").val(f_no);
				
				$("#updateForm").attr({
					"method":"get",
					"action":"/admin/faq/faqUpdateForm"
				});
				$("#updateForm").submit();
			});
			
			$(".delBtn").click(function(){
				let f_no = $(this).parents("tr").attr("data-no");
				$("#f_no").val(f_no);
				if(confirm("해당 글을 내리시겠습니까?")){
					location.href="/admin/faq/faqDelete?f_no="+f_no;					
				}
			});
			
			$(".paginate_button a").click(function(e){
				e.preventDefault();
				$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
				goPage();
			});
			
		});
		
		function goPage(){
			if($("#search").val()=="all"){
				$("#keyword").val("");
			}
			$("#f_search").attr({
				"method":"get",
				"action":"/admin/faq/faqList"
			});
			$("#f_search").submit();
		}
	</script>
	<style>
		#insertFormBtn{
			margin-bottom : 10px;
		}
	</style>
	</head>
	<body>
		<c:if test='${not empty adminLogin }'>
		<div class="contentContatiner">
			<form id="updateForm">
				<input type="hidden" id="f_no" name="f_no">
			</form>
			
			<div class="contentBtn text-right">
				<input type="button" value="글쓰기" id="insertFormBtn" class="btn btn-primary">
			</div>
			<div id="faqList" class="table-height">
				<table summary="FAQ 리스트" class="table table-striped">
					<thead>
						<tr>
							<th data-value="f_no" class="order text-center col-md-1">글 번호</th>
							<th class="text-center col-md-3">글 제목</th>
							<th data-value="f_created_at" class="text-center col-md-2">작성일</th>
							<th data-value="f_updated_at" class="text-center col-md-2">수정일</th>
							<th data-value="f_deleted_at" class="text-center col-md-2">삭제일</th>
							<th class="text-center col-md-2">수정/삭제</th>
						</tr>
					</thead>
					<tbody id="list" class="table-striped">
						<c:choose>
							<c:when test="${not empty faqList }">
								<c:forEach var="faq" items="${faqList}" varStatus="status">
									<tr class="text-center" data-no='${faq.f_no }'>
										<td>${faq.f_no }</td>
										<td class="text-left">${faq.f_title }</td>
										<td class="text-center">${faq.f_created_at }</td>		
										<td class="text-center">${faq.f_updated_at }</td>
										<td class="text-center">${faq.f_deleted_at }</td>	
										<td class="text-center"> 
											<input type="button" value="수정" class="btn updateBtn btn-success">
											<input type="button" value="삭제" class="btn delBtn btn-danger"> 
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<td colspan="6" class="tac text-center">등록된 게시물이 존재하지 않습니다.</td>
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
							<a href='${num }'>${num } </a>
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
			
			<div id="faqSearch" class="text-right">
				<form id="f_search" name="f_search" class="form-inline">
					<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum }">
					<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount }">
					<div class="form-group">
						<label>검색조건</label>
						<select id="search" name="search" class="form-control">
							<option value="all">전체</option>
							<option value="f_title">제목</option>
							<option value="f_content">내용</option>
						</select>
						<input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" class="form-control">
						<button type='button' id="searchData" class="btn btn_success">검색</button>
					</div>
				</form>
			</div>
		</div>
		</c:if>
	</body>
</html>