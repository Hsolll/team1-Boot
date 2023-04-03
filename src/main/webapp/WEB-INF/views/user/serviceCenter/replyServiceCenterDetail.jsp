<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script src="/resources/include/js/common.js"></script>
		<script src="/resources/vendor/jquery/jquery-3.3.1.min.js"></script>
		<script>
			$(function(){
				
				$("#listBtn").click(function(){
					location.href="/serviceCenter/serviceList";
				});
			});
		</script>
	</head>

<body>
		<div class="contentContainer container">
			<div class="text-center">
				<div class="form-container">
					<div class="detailContainer">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<td class="col-md-3">글번호</td>
									<td class="col-md-3 text-left">${replyDetail.as_no}</td>
									<td class="col-md-3">등록일</td>
									<td class="col-md-3 text-center">${replyDetail.as_created_at }</td>
								</tr>
								<tr>
									<td class="col-md-2">제목</td>
									<td class="col-md-2 text-left">${replyDetail.as_title }</td>
									<td class="col-md-4">작성자</td>
									<td class="col-md-4 text-center">${replyDetail.a_name}</td>
								</tr>
								<tr class="table-tr-height">
									<td colspan="6" class="col-md-4">${replyDetail.as_content }</td>
								</tr>
							</tbody>
						</table>
						<div class="btnArea">
							<button type="button" class="btn btn-dark" id="listBtn">목록으로</button>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>