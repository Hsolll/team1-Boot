<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<script src="/resources/include/js/common.js"></script>
		<script src="/resources/vendor/jquery/jquery-3.3.1.min.js"></script>
		<title>noticewriteForm</title>
		
		<script type="text/javascript">
		$(function(){
			$(".dashboard-wrapper .page-header h1").html("공지관리");
			/* 등록 버튼 클릭 시 처리 이벤트 */
			$("#boardInsertBtn").click(function(){
				if (!chkData("#an_title","제목을"))	return;
				else if (!chkData("#an_content","작성할 내용을"))	return;
				//else if (!chkData("#file","업로드할 이미지 파일을")) return; 필수요소
				else {
					if($("#file").val()!=""){  // 업로드할 이미지 파일이 존재한다면
						// 확장자가 png, jpg, gif 외 파일을 업로드 할 수 없습니다 또는 gif, png, jpg 파일만 업로드 할 수 있습니다. 라고 유효성 체크
						if (!chkFile($("#file"))) return;
					}  // 파일업로드가 필수 아닌경우
					let boardVar = $('input[name=an_category]:checked').val();
					$(".an_category").val(boardVar);
					$("#f_writeForm").attr({
						"method":"post",
						"enctype":"multipart/form-data",  // enctype 속성의 기본 값은 "application/x-www-form-urlcencoded". POST방식 폼 전송에 기본 값으로 사용
						"action":"/admin/noticeInsert"
					});
					$("#f_writeForm").submit();
				}
			});
			
			/* 취소 버튼 클릭 시 처리 이벤트 */
			$("#boardCancelBtn").click(function(){
				$("#f_writeForm").each(function(){
					this.reset();
				});
			});
			
			/* 목록 버튼 클릭 시 처리 이벤트 */
			$("#boardListBtn").click(function(){
				location.href="/admin/noticeList";
			});
		});
	</script>
	</head>

<body>

	<%-- =================== 등록페이지 시작  ================= --%>
		<div>
			<div class="rowTable">
			<form id="f_writeForm" name="f_writeForm" class="form-horizontal">
				<table>
					<colgroup>
						<col width= "18%" />
						<col width= "82%" />
					</colgroup>
					<tbody>
						<tr>
							<th>제목</th>
							<td><input type="text" class="form-control" id="an_title" name="an_title" placeholder="제목을 입력해주세요"></td>
						</tr>
						<tr>
							<th>게시판 선택</th>
							<td class="text-midle">
								<label for="notice">공지사항 게시판</label> <input type="radio" id="notice" class="an_category" name="an_category" value="[공지사항]" style="display: inline-block;" checked="checked" /><br />
								<label for="event">이벤트 게시판</label> <input type="radio" id="event" class="an_category" name="an_category" value="[이벤트]" style="display: inline-block;"  />
							</td>
						</tr>
						<tr>
							<th>이미지 파일</th>
							<td colspan="3"><input type="file" name="file" id="file"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea class="form-control" id="an_content" name="an_content" placeholder="내용을 입력해주세요"></textarea></td>
						</tr>
					</tbody>
				</table>
				</form>
			</div>
			<%-- =================== 등록페이지 종료  ================= --%>
			
			<div class="btnArea">
				<button type="button" id="boardInsertBtn" class="btn btn-dark">등록</button>
				<button type="button" id="boardCancelBtn" class="btn btn-dark">취소</button>
				<button type="button" id="boardListBtn" class="btn btn-dark">목록</button>
			</div>	
			
		</div>
</body>
</html>