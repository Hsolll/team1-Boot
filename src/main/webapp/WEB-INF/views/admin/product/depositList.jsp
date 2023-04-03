<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/admin.jspf" %>
	<script>
		var btn = 0;
			$(function(){
				let admin = "<c:out value='${adminLogin.a_no }'/>";
				if(admin == ""){
					alert("잘못된 접근입니다.");
					location.href="/admin/login";
				}
				$("input[name='allChk']").click(function(){
					var item = $("input[name='queChk']");
					for(var i = 0; i<item.length;i++){
						item[i].checked = this.checked;
					}
				});
				
				$("input[name='queChk']").click(function(){
					var cnt = document.getElementsByName("queChk").length;
					if($("input[name='queChk']:checked").length==cnt){
						$("input[name='allChk']")[0].checked = true;
					} else{
						$("input[name='allChk']")[0].checked = false;
					}
				});
				$("#upBtn").click(function(){
					proValue();
				});
				
				$(".paginate_button a").click(function(e){
					e.preventDefault();
					$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
					goPage();
				});
				
			});
			
			function proValue(){
				var valueArr = new Array();
				var list = $("input[name='queChk']");
				for(var i = 0;i<list.length;i++){
					if(list[i].checked){
						valueArr.push(list[i].value);
					}
				}
				console.log(valueArr);
				if(valueArr.length == 0){
					alert("선택된 상품이 없습니다.");
				}else{
					$.each(valueArr, function(index, item){
						var result = "";
						result = index + ":"+item;
						$("#dep_no").val(item);
						console.log($("#dep_no").val());
						$.ajax({
							url : "/admin/product/depositUpdate",
							type : 'post',
							data : $("#depForm").serialize(),
							dataType :'text',
							success : function(data){
								location.href="/admin/product/depositList"
							}, error : function(xhr, textStatus, errorThrown){
								alert(textStatus + " (HTTP-)"+xhr.status + " / " + errorThrown + ")");
							}
							
						});  
					})
				}
			}
		</script>
	</head>
	<body>
	<c:if test='${not empty adminLogin }'>
		<div class="contentContainer container">
			<!-- <div class="contentTit page-header"><h3 class="text-center">글 목록</h3></div> -->
			<form id="depForm">
				<input type="hidden" id="dep_no" name="dep_no">
			</form>
			<div class="chooseList text-center">
				<h3><a href="/admin/product/depositList" id="que">입금대기</a> / <a href="/admin/product/depositedList" id="comp">입금완료</a></h3>
			</div>
			<div class="contentBtn text-right">
				<input type="button" value="입금" id="upBtn" class="btn btn-default">
			</div>
			<div id="div">
				<div class="boardList" class="table-height">
					<table summary="게시판 리스트" class="table table-striped">
						<thead>
							<tr>
								<th class="checkBox col-md-1 text-center"><input type="checkbox" class="allChk" name="allChk"></th>	
								<th data-value="dep_no" class="order text-center col-md-1">입금번호</th>
								<th class="text-center col-md-1">주문번호</th>
								<th class="text-center col-md-1">가격</th>
							</tr>
						</thead>
						<tbody class="list" class="table-striped">
							
							<c:choose>
								<c:when test="${not empty depositList }">
									<c:forEach var="deposit" items="${depositList}" varStatus="status">
										<tr class="text-center" data-num="${deposit.dep_no }">
											<td><input type="checkbox" value="${deposit.dep_no }" name="queChk"></td>
											<td>${deposit.dep_no }</td>
											<td class="name">${deposit.o_no }</td>
											<td class="text-center">${deposit.dep_price }</td>	
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<td colspan="4" class="tac text-center">입금건수가 존재하지 않습니다.</td>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
			<div id="serviceSearch" class="text-right">
				<form id="f_search" name="f_search" class="form-inline">
					<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum }">
					<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount }">
				</form>
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
			
		</div>
		</c:if>
	</body>
</html>