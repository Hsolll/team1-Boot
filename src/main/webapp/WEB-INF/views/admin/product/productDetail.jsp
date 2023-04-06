<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/admin.jspf" %>
	<script type="text/javascript">
		
		$(function(){
			/* 수정 버튼 클릭 시 처리 이벤트 */
			$("#upBtn").click(function(){
					goUrl = "/admin/product/productUp";
					$("#f_data").attr("action",goUrl);
					$("#f_data").submit();
			});
			
			 /*삭제 버튼 클릭 시 처리 이벤트 */
			$("#downBtn").click(function(){
				goUrl = "/admin/product/productDown";
				$("#f_data").attr("action",goUrl);
				$("#f_data").submit();
			});
			/* 목록 버튼 클릭 시 처리 이벤트 */
			$("#listBtn").click(function(){
				location.href="/admin/product/queuedList"; 
			});
			
		});
		</script>
		<style>
			img{
				width: 300px;
			}
		</style>
	</head>
	<body>
		<form name="f_data" id="f_data" method="post">
			<input type="hidden" name="p_no" id="p_no" value="${detail.p_no}"/>
		</form>
		<div class="container-fluid dashboard-content">
			<div class="offset-xl-2 col-xl-8 col-lg-12 col-md-12 col-sm-12 col-12">
			<div class="row">
				<%-- <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="section-block" id="cardaction">
						
						<h3 class="section-title">상품번호 ${detail.p_no }</h3>
						<p>작성자 ${detail.u_no }</p>
					</div>
				</div> --%>
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 pr-xl-0 pr-lg-0 pr-md-0  m-b-30">
					<div class="product-slider">
						<c:if test="${not empty detail.p_thumb }">
							<img src="/uploadStorage/product/thumbnail/${detail.p_thumb }">
						</c:if>
						<c:if test="${empty detail.p_thumb}">
							<img src="/resources/images/product-pic-3.jpg" alt="이미지 없음">
						</c:if>
					</div>
				</div>
				<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12 pl-xl-0 pl-lg-0 pl-md-0 border-left m-b-30">
					<div class="product-details">
						<div class="border-bottom pb-3 mb-3">
							<h4>상품번호:${detail.p_no }&nbsp;&nbsp;&nbsp;&nbsp;작성자:${detail.u_no }</h4>
							<h2 class="mb-3">${detail.p_name }</h2>
							<h3 class="mb-0 text-primary">${detail.p_price }</h3>
						</div>
						<div class="product-colors border-bottom">
							<h4 class="mb-1">등록일</h4>
							<p>${detail.p_created_at }</p>
						</div>
						<div class="product-description">
							<h4 class="mb-1">${detail.p_title }</h4>
							<p>${detail.p_content }</p>
						</div>
					</div>
				</div>
				</div>
			</div>
			<div class="btnArea">
				<button type="button" class="btn btn-dark" id="upBtn">승인하기</button>
				<button type="button" class="btn btn-dark" id="downBtn">거절하기</button>
				<button type="button" class="btn btn-dark" id="listBtn">목록으로</button>
			</div>		
		</div>
	</body>
</html>