<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<link type="text/css" rel="stylesheet" href="/resources/include/css/faqList.css">
	<script>
		$(function(){
			$("#listBtn").click(function(){
				location.href="/faq/faqList";
			});
		});
	</script>
	</head>
	<body>
	
	
		<div style="position:relative;">
			<div class="detail_table mt30">
				<div class="buttonList tr">
					<button type="button" class="buttonBlack" id="listBtn">LIST</button>
				</div>
				<table class="detailView">
					<colgroup>
					</colgroup>	
					<thead>
						<tr class="text-center">
							<th>${detail.f_title}</th>							
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="border:0;">
								<div class="detail_date">
									<div>
										<c:if test='${empty detail.f_updated_at }'>
											<span><em>Date : </em>${detail.f_created_at }</span>
										</c:if>
										<c:if test='${not empty detail.f_updated_at }'>
											<span><em>Date : </em>${detail.f_updated_at }</span>								
										</c:if>									
									</div>
									<div>
										<span><em>Name : </em>관리자</span>
										<span><em>Hits : </em>${detail.f_readcnt }</span>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="detail_content">
									<p>${detail.f_content }</p>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>