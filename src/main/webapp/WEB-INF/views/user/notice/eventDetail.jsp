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
				location.href="/notice/eventList"; 
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
						<table class="table table-bordered thBgGray" style="table-layout: fixed;">
						<colgroup>
							<col style="width: 14%;">
							<col>
							<col style="width: 14%;">
							<col>
						</colgroup>
							<tbody>
								<tr>
									<th>글번호</th>
									<td class="text-left">${detail.an_no}</td>
									<th>등록일</th>
									<td class="text-left">${detail.an_created_at }</td>
								</tr>
								<tr>
									<th>제목</th>
									<td class="text-left">${detail.an_title }</td>
									<th>작성자</th>
									<td class="text-left">${detail.a_name}</td>
								</tr>
								<tr class="table-tr-height">
									<th style="vertical-align: middle;">내용</th>
									<td colspan="3" class="text-left" style="overflow-x: auto; height: 280px; word-break: break-all;"><img src="/uploadStorage/notice/${detail.an_file}" style="display: block;" onError="this.style.visibility='hidden'">${detail.an_content }</td>
								</tr>
							</tbody>
						</table>
						<div class="btnArea text-right">
							<button type="button" class="btn btn-dark" id="noticeListBtn">목록으로</button>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>