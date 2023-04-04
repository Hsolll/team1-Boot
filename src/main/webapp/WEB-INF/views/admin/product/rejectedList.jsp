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
				
				
				$(".goDetail").click(function(){
					let b_num = $(this).parents("tr").attr("data-num");
					$("#p_no").val(p_no);
					
					$("#detailForm").attr({
						"method":"get",
						"action":"/admin/product/productDetail"
					});
					$("#detailForm").submit();
				});
				
				$(".page-item a").click(function(e){
					e.preventDefault();
					$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
					goPage();
				});
				
				$("#que").click(function(){
					$("#div2").empty();
				});
				
			});
			
			function goPage(){
				if($("#search").val()=="all"){
					$("#keyword").val("");
				}
				$("#f_search").attr({
					"method":"get",
					"action":"/admin/product/rejectedList"
				});
				$("#f_search").submit();
			}
			
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
						$("#p_no").val(item);
						console.log($("#p_no").val());
						$.ajax({
							url : "/admin/product/productUp",
							type : 'post',
							data : $("#proForm").serialize(),
							dataType :'text',
							success : function(data){
								if(data = 1){
									location.href="/admin/product/rejectedList"
								} else{
									console.log("실패");
								}
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
		<div class="contentContainer">
			<!-- <div class="contentTit page-header"><h3 class="text-center">글 목록</h3></div> -->
			<form id="proForm">
				<input type="hidden" id="p_no" name="p_no">
			</form>
			<div class="chooseList text-center">
				<h3><a href="/admin/product/queuedList" id="que">대기</a> / <a href="/admin/product/rejectedList" id="reject">거절</a></h3>
			</div>
			<div class="contentBtn text-right">
				<input type="button" value="승인" id="upBtn" class="btn btn-dark">
			</div>
			<div id="div">
				<div class="boardList" class="table-height">
					<table summary="게시판 리스트" class="table table-striped">
						<thead>
							<tr>
								<th class="checkBox col-md-1 text-center"><input type="checkbox" class="allChk" name="allChk"></th>	
								<th data-value="p_no" class="order text-center col-md-1">상품번호</th>
								<th class="text-center col-md-3">이미지</th>
								<th class="text-center col-md-2">제목</th>
								<th class="text-center col-md-2">상품명</th>
								<th class="text-center col-md-1">가격</th>
								<th data-value="b_date" class="order col-md-2 text-center">작성일</th>
							</tr>
						</thead>
						<tbody class="list" class="table-striped">
							
							<c:choose>
								<c:when test="${not empty rejectedList }">
									<c:forEach var="product" items="${rejectedList}" varStatus="status">
										<tr class="text-center" data-num="${product.p_no }">
											<td><input type="checkbox" value="${product.p_no }" name="queChk"></td>
											<td>${product.p_no }</td>
											<td>
												<c:if test="${not empty product.p_thumb }">
													<img src="/uploadStorage/product/thumbnail/${product.p_thumb }">
												</c:if>
												<c:if test="${empty product.p_thumb}">
													<img src="/resources/images/common/icon.png" alt="이미지 없음">
												</c:if>
											</td>
											<td class="goDetail text-left">${product.p_title }</td>
											<td class="name">${product.p_name }</td>
											<td class="text-center">${product.p_price }</td>
											<td class="text-center">${product.p_created_at }</td>		
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<td colspan="7" class="tac text-center">등록된 상품이 존재하지 않습니다.</td>
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
				<nav aria-label="Page navigation example">
					  <ul class="pagination justify-content-center">
					  	<c:if test="${pageMaker.prev}">
						    <li class="page-item disabled">
						    
						      <a class="page-link" href="${pageMaker.startPage -1}" tabindex="-1">Previous</a>
						    </li>
					    </c:if>
					    
					    <c:forEach var="num" begin="${pageMaker.startPage}"
												 end="${pageMaker.endPage}">
						    <li class="page-item" ${pageMaker.cvo.pageNum == num ? 'active':''}>
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
		</div>
		</c:if>
	</body>
</html>