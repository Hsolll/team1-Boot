<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<link type="text/css" rel="stylesheet" href="/resources/include/css/community.css" />


		<script type="text/javascript">
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
			<div class="detail_table mt30">
						<div class="buttonList tr" style="display: block;">
							<button type="button" class="buttonBlack" id="noticeListBtn">LIST</button>
						</div>
	            <table class="detailView">
	                <colgroup>
	                </colgroup>
	                <thead>
	                    <tr class="text-center">
	                        <th>${detail.an_title}</th>
	                    </tr>
	                </thead>
	                <tbody>
	                	<tr>
							<td style="border: 0;">
								<div class="detail_date">
									<div>
										<span><em>Date : </em>${ detail.an_created_at }</span>
									</div>
									<div>
										<span><em>Name : </em>${ detail.a_name }</span>
										<span><em>Hits : </em>${ detail.an_cnt }</span>
									</div>
								</div>
							</td> 
						</tr>
						<tr>
							<td>
								<div class="detail_content">
									<p>${ detail.an_content }</p>
								</div>
							</td>
						</tr>
	                </tbody>
	            </table>
	        </div>
	</body>
</html>