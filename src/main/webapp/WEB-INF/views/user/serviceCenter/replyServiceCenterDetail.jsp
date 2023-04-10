<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<link type="text/css" rel="stylesheet" href="/resources/include/css/community.css" />
		<script>
			$(function(){
				
				$("#listBtn").click(function(){
					location.href="/serviceCenter/serviceList";
				});
			});
		</script>
	</head>

<body>
		<div style="position: relative;">
			
			<div class="detail_table mt30">
						<div class="buttonList tr" style="display: block;">
							<button type="button" class="buttonBlack" id="listBtn">LIST</button>
						</div>
	            <table class="detailView">
	                <colgroup>
	                </colgroup>
	                <thead>
	                    <tr class="text-center">
	                        <th>${replyDetail.as_title}</th>
	                    </tr>
	                </thead>
	                <tbody>
	                	<tr>
							<td style="border: 0;">
								<div class="detail_date">
									<div>
										<span><em>Date : </em>${ replyDetail.as_created_at }</span>
									</div>
									<div>
										<span><em>Name : </em>${ replyDetail.a_name }</span>
										<span><em>No : </em>${ replyDetail.as_no }</span>
									</div>
								</div>
							</td> 
						</tr>
						<tr>
							<td>
								<div class="detail_content">
									<p>${ replyDetail.as_content }</p>
								</div>
							</td>
						</tr>
	                </tbody>
	            </table>
	        </div>
		</div>
</body>
</html>