<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
<script type="text/javascript" src="/resources/include/js/jquery-3.6.2.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#back").click(function(){
				history.back();
			});
		});
	</script>
	<style>
		img{
			margin-top:80px;
		}
		.btn{
			width: 100px;
			height: 36px; 
			background-color: #595959;
			color: white;
		}
	</style>
	</head>
	<body>
		<div class="container">
				<img alt="error404" src="/resources/images/common/404.png" width="1100">
				<p class="text-center">
					<button type="button" class="btn" id="back" >돌아가기</button>
				</p>
		</div>
	</body>
</html>