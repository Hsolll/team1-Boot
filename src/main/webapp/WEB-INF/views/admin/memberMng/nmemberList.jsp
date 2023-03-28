<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>nmemberList</title>
		
		<script src="/resources/include/js/common.js"></script>
		<script src="/resources/vendor/jquery/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
			$(function(){
				
				/* 검색 후 검색 대상과 검색 단어 출력 */
				let word="<c:out value='${memberVO.keyword}' />";  // 보여주기 태그
				let value="";
				if(word!=""){ 
					$("#keyword").val("<c:out value='${memberVO.keyword}' />");
 					$("#search").val("<c:out value='${memberVO.search}' />");
				
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
				
				/* 아이디 클릭시 상세 페이지 이동을 위한 처리 이벤트 */		
				$(".goDetail").click(function(){
					let u_no =  $(this).parents("tr").attr("data-num");	
					$("#u_no").val(u_no);
					console.log("회원번호 : "+u_no);
					// 상세 페이지로 이동하기 위해 form 추가 (id : detailForm) 
					$("#detailForm").attr({
						"method":"get",
						"action":"/admin/nmemberDetail"
					});
					$("#detailForm").submit(); 
				});
				
				$(".page-item a").click(function(e){
					e.preventDefault();
					$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
					goPage();
				});
				
				/* 삭제 버튼 클릭 시 처리 이벤트 
				let chkObj = document.getElementsByName("chk");
				let rowCnt = chkObj.length;
				
				$("input[name='cbx_chkAll']").click(function(){
					let chk_listArr = $("input=[name='chk']");
					for (let i=0; i<chk_listArr.length; i++){
						chk_listArr[i].checked = this.checked;
					}
				});
				$("input[name='chk']").click(function(){
					if($("input[name='chk']:checked").length == rowCnt){
						$("input[name='cbx_chkAll']")[0].checked = true;
					}
					else{
						$("input[name='cbx_chkAll']")[0].checked = false;
					}
				});*/
				$("#memberDeleteBtn").click(function(){
					deleteValue();
				});
				
				/* 체크박스 */
				$("#cbx_chkAll").click(function(){
					if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
					else $("input[name=chk]").prop("checked", false);
				});
				
				$("input[name=chk]").click(function(){
					let total = $("input[name=chk]").length;
					let checked = $("input[name=chk]:checked").length;
					
					if(total != checked) $("#cbx_chkAll").prop("checked", false);
					else $("#cbx_chkAll").prop("checked", true);
				});
				
				
			}); //종료
			
			
			/* 검색을 위한 실질적인 처리 함수 */
			function goPage(){
				if($("#search").val()=="all"){
					$("#keyword").val("");
				} 
			
				$("#f_search").attr({
					"method":"get",
					"action":"/admin/nmemberList"
				});
				$("#f_search").submit();
			}
			
			/* 회원 삭제하기 위한 처리 함수*/
			function deleteValue(){
				let url = "/admin/memberDelete";
				let checkBoxArr = [];
				$("input:checkbox[name='chk']:checked").each(function(){
					checkBoxArr.push($(this).val());
					console.log(checkBoxArr);
				})
				if(checkBoxArr.length == 0){
					alert("선택된 회원이 없습니다.");
				}
				else{
					let chk = confirm("정말 삭제하시겠습니까?");
					$.ajax({
						url : url,
						type: 'POST',
						traditional :true,
						data : {
							checkBoxArr : checkBoxArr
						},
						success: function(jdata){
							
							if(jdata = 1){
								alert("삭제 성공");
								location.replace("/admin/nmemberList")
							}
							else{
								alert("삭제 실패");
							}
						}
					});
				}
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
							<button type="button" id="smsSend" class="btn btn-dark m-l-100" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">메일전송</button>
						</div>
					</form>
				</div>
			
			<%--================== 검색기능 종료 ===================  --%>
			
			<%--================== 전체 회원수 시작 ===================  --%>
			<div class="tableTop">
				<button type="button" id="memberDeleteBtn" class="btn btn-dark m-l-100">회원삭제</button>
			</div>
			<%--================== 전체 회원수 종료 ===================  --%>
			
			<%-- =================== 리스트 시작  ================= --%>
					<div id="memberList" class="table-responsive">
						<form id="delete" name="delete">
							<input type="hidden" id="u_num" name="u_num" />
						</form>
							<table summary="탈퇴회원 리스트" class="table table-striped" >
								<thead>
									<tr>
										<th><input id="cbx_chkAll" type="checkbox"></th>
										<th data-value="u_no" class="order text-center col-md-1" >회원번호</th>
										<th class="text-center col-md-1">아이디</th>
										<th class="text-center col-md-1">닉네임</th>
										<th class="text-center col-md-1">이름</th>
										<th class="text-center col-md-1">핸드폰번호</th>
										<th data-value="b_date" class="order text-center col-md-2">회원가입일</th>
										<th class="text-center col-md-3">회원등급(일반:1/경고:2/블랙:3)</th>
										<th class="text-center col-md-2">회원상태(일반:1/탈퇴:2)</th>
										<th class="text-hide">버튼영역</th>
									</tr>
								</thead>
						 		<tbody id="list" class="table-striped" >
									<!-- 데이터 출력 -->
									<c:choose>
										<c:when test="${not empty nmemberList}" >
											<c:forEach var="nmember" items="${nmemberList}" varStatus="status">
												<tr class="text-center" data-num="${nmember.u_no}">
													<td><input name="chk" type="checkbox" value="${nmember.u_no}"></td>
													<td>${nmember.u_no}</td>
													<td class="goDetail text-center">
													${nmember.u_id}
													</td>
													<td class="text-center">${nmember.u_nick}</td>
													<td class="name text-center">${nmember.u_name}</td>
													<td class="text-center">${nmember.u_phone}</td>
													<td class="text-center">${nmember.u_created_at}</td>
													<td class="text-center">${nmember.u_grade}</td>
													<td class="text-center">${nmember.u_status}</td>
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
			
			
			<!-- E-Mail Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
					    <div class="modal-content">
						      <div class="modal-header">
						        	<h5 class="modal-title" id="exampleModalLabel">Send E-Mail</h5>
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          <span aria-hidden="true">&times;</span>
							        </button>
							  </div>
						      <div class="modal-body">
							        <form id="mail_form" name="mail_form">
							          <div class="form-group">
							            <label for="recipient-name" class="col-form-label">보낼 이메일 주소:</label>
							            <input type="text" class="form-control" id="recipient-name">
							          </div>
							          <div class="form-group">
							            <label for="message-text" class="col-form-label">내용:</label>
							            <textarea class="form-control" id="message-text"></textarea>
							          </div>
							        </form>
						      </div>
							  <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							        <button type="button" class="btn btn-primary">메일 보내기</button>
					      	  </div>
					    </div>
				  </div>
			</div>
		</div>
				<%-- =================== 리스트 종료  ================= --%>
</body>
</html>