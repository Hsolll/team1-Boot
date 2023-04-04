<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		
		<link type="text/css" rel="stylesheet" href="/resources/include/css/communityWrite.css" />
		
		<script type="text/javascript">
			$(function(){
				$(".content_wrap .page-header h1").html("게시물 작성");
				
				/* 로그인한 아이디 자동 입력 */
				let u_id = "<c:out value='${memberLogin.u_id}' />";
				$("input[name='u_id']").val(u_id);
				
				/* 목록 버튼 클릭 시 처리 이벤트 */
				$("#listBtn").click(function(){
					let category = "<c:out value='${community.c_category}' />";
					console.log("category : " + category);
					location.href="/community/communityList?c_category=" + category;
				});
				
				/* 저장 버튼 클릭 시 처리 이벤트 */
				$("#insertBtn").click(function(){
					// 입력값 체크
					if(!chkData("#c_title", "제목을")) return;
					else if(!chkData("#c_content", "작성할 내용을")) return;
					else {
						if($("#file").val()!=""){ // 업로드할 이미지 파일이 존재한다면
							// 확장자가 png, jpg, gif 외 파일을 업로드 할 수 없습니다 또는 gif, png, jpg 파일만 업로드 할 수 있습니다.  라고 유효성 체크 
							if (!chkFile($("#file"))) return; // 이미지 파일만 업로드 가능. 
						}
						
						$("#insertFrom").attr({
							"method":"post",
							"enctype":"multipart/form-data", // enctype 속성의 기본 값은 "application/x-www-form-urlcencoded". POST방식 폼 전송에 기본 값으로 사용
							"action":"/community/insertCommunity"
						});
						$("#insertFrom").submit();
					}
				});
				
			});
		</script>
	</head>
	<body>
		<div class="community_wite">
	        <form name="insertFrom" id="insertFrom">
	        	<input type="hidden" name="u_no" id="u_no" value="${ memberLogin.u_no }" />
	        	<input type="hidden" name="c_category" id="c_category" value="${ community.c_category }" />
	            <table>
	                <colgroup>
	                    <col style="width: 150px;">
	                    <col>
	                </colgroup>
	                <tbody>
	                    <tr>
	                        <th>아이디</th>
	                        <td>
	                            <input type="text" class="w350" name="u_id" id="u_id" readonly="readonly" />
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>제목</th>
	                        <td>
	                            <input type="text" class="w700" name="c_title" id="c_title" />
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>내용</th>
	                        <td>
	                            <textarea name="c_content" id="c_content"></textarea>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>이미지파일</th>
	                        <td>
	                            <input type="file" name="file" id="file" />
	                        </td>
	                    </tr>
	                </tbody>
	            </table>
	            <div class="buttonArea">
	                <button type="button" class="buttonBlack" id="insertBtn">등록하기</button>
	                <button type="button" class="buttonWhite" id="listBtn">목록보기</button>
	            </div>
	        </form>
	    </div>
	</body>
</html>