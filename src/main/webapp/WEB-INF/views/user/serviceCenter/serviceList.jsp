<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<link type="text/css" rel="stylesheet" href="/resources/include/css/community.css" />
	<script>
	
	$(function(){
		let msg = "<c:if test='${empty memberLogin}'>회원만 이용할 수 있습니다.</c:if>";
		let word="<c:out value='${serviceCenterVO.keyword}' />";
		let value="";
		if(word!= ""){
			$("#keyword").val("<c:out value='${serviceCenterVO.keyword}' />");
			$("#search").val("<c:out value='${serviceCenterVO.search}' />");
			
			if($("#search").val()!='all'){
				if($("#search").val()=='sc_title') value="#list tr td.goDetail";
				else if($("#search").val()=='sc_no') value="#list tr td.no";
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
		
		$("#searchData").click(function(){
			if($("input[type='checkbox'][name='key']:checked").val()!="all"){ // 제목/내용/작성자 선택시 검색어 유효성 체크
				if(!chkData("#keyword","검색어를")) return;
			}
			$("#pageNum").val(1);
			goPage();
		});
		
		$(".paginate_button a").click(function(e){
			e.preventDefault();
			$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
			goPage();
		});
		
		$(".goDetail").click(function(){
			let sc_no = $(this).parents("tr").attr("data-no");
			$("#sc_no").val(sc_no);
			if(msg!=""){
				alert("로그인을 진행해주세요.");
			} else{				
				$("#detailForm").attr({
					"method":"get",
					"action":"/serviceCenter/servicePwdConfirm"
				});
				$("#detailForm").submit();
			}
		});
		
		$(".replyDetail").click(function(){
			let as_no = $(this).parents("tr").attr("data-num");
			$("#as_no").val(as_no);
			
			$("#replyDetailForm").attr({
				"method":"get",
				"action":"/admin/servicePwdConfirm"
			});
			$("#replyDetailForm").submit();
		});
		
		
		$("#writeBtn").click(function(){
			if(msg!=""){
				alert("로그인을 진행해주세요.");
			} else{
				location.href="/serviceCenter/writeForm"
			}
		});
		
	});
	
	function goPage(){
		if($("#search").val()=="all"){
			$("#keyword").val("");
		}
		$("#f_search").attr({
			"method":"get",
			"action":"/serviceCenter/serviceList"
		});
		$("#f_search").submit();
	}
	</script>
	</head>
	
	
	
	<body>
		<div>
			<form id="detailForm">
				<input type="hidden" id="sc_no" name="sc_no">
			</form>
			<form id="replyDetailForm">
				<input type="hidden" id="as_no" name="as_no" />
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
	                        <input type="checkbox" name="key" id="sc_no" value="sc_no" class="m0" />
	                        <label for="sc_no">글번호</label>
	                        <input type="checkbox" name="key" id="sc_title" value="sc_title" class="m0" />
	                        <label for="sc_title">제목</label>
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
							<c:when test="${not empty serviceList }">
								<c:forEach var="service" items="${serviceList}" varStatus="status">
									<tr class="text-center" data-no='${service.sc_no }'>
										<td>${service.sc_no }</td>
										<td class="goDetail text-left" style="cursor:pointer;">${service.sc_title }</td>
										<td class="text-center">${service.u_name }</td>
										<td class="text-center">${service.sc_created_at }</td>
										<td class="text-center">${service.sc_readcnt }</td>
									</tr>
									<c:choose>
										<c:when test="${not empty admServiceList}">
											<c:forEach var="admservice" items="${admServiceList}" varStatus="status">
												<c:set var="as" value="${admservice.sc_no}" />
												<c:set var="sc" value="${service.sc_no}" />
												<fmt:parseNumber var="asno" type="number" value="${as}"/>
												<fmt:parseNumber var="scno" type="number" value="${sc}"/>
												<c:if test="${asno eq scno }">
													<tr data-num='${admservice.as_no}'>
														<td class="text-center"></td>
														<td class="replyDetail text-left" style="cursor:pointer;">${admservice.as_title}</td>
														<td class="text-center">${admservice.a_name}</td>
														<td class="text-center">${admservice.as_created_at}</td>
														<td></td>
													</tr>
												</c:if>
											</c:forEach>
										</c:when>
									</c:choose>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<td colspan="6" class="tac text-center">등록된 게시물이 존재하지 않습니다.</td>
							</c:otherwise>
						</c:choose>
	                </tbody>
	            </table>
	        </div>
	        
	        <!-- 페이징 -->
	        <div class="text-center pagingArea">
	        	
	        	<!-- 글쓰기 버튼 -->
	        	<div class="writeArea">
		        	<button type="button" id="writeBtn" class="buttonWhite">WRITE</button>
		        </div>
		        
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