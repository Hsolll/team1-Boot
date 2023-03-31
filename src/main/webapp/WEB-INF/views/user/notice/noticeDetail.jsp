<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script src="/resources/include/js/common.js"></script>
		<script type="text/javascript">
		let buttonCheck = 0; // 수정버튼과 삭제버튼을 구별하기 위한 변수
		$(function(){
			$(".content_wrap .page-header h1").html("공지사항");
			 
			/* 목록 버튼 클릭 시 처리 이벤트 */
			$("#noticeListBtn").click(function(){
				location.href="/notice/noticeList"; 
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
									<td class="col-md-3 text-left">${detail.an_no}</td>
									<td class="col-md-3">등록일</td>
									<td class="col-md-3 text-center">${detail.an_created_at }</td>
								</tr>
								<tr>
									<td class="col-md-2">제목</td>
									<td class="col-md-2 text-left">${detail.an_title }</td>
									<td class="col-md-4">작성자</td>
									<td class="col-md-4 text-center">${detail.a_name}</td>
								</tr>
								<tr class="table-tr-height">
									<td colspan="6" class="col-md-4"><img src="/uploadStorage/notice/${detail.an_file}" onError="this.style.visibility='hidden'">${detail.an_content }</td>
								</tr>
							</tbody>
						</table>
						<div class="btnArea">
							<button type="button" class="btn btn-dark" id="noticeListBtn">목록으로</button>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>