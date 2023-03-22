<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>memberList</title>
		
		<script src="/resources/include/js/common.js"></script>
		<script src="/resources/vendor/jquery/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
			$(function(){
				
				/* 검색 후 검색 대상과 검색 단어 출력 */
				let word="<c:out value='${memberVO.keyword}' />";  // 보여주기 태그
				let value="";
				if(word!=""){ 
					$("#keyword").val("<c:out value='${memberVO.keyword}' />");
// 					$("#search").val("<c:out value='${memberVO.search}' />");
				
					if($("#search").val()!='u_nick'){
						//:contains()는 특정 텍스트를 포함한 요소반환 	
						if($("#search").val()=='u_id') value = "#list tr td.goDetail";
						else if($("#search").val()=='u_name') value="#list tr td.name";
						else if($("#search").val()=='u_grade') value="#list tr td.grade";
						console.log($(value+":contains('"+word+"')").html());
						//$("#list tr td.goDetail:contains('노력')").html() => <span class='required'>노력</span>에 대한 명언
				    	$(value+":contains('"+word+"')").each(function () {
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
				
				/* 등급수정 버튼 클릭 시 처리 이벤트 */
				$(".gradeBtn").click(function(){
					console.log("click");
					location.href = "/admin/memberDetail";
				});
				
				
				/* 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트 */		
				$(".goDetail").click(function(){
					let u_no =  $(this).parents("tr").attr("data-num");	
					$("#u_no").val(u_no);
					console.log("회원번호 : "+u_no);
					// 상세 페이지로 이동하기 위해 form 추가 (id : detailForm) 
					$("#detailForm").attr({
						"method":"get",
						"action":"/admin/memberDetail"
					});
					$("#detailForm").submit(); 
				});
				
				$(".page-item a").click(function(e){
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
					"action":"/admin/memberList"
				});
				$("#f_search").submit();
			}
		</script>
	</head>

<body>
		
		<form id="detailForm">
			<input type="hidden" id="u_no" name="u_no" />
		</form>
		<%-- ============== container 시작 ====================  --%>
		<div class="container"> 
			<%-- ============== 검색기능 시작 ====================  --%>
			<div id="memberSearch" class="text-right">
				<form id="f_search" name="f_search" class="form-inline">
					<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
					<div class="form-group ml-auto">
						<label>검색조건</label>
						<select id="search" name="search"  class="form-control m-l-10">
							<option value="all">전체</option>
							<option value="u_id">아이디</option>
							<option value="u_name">이름</option>
							<option value="u_nick">닉네임</option>
							<option value="u_grade">회원등급</option>
						</select>
						<input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" class="form-control m-l-10" />
						<button type="button" id="searchData" class="btn">검색</button>
						<button type="button" id="smsSend" class="btn btn-dark m-l-100">메일전송</button>
					</div>
				</form>
			</div>
		<%--================== 검색기능 종료 ===================  --%>
		
		<%--================== 전체 회원수 시작 ===================  --%>
		<div class="tableTop">
			<p>회원수 : </p>
		</div>
		<%--================== 전체 회원수 종료 ===================  --%>
		
		<%-- =================== 리스트 시작  ================= --%>
				<div id="memberList" class="table-responsive">
				<table summary="일반회원 리스트" class="table table-striped" >
					<thead>
						<tr>
							<th><input type="checkbox"></th>
							<th data-value="u_no" class="order text-center col-md-1" >회원번호</th>
							<th class="text-center col-md-1">아이디</th>
							<th class="text-center col-md-1">닉네임</th>
							<th class="text-center col-md-1">이름</th>
							<th class="text-center col-md-1">핸드폰번호</th>
							<th data-value="u_created_at" class="order text-center col-md-2">회원가입일</th>
							<th class="text-center col-md-3">회원등급(일반:1/경고:2/블랙:3)</th>
							<th class="text-center col-md-2">회원상태(일반:1/탈퇴:2)</th>
							<th class="text-hide">버튼영역</th>
						</tr>
					</thead>
			 		<tbody id="list" class="table-striped" >
						<!-- 데이터 출력 -->
						<c:choose>
							<c:when test="${not empty memberList}" >
								<c:forEach var="member" items="${memberList}" varStatus="status">
									<tr class="text-center" data-num="${member.u_no}">
										<td><input type="checkbox"></td>
										<td>${member.u_no}</td>
										<td class="goDetail text-center">
										${member.u_id}
										</td>
										<td class="text-center">${member.u_nick}</td>
										<td class="name text-center">${member.u_name}</td>
										<td class="text-center">${member.u_phone}</td>
										<td class="text-center">${member.u_created_at}</td>
										<td class="grade text-center">${member.u_grade}</td>
										<td class="text-center">${member.u_status}</td>
										<td><button type="button" class="gradeBtn btn btn-dark m-l-10">등급수정</button></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="8" class="tac text-center">등록된 게시글이 존재하지 않습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody> 
				</table>
			</div>
			<%-- =================== 리스트 종료  ================= --%>
			
				
				<%-- =================== 페이징 출력 시작 =============== --%>
			<nav aria-label="Page navigation example">
			  <ul class="pagination justify-content-center">
			  	<c:if test="${pageMaker.prev}">
				    <li class="page-item disabled">
				    
				      <a class="page-link" href="${pageMaker.startPage -1}" tabindex="-1">Previous</a>
				    </li>
			    </c:if>
			    
			    <c:forEach var="num" begin="${pageMaker.startPage}"
										 end="${pageMaker.endPage}">
				    <li class="page-item">
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
			
			
			<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item disabled">
      <a class="page-link" href="#" tabindex="-1">Previous</a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#">Next</a>
    </li>
  </ul>
</nav>
		</div>
			
			
			
			
			<div class="page-link">
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
		<%-- ============== container 종료 ====================  --%>
</body>
</html>