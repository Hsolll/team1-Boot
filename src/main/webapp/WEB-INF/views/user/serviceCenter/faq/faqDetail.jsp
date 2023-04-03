<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	<script>
		$(function(){
			$("#listBtn").click(function(){
				location.href="/faq/faqList";
			});
		});
	</script>
	</head>
	<body>
		<div class="contentContainer container">
			
			<div class="contentTB test-center">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td class="col-md-3">작성자</td>
							<td class="col-md-3 text-center">관리자  (조회수 : ${detail.f_readcnt })</td>
							<td class="col-md-3">등록일</td>
							<c:if test='${empty detail.f_updated_at }'>
								<td class="col-md-3 text-center">${detail.f_created_at }</td>
							</c:if>
							<c:if test='${not empty detail.f_updated_at }'>
								<td class="col-md-3 text-center">${detail.f_updated_at }</td>								
							</c:if>
						</tr>
						<tr>
							<td class="col-md-4">제목</td>
							<td colspan="3" class="col-md-8 text-left">${detail.f_title }</td>
						</tr>
						<tr class="table-tr-height">
							<td colspan="4" class="col-md-4">${detail.f_content }</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="btnArea col-md-4 text-right">
				<button type="button" id="listBtn" class="btn btn_success">목록</button>
			</div>
		</div>
	</body>
</html>