<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<link type="text/css" rel="stylesheet" href="/resources/include/css/community.css" />
	<script>
		$(function(){
			let word="<c:out value='${faqVO.keyword}' />";
			let value="";
			if(word!= ""){
				$("#keyword").val("<c:out value='${faqVO.keyword}' />");
				$("#search").val("<c:out value='${faqVO.search}' />");
				
				if($("#search").val()!='all'){
					if($("#search").val()=='f_title') value="#list tr td.goDetail";
					else if($("#search").val()=='f_no') value="#list tr td.no";
					console.log($(value+":contains('"+word+"')").html());
					$(value+":contains('"+word+"')").each(function(){
						let regex = new RegExp(word,'gi');
						$(this).html($(this).html().replace(regex,"<span class='required'>"+word+"</span>"));
					});
				}
			}
			
			
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
			
			
			/* 입력 양식 enter 제거 */
			$("#keyword").bind("keydown", function(event){
				if(event.keyCode == 13){
					event.preventDefault();
				}
			});
			
			/* 검색 대상이 변경될 때마다 처리 이벤트 */
			$("input[type='checkbox']").change(function() {
				
				let search = $("input[type='checkbox'][name='key']:checked").val()
				$("input[name='search']").val(search);
				
				if($("input[id='all']").is(":checked")){
					$("#keyword").val("전체 데이터 조회합니다.");
				}else if($("#search").val()!="all"){
					$("#keyword").val("");
					$("#keyword").focus();
				}
			});
			
			/* 검색 버튼 클릭 시 처리 이벤트 */
			$("#searchData").click(function(){
				if($("input[type='checkbox'][name='key']:checked").val()!='all'){
					if(!chkData("#keyword", "검색어를")) return;
				}
				$("#pageNum").val(1);
				goPage();
			});
			
			/* 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트 */
			$(".goDetail").click(function(){
				let f_no = $(this).parents("tr").attr("data-num");
				$("#f_no").val(f_no);
				
				$("#form_data").attr({
					"method":"get",
					"action":"/faq/faqDetail"
				});
				$("#form_data").submit();
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
				"action":"/faq/faqList"
			});
			$("#f_search").submit();
		}
	</script>
	</head>
	<body>
		<div>
			<form name="form_data" id="form_data">
				<input type="hidden" id="f_no" name="f_no" />
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
	                        <input type="checkbox" name="key" id="f_no" value="f_no" class="m0" />
	                        <label for="f_no">글번호</label>
	                        <input type="checkbox" name="key" id="f_title" value="f_title" class="m0" />
	                        <label for="f_title">제목</label>
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
			
			
			<div class="community_table mt30">
	            <table>
	                <colgroup>
	                    <col style="width: 13%">
	                    <col>
	                    <col style="width: 13%">
	                    <col style="width: 13%">
	                    <col style="width: 10%">
	                </colgroup>
	                <thead>
	                    <tr class="text-center">
	                        <th scope="col">NO.</th>
	                        <th scope="col">TITLE</th>
	                        <th scope="col">NAME</th>
	                        <th scope="col">DATE</th>
	                        <th scope="col">HITS</th>
	                    </tr>
	                </thead>
	                <tbody id="list">
	                	<c:choose>
							<c:when test="${not empty faqList}">
								<c:forEach var="faq" items="${faqList}" varStatus="status">
									<tr class="text-center" data-num="${faq.f_no}">
										<td>${ faq.f_no }</td>
										<td class="goDetail tl">${ faq.f_title }</td>
										<td>관리자</td>
										<c:if test='${empty faq.f_updated_at }'>
											<td class="text-center">${faq.f_created_at }</td>
										</c:if>
										<c:if test='${not empty faq.f_updated_at }'>
											<td class="text-center">${faq.f_updated_at }</td>
										</c:if> 
										<td>${ faq.f_readcnt }</td> 
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="6" class="tac text-center">등록된 게시물이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
	                </tbody>
	            </table>
	        </div>
	        
	        <!-- 페이징 -->
	        <div class="text-center pagingArea">
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
							<a href="${num}" style="color: #868686;">${num}</a>
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
		</div>
	</body>
</html>