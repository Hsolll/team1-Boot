<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>memberList</title>
		<script src="/resources/include/js/common.js"></script>
		<script src="/resources/vendor/jquery/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
			$(function(){
				let admin = "<c:out value='${adminLogin.a_no }'/>";
				if(admin == ""){
					alert("잘못된 접근입니다.");
					location.href="/admin/login";
				}
				$(".dashboard-wrapper .page-header h1").html("회원관리");
				/* 검색 후 검색 대상과 검색 단어 출력 */
				let msg = "<c:if test='${empty adminLogin}'>관리자만 이용할 수 있습니다.</c:if>";
				let word="<c:out value='${memberVO.keyword}' />";  // 보여주기 태그
				let value="";
				if(word!=""){ 
					$("#keyword").val("<c:out value='${memberVO.keyword}' />");
 					$("#search").val("<c:out value='${memberVO.search}' />");
				
					if($("#search").val()!='u_phone'){
						if($("#search").val()=='u_id') value = "#list tr td .goDetail";
						else if($("#search").val()=='u_name') value="#list tr td .name";
						else if($("#search").val()=='u_grade') value="#list tr td .grade";
						else if($("#search").val()=='u_nick') value="#list tr td .nick";
						console.log($(value+":contains('"+word+"')").html());
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
					if(msg!=""){
						alert("로그인을 진행해주세요.");
					}else{ 
					$("#detailForm").attr({
						"method":"get",
						"action":"/admin/memberDetail"
					});
						$("#detailForm").submit();
					}
				});
				
				/* 페이징 */
				$(".page-item a").click(function(e){
					e.preventDefault();
					$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
					goPage();
				});
				
				/* 회원 등급 */
				$(".gradeBtn").click(function(){
					let u_no = $(this).parents("tr").attr("data-num");
					$("#u_num").val(u_no);
					
				});
				
				/* 회원 등급 수정 */
				$("#grade_update").click(function(){
					if(msg!=""){
						alert("로그인을 진행해주세요.");
					}else{
						let gradevalue = $("input[name='u_grade_value']:checked").val();
						$("#u_grade").val(gradevalue);
						
						console.log("등급 : "+gradevalue);
						
						$("#grade_form").attr({
							"method":"post",
							"action":"/admin/memberGrade"
						});
						$("#grade_form").submit();
					}
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
					"action":"/admin/memberList"
				});
				$("#f_search").submit();
			}
		</script>
		<style>
			#example_filter {display: none;}
			.pagination {display: none;}
			.pagination.v2 {display: flex;} 
			.table-responsive {overflow: hidden;}
			.dataTables_info {display: none;}
		</style>
	</head>

<body>
				<c:if test='${not empty adminLogin }'>
					<form id="detailForm">
						<input type="hidden" id="u_no" name="u_no" />
					</form>
					<%-- ============== container 시작 ====================  --%>
					<div> 
					<%--================== 총 회원수 ===================  --%>		
							<div class="tableTop">
								<h4 class="m-b-0">총 회원수: ${memberCount}</h4>
								
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
											<button type="button" id="smsSend" class="btn btn-dark m-l-25" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">메일전송</button>
										</div>
									</form>
								</div>
							<%--================== 검색기능 종료 ===================  --%>
							</div>

	                    <!-- ============================================================== -->
	                    <!-- data table  -->
	                    <!-- ============================================================== -->
	                    <div>
	                        <div class="card">
	                            <div class="card-body">
	                                <div class="table-responsive">
	                                	<div  id="example_wrapper" class="dataTables_wrapper dt-bootstrap4">
	                                		
	                                		<table id="example" class="table table-hover table-bordered second text-center" style="width:100%; margin-top: 20px;">
	                                    	<colgroup>
	                                    		<col style="width: 8%;">
	                                    		<col style="width: 15%;">
	                                    		<col style="width:;">
	                                    		<col style="width: 15%;">
	                                    		<col style="width:;">
	                                    		<col style="width:;">
	                                    	</colgroup>
	                                        <thead>
	                                            <tr>
	                                            	<th style="line-height: 2.4;"><input type="checkbox" id="cbx_chkAll"></th>
	                                                <th>회원번호</th>
	                                                <th>아이디</th>
	                                                <th>이름</th>
	                                                <th>핸드폰번호</th>
	                                                <th>이메일</th>
	                                                <th>회원등급</th>
	                                                <th>등급수정</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                        	<c:choose>
													<c:when test="${not empty memberList}" >
														<c:forEach var="member" items="${memberList}" varStatus="status">
															<tr data-num="${member.u_no}">
																<td><input type="checkbox" name="chk"></td>
																<td>${member.u_no}</td>
																<td class="goDetail">
																${member.u_id}
																</td>
																<td class="name">${member.u_name}</td>
																<td>${member.u_phone}</td>
																<td>${member.u_email}</td>
																<td class="grade">${member.u_grade}</td>
																<td><button type="button" class="gradeBtn btn btn-dark m-l-10" data-toggle="modal" data-target="#exampleModalCenter">등급수정</button></td>
															</tr>
														</c:forEach>
													</c:when>
													<c:otherwise>
														<tr>
															<td colspan="7" class="tac text-center">등록된 게시글이 존재하지 않습니다.</td>
														</tr>
													</c:otherwise>
												</c:choose>
	                                        </tbody>
	                                    </table>
	                                	</div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
						<%-- ============== 페이징 ====================  --%>
						<nav aria-label="Page navigation example">
						  <ul class="pagination v2 justify-content-center">
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
						
						<!-- 회원 수정 Modal -->
						<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered" role="document">
						    <div class="modal-content">
						    	<form id="grade_form" name="grade_form">
						    		<input type="hidden" id="u_num" name="u_num" />
						    		<input type="hidden" id="u_grade" name="u_grade" />
						    	</form>
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalCenterTitle">회원등급 수정</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								  		<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<input class="grade_select" type="radio" name="u_grade_value" style="display: inline-block;" aria-label="Radio button for following text input" value="1" checked>
									<label for="1" class="m-r-10 m-b-0">일반회원</label>
									<input class="grade_select" type="radio" name="u_grade_value" style="display: inline-block;" aria-label="Radio button for following text input" value="2">
									<label for="2" class="m-r-10 m-b-0">경고회원</label>
									<input  class="grade_select" type="radio" name="u_grade_value" style="display: inline-block;" aria-label="Radio button for following text input" value="3">
								  	<label for="3" class="m-b-0">블랙회원</label>
								</div>
								<div class="modal-footer">
								  <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
								  <button id="grade_update" type="button" class="btn btn-primary">저장</button>
								</div>
						    	
						    </div>
						  </div>
						</div>
					</div>
				</c:if>
			<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
			<script src="/resources/vendor/datatables/js/dataTables.bootstrap4.min.js"></script>
			<script src="https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js"></script>
			<script src="/resources/vendor/datatables/js/buttons.bootstrap4.min.js"></script>
			<script src="/resources/vendor/datatables/js/data-table.js"></script>
			
			<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
		    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
		    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
		    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
		    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
		    <script src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.colVis.min.js"></script>
		    <script src="https://cdn.datatables.net/rowgroup/1.0.4/js/dataTables.rowGroup.min.js"></script>
		    <script src="https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>
		    <script src="https://cdn.datatables.net/fixedheader/3.1.5/js/dataTables.fixedHeader.min.js"></script>
</body>
</html>