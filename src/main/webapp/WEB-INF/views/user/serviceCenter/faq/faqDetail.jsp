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
	<style>
		.thBgGray th {text-align: center !important; background: #f1f1f1 !important;}
	</style>
	</head>
	<body>
	
	
		<div class="contentContainer container">
			<div class="text-center">
				<div class="form-container">
					<div class="detailContainer">
						<table class="table table-bordered thBgGray">
							<colgroup>
								<col style="width: 14%;">
								<col>
								<col style="width: 14%;">
								<col>
							</colgroup>	
							<tbody>
								<tr>
									<th>글번호</th>
									<td class="text-left">${detail.f_no}</td>
									<th>등록일</th>
									<c:if test='${empty detail.f_updated_at }'>
										<td class="col-md-3 text-left">${detail.f_created_at }</td>
									</c:if>
									<c:if test='${not empty detail.f_updated_at }'>
										<td class="col-md-3 text-left">${detail.f_updated_at }</td>								
									</c:if>
								</tr>
								<tr>
									<th>제목</th>
									<td class="text-left">${detail.f_title}</td>
									<th>작성자</th>
									<td class="text-left">관리자   (조회수 : ${detail.f_readcnt })</td>
								</tr>
								<tr class="table-tr-height">
									<th style="vertical-align: middle;">내용</th>
									<td colspan="3" class="text-left" style="overflow-x: auto; height: 280px; word-break: break-all;">${detail.f_content }</td>
								</tr>
							</tbody>
						</table>
						<div class="btnArea text-right">
							<button type="button" class="btn btn-dark" id="listBtn">목록으로</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>