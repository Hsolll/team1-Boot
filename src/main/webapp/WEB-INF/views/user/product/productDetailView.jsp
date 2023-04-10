<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/resources/include/js/productCommon.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/include/css/productDetail.css">
</head>
<body>
	<div id="detail">
		<table id="detailTable">
				<tr>
					<td id="det">
						<div class="all">
							<div class="img2">
								<c:if test="${not empty detail.p_file}">
									<img class="iim" src="/uploadStorage/product/${detail.p_file}"/>
								</c:if>
								
								<c:if test="${empty detail.p_file}">
									<img class="iim2" src="/resources/images/common/noimage.png"/>
								</c:if>
							</div>
						<div class="conss">
								<div class="cons p_title">
											<div class="titt">${detail.p_title} </div>
								</div>
								<div class="conAll">
									
									<div class="con">
										<div class="cons p_name">
											<div class="cre one">상품 이름 :</div>
											<div class="cre two" >${detail.p_name}</div>
										</div>
										<div class="cons p_cate">
											<div class="cre one">카테고리 :</div>
											<div class="cre two" >${detail.p_cate}</div>
										</div>
										<div class="cons p_price">
											<div class="cre one">가격 :</div>
											<div class="cre two">
												<c:if test="${detail.p_price == 0}">무료나눔</c:if>
											    <c:if test="${detail.p_price != 0}">${detail.p_price}원</c:if>
										    </div>
									    </div>
									    <div class="cons local">
									    	<div class="cre one">지역 :</div>
									    	<div class="cre two">${detail.p_local}</div>
								    	</div>
								    	<div class="cons p_created_at">
											<div class="cre one">작성일 :</div>
											<div class="cre two">${detail.p_created_at}</div>
										</div>
									</div>
									<div class="con2">
										<div class="status">
											
											<div class="method" id="md">${detail.trans_method}</div>
											<div class="cre two" id="sts">${detail.p_status}</div>
										</div>
										<div class="cons purchase"><input type="button" class="pbtn" value="문의하기"/></div>

									</div>
								</div>
							</div>
						</div>
						<div class="cont">
							<div id="seller">
								<div class="text-center sels">판매자</div>
								<div class="sels2">${detail.u_nick}<div id="black">님</div></div>
							</div>
							<div id="content">${detail.p_content}</div>
						</div>
					</td>
				</tr>
		</table>
	<!-- //////////////////////////// 댓글 작성 ////////////////////////////-->
	</div>
 	<div id="reply">
 		<div class="line text-left"><div class="line1">댓글 작성하기</div></div>
 		<form id="replyForm">
	 		<table id="replyTable">
	 			<tr id="replyUserId">
	 				<td class="re">
			 			<div id="replyTr">
		 					<div class="sels23"><div class="se">${member.u_nick}</div></div>
		 					<div id="replyCon"><input id="replyInput" name="pr_content" type="text" placeholder="  댓글을 입력해주세요"/></div>
		 					<div id="replyfirm"><input id="replyConfirm" type="button" value="등록"/></div>
			 			</div>
						<input type="hidden" name="p_no" value="${detail.p_no}" readonly/>
						<input type="hidden" class="mu_no" name="u_no" value="${member.u_no}" readonly>
						<div class="line2 text-left"><div class="line1"></div></div>
	 				</td>
	 			</tr>
	 		</table >
 		</form>
 		
 		
 		
 		<table class="tb">
	 		<c:choose>
	 			<c:when test="${not empty list}">
	 				<c:forEach var="rlist" items="${list}">
	 					<tr class="tb_tr"> 
	 						<td>
		 						<div class="as">
					 				<div class="sels23"><div class="se">${rlist.u_nick}</div></div>
				 					<div class="i"><div class="i_c">${rlist.pr_content}</div></div>
			 						<c:if test = "${rlist.u_no == member.u_no}">
		 							<div class="replyF">
		 								<div class="res">
				 						<form class="replyDelete">	
					 						<input class="delete" type="button" value="삭제"/>
					 						<input type="hidden" name="u_no" value="${rlist.u_no}"/>
					 						<input type="hidden" name="p_no" value="${rlist.p_no}"/>
					 						<input type="hidden" name="pr_no" value="${rlist.pr_no}"/>
				 						</form>
				 						</div>
			 						</div>
					 				</c:if>
				 					<c:if test = "${rlist.u_no != member.u_no}">
				 					<div></div>
				 					</c:if>
				 				</div>
			 				</td>
			 			</tr>
	 				</c:forEach>
	 			</c:when>
	 			<c:otherwise>
	 				<div class="empty text-center">비어있습니다</div>
	 			</c:otherwise>
	 		</c:choose>
 		</table>
 	</div>
</body>
</html>