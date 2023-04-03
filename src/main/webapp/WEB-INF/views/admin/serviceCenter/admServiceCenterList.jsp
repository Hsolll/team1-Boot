<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<title>serviceCenterList</title>
		<script type="text/javascript" src="/resources/vendor/jquery/jquery-3.3.1.min.js"></script>
      	<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script>
	
	$(function(){
		$(".dashboard-wrapper .page-header h1").html("고객문의관리");
		let msg = "<c:if test='${empty adminLogin}'>관리자만 이용할 수 있습니다.</c:if>";
		let word="<c:out value='${serviceCenterVO.keyword}' />";
		let value="";
		if(word!= ""){
			$("#keyword").val("<c:out value='${serviceCenterVO.keyword}' />");
			$("#search").val("<c:out value='${serviceCenterVO.search}' />");
			
			if($("#search").val()!='u_name'){
				if($("#search").val()=='sc_title') value="#list tr td.goDetail";
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
		
		$(".page-item_button a").click(function(e){
			e.preventDefault();
			$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
			goPage();
		});
		
		$(".goDetail").click(function(){
			let sc_no = $(this).parents("tr").attr("data-no");
			$("#sc_no").val(sc_no);
			if(msg!=""){
				alert("로그인을 진행해주세요.");
			}else{
				$("#detailForm").attr({
					"method":"get",
					"action":"/admin/serviceCenterDetail"
			});
				$("#detailForm").submit();
			}
		});
		
		
		$(".replyDetail").click(function(){
			let as_no = $(this).parents("tr").attr("data-num");
			$("#as_no").val(as_no);
			if(msg!=""){
				alert("로그인을 진행해주세요.");
			}else{
				$("#replyDetailForm").attr({
					"method":"get",
					"action":"/admin/replyDetail"
			});
				$("#replyDetailForm").submit();
			}
		});
		
	});
	
	function goPage(){
		if($("#search").val()=="all"){
			$("#keyword").val("");
		}
		$("#f_search").attr({
			"method":"get",
			"action":"/admin/serviceCenterList"
		});
		$("#f_search").submit();
	}
	</script>
	</head>

<body>
		<form id="detailForm">
			<input type="hidden" id="sc_no" name="sc_no" />
		</form>
		<form id="replyDetailForm">
			<input type="hidden" id="as_no" name="as_no" />
		</form>
		
		<%-- ============== container 시작 ====================  --%>
		<div> 
			<%-- ============== 검색기능 시작 ====================  --%>
			<div id="serviceSearch" class="text-right">
				<form id="f_search" name="f_search" class="form-inline">
					<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
					<div class="form-group ml-auto">
						<label>검색조건</label>
						<select id="search" name="search"  class="form-control m-l-10">
							<option value="all">전체</option>
							<option value="sc_title">제목</option>
							<option value="sc_name">작성자</option>
						</select>
						<input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" class="form-control m-l-10" />
						<button type="button" id="searchData" class="btn">검색</button>
					</div>
				</form>
			</div>
		<%--================== 검색기능 종료 ===================  --%>
		
		<%-- =================== 리스트 시작  ================= --%>
				<div id="serviceList" class="table-responsive">
				<table summary="문의 리스트" class="table table-striped m-t-15" >
					<thead>
						<tr>
							<th data-value="sc_no" class="order text-center col-md-1" >신고글 번호</th>
							<th class="text-center col-md-5">제목</th>
							<th data-value="sc_name" class="text-center col-md-2">작성자</th>
							<th data-value="sc_created_at" class="text-center col-md-3">작성일</th>
							<th data-value="sc_readcnt" class="text-center col-md-1">조회수</th>
						</tr>
					</thead>
			 		<tbody id="list" class="table-striped" >
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty serviceList}" >
								<c:forEach var="service" items="${serviceList}" varStatus="status">
									<tr class="text-center" data-no='${service.sc_no}'>
										<td>${service.sc_no}</td>
										<td class="goDetail text-left">${service.sc_title }</td>
										<td class="name text-center">${service.u_name }</td>
										<td class="date text-center">${service.sc_created_at }</td>
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
														<td class="replyDetail text-left">${admservice.as_title}</td>
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
								<tr>
									<td colspan="6" class="tac text-center">등록된 게시글이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody> 
				</table>
			</div>
			<%-- =================== 리스트 종료  ================= --%>
			<nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			  	<c:if test="${pageMaker.prev}">
				    <li class="page-item disabled">
				    
				      <a class="page-link" href="${pageMaker.startPage -1}" tabindex="-1">Previous</a>
				    </li>
			    </c:if>
			    
			    <c:forEach var="num" begin="${pageMaker.startPage}"
										 end="${pageMaker.endPage}">
				    <li class="page-item_button" ${pageMaker.cvo.pageNum == num ? 'active':''}>
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
		<%-- ============== container 종료 ====================  --%>
</body>
</html>