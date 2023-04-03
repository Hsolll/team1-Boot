<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		
		<link type="text/css" rel="stylesheet" href="/resources/include/css/community.css" />
		<script type="text/javascript">
			$(function(){
				$(".content_wrap .page-header h1").html("상세페이지");
				
				
				
			});
		</script>
	</head>
	<body>
		<div>
			
			<div class="detail_table mt30">
	            <table>
	                <colgroup>
	                </colgroup>
	                <thead>
	                    <tr class="text-center">
	                        <th>${detail.c_title}</th>
	                    </tr>
	                </thead>
	                <tbody>
	                	<tr>
							<td style="border: 0;">
								<div class="detail_date">
									<div>
										<span><em>Date : </em>${ detail.c_created_at }</span>
									</div>
									<div>
										<span><em>Name : </em>${ detail.u_id }</span>
										<span><em>Hits : </em>${ detail.c_cnt }</span>
									</div>
								</div>
							</td> 
						</tr>
						<tr>
							<td>
								<div class="detail_content">
									<p>${ detail.c_content }</p>
								</div>
							</td>
						</tr>
	                </tbody>
	            </table>
	            
	            <form>
	            	<fieldset>
	            		<table>
	            			<tbody>
	            				<tr>
	            					<td class="replyBox">
	            						<div>
	            							<div class="mt7">
	            								<label>NAME</label>
	            								<input type="text" name="u_id" id="u_id" placeholder="이름" />
	            							</div>
	            							<div class="mt7 writeReply">
	            							
	            							</div>
	            						</div>
	            					</td>
	            				</tr>
	            			</tbody>
	            		</table>
	            	</fieldset>
	            </form>
	        </div>
		</div>
	</body>
</html>