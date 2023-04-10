<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

		<style type="text/css">
			#replyTemplate {
				display: none;
			}
			.display_no {
				display: none;
			}
		</style>
		<script type="text/javascript">
			$(function(){
				
				/** 기본 댓글 목록 불러오기 */
				let c_no = ${detail.c_no};
				console.log("c_no : " + c_no);
				listAll(c_no);
				
				/** 글입력을 위한  Ajax 연동 처리 */
				$(document).on("click", "#replyInsertBtn", function(){ 
					let insertUrl = "/communityReplies/replyInsert";
					
					/* JSON.stringify(): JavaScript 값이나 객체를 JSON 문자열로 변환. */
					let value = JSON.stringify({
						c_no : c_no,
						u_nick : $("#u_nick").val(),
						cr_content : $("#cr_content").val()
					});
					
					$.ajax({
						url : insertUrl,  //전송 url
						type : "post",    // 전송 시 method 방식
						headers : {
							"Content-Type":"application/json"
						},
						dataType:"text",
						data : value,
						error: function(xhr, textStatus, errorThrown) { //실행시 오류가 발생하였을 경우
							alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
							//alert("시스템에 문제가 있어 잠시 후 다시 진행해 주세요.");
						},
						beforeSend: function(){  // 전송 전 유효성 체크  
							if (!checkForm("#cr_content","댓글내용을"))  return false;  // checkForm()함수는 placeholder 속성을 이용하여 메시지 출력
						},
						success : function(result){ // 서버로부터 응답코드 200으로 정상 처리가 되었을 경우
							if(result=="SUCCESS"){
								alert("댓글 등록이 완료되었습니다.");
								dataReset();        // 입력폼 초기화
								listAll(c_no);
							}
						}
					});
				});
				
				/** 수정버튼 클릭 시 */
				$(document).on("click", ".replyUpdateBtn", function(){ 
					dataReset();
					let panel = $(this).parents(".reply_panel");
					let cr_no = panel.attr("data-num");
					updateForm(c_no, panel);
					
				});	
				
				
				/** 수정 폼 화면 구현 함수 */
				function updateForm(cr_no, panel){
					$("#replyForm .resetBtn").detach();
					
					let content = panel.find(".reply_content").html();
					content = content.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
					$("#cr_content").val(content);
					
					$("#replyForm button[type='button']").attr("id", "replyUpdateBtn");
					$("#replyForm button[type='button']").attr("data-crno", cr_no);
					$("#replyForm button[type='button']").html("수정하기");
					
					let resetButton = $("<button type='button' class='replyCancel resetBtn'>");
					resetButton.html("취소");
					$("#replyForm .replyBtn").after(resetButton);
				}
				
				/* 수정하기 클릭시 동적으로 생성된 "취소" 버튼 이벤트 처리 */
				$(document).on("click", ".resetBtn", function(){ 
					dataReset();
				});
				
				/** 수정을 위한  Ajax 연동 처리 */
				$(document).on("click", "#replyUpdateBtn", function(){
					
					let cr_no = $(this).attr("data-crno");	
					$.ajax({
						url:'/communityReplies/'+cr_no,
						type:'put',
						headers: { 
							"Content-Type": "application/json",
							"X-HTTP-Method-Override": "PUT" 
						},
						data:JSON.stringify({
							cr_content : $("#cr_content").val()
						}), 
						dataType:'text', 
						error: function(xhr, textStatus, errorThrown) { 
							alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
							//alert("시스템에 문제가 있어 잠시 후 다시 진행해 주세요.");
						}, 
						beforeSend: function(){
							if (!checkForm("#cr_content","댓글내용을"))	return false;
						},
						success:function(result){
							console.log("result: " + result);
							if(result == "SUCCESS"){
								alert("댓글 수정이 완료되었습니다.");
								dataReset();
								listAll(c_no);
							}
						}
					}); 
				}); 
				
				/** 삭제버튼 클릭 시 */
				$(document).on("click", ".replyDeleteBtn", function(){ 
					let panel = $(this).parents(".reply_panel");
					let cr_no = panel.attr("data-num");
					deleteBtn(c_no, cr_no);
					
				});	
				
				/** 글 삭제를 위한  Ajax 연동 처리 */
				function deleteBtn(c_no, cr_no){
					if (confirm("선택하신 댓글을 삭제하시겠습니까?")) {
						$.ajax({
							url : '/communityReplies/' + cr_no, 
							type : 'delete',   // method - get(조회)/post(입력)/put(수정)/delete(삭제) 존재         
							headers : {
								"X-HTTP-Method-Override" : "DELETE"
							},
							dataType : 'text',
							error: function(xhr, textStatus, errorThrown) { //실행시 오류가 발생하였을 경우
								alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
								//alert("시스템에 문제가 있어 잠시 후 다시 진행해 주세요.");
							},
							success : function(result) {
								console.log("result: " + result);
								if (result == 'SUCCESS') {
									alert("댓글 삭제가 완료되었습니다.");
									listAll(c_no);
								}
							}
						});
					}
				}
				
			}); // 최상위 $ 종료
			
			/** 댓글 목록 보여주는 함수*/ 
			function listAll(c_no){
				console.log("댓글 리스트 호출");
				$(".reply").detach(); // detach(): 선택한 요소를 DOM 트리에서 삭제.
				
				let url = "/communityReplies/all/" + c_no; 
				
				$.getJSON(url, function(data) {
	 				$(data).each(function() {
	 					let cr_no = this.cr_no;
	 					let u_nick = this.u_nick;
	 					let cr_content = this.cr_content;
	 					let cr_date = this.cr_date; 
						cr_content = cr_content.replace(/(\r\n|\r|\n)/g, "<br />");
						
						template(cr_no, u_nick, cr_content, cr_date);
					});
				}).fail(function() {
					alert("덧글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
				});
			}
			
			/** 새로운 글을 화면에 추가하기(보여주기) 위한 함수*/
			function template(cr_no, u_nick, cr_content, cr_date){
				console.log("template 호출");
				console.log("cr_no : " + cr_no);
				console.log("u_nick : " + u_nick);
				console.log("cr_content : " + cr_content);
				console.log("cr_date : " + cr_date);
				
				let $div = $('#reviewList');
				 
				let $element = $('#replyTemplate').clone().removeAttr('id');
				$element.attr("data-num", cr_no);
				$element.addClass("reply");
			    $element.find('.reply_name').html(u_nick);
			    $element.find('.reply_date').html(cr_date); 
			    $element.find('.reply_content').html(cr_content);

			    $div.append($element); 
			    console.log(u_nick == "${memberLogin.u_nick}");
			    if(u_nick == "${memberLogin.u_nick}"){
			    	$("#replyControllBox").removeClass("display_no");
			    }
			}
			
			/* 입력 폼 초기화 */
			function dataReset() {
				$("#replyForm").each(function(){
					this.reset();
				});
				
				$("#u_nick").prop("readonly", false);
				$("#replyForm button[type='button']").removeAttr("data-crno");
				$("#replyForm button[type='button']").attr("id", "replyInsertBtn");
				$("#replyForm button[type='button'].replyBtn").html("댓글쓰기");
				$("#replyForm button[type='button'].resetBtn").detach();
			}
			
			
		</script>	
	</head>
	<body>
		<div class="replyContainer">
		
			<%-- 댓글 입력 화면 --%>
			<form id="replyForm" class="mt30">
           		<table>
           			<tbody>
           				<tr>
           					<td class="replyBox">
           						<div>
           							<div class="mt7">
           								<label class="m0">NAME</label>
           								<input type="text" name="u_nick" id="u_nick" value="${memberLogin.u_nick}" readonly="readonly" />
           							</div>
           							<div class="mt15 writeReply">
           								<textarea name="cr_content" id="cr_content" placeholder="댓글 내용을 입력하세요."></textarea>
           								
           								<button type="button" id="replyInsertBtn" class="replyBtn">댓글쓰기</button>
           							</div>
           						</div>
           					</td>
           				</tr>
           			</tbody>
           		</table>
            </form>
            
            <%-- 댓글 리스트 --%>
            <table class="replyList">
     			<tbody id="reviewList">
       				<tr id="replyTemplate" class="reply_panel">
       					<td class="tb_left">
       						<span class="reply_name">이름</span>
       						<span class="reply_date">날짜</span>
       						<div class="reply_content">
       							내용
       						</div>
       					</td>
       					<td>
       						<div class="display_no">
	       						<button type="button" class="reply_small_btn replyUpdateBtn">UPDATE</button>
	       						<button type="button" class="reply_small_btn replyDeleteBtn">DELETE</button>
       						</div>
       					</td>
       				</tr>
       			</tbody>
       		</table>
		</div>
	</body>
</html>