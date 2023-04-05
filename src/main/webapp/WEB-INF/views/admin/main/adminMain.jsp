<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/admin.jspf"%>
	<!-- chart chartist js -->
	<script src="/resources/vendor/charts/charts-bundle/chartjs.js"></script>
	<script src="/resources/vendor/charts/charts-bundle/Chart.bundle.js"></script>
	<script src="/resources/vendor/slimscroll/jquery.slimscroll.js"></script>

	<script>
		$(function(){
			$.ajax({
				url:"/admin/main/queuedCnt",
				type:"get",
				dataType:"text",
				success:function(cnt){
					$(".product").html(cnt);
				},
				error : function(xhr, textStatus, errorThrown){
					alert(textStatus + " (HTTP-)"+xhr.status + " / " + errorThrown + ")");
				}
			});
			$.ajax({
				url:"/admin/main/depositCnt",
				type:"get",
				dataType:"text",
				success:function(cnt){
					$(".deposit").html(cnt);
				},
				error : function(xhr, textStatus, errorThrown){
					alert(textStatus + " (HTTP-)"+xhr.status + " / " + errorThrown + ")");
				}
			});
			$.ajax({
				url:"/admin/main/serviceCnt",
				type:"get",
				dataType:"text",
				success:function(cnt){
					$(".service").html(cnt);
				},
				error : function(xhr, textStatus, errorThrown){
					alert(textStatus + " (HTTP-)"+xhr.status + " / " + errorThrown + ")");
				}
			});
			$.ajax({
				url:"/admin/main/getUsers",
				type:"get",
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success:function(data){
					var labelList = new Array();
					var valueList = new Array();
					var rcolor = "";
					$.each(data, function(key, value){
						labelList.push(this["MON"]);
						valueList.push(this["CNT"]);
						rcolor = Math.random() * 0xffffff;
						rcolor = parseInt(rcolor);
						rcolor = rcolor.toString(16);
					});
				},
				error : function(xhr, textStatus, errorThrown){
					alert(textStatus + " (HTTP-)"+xhr.status + " / " + errorThrown + ")");
				}
			});
			$.ajax({
				url:"/admin/main/getOrders",
				type:"get",
				dataType:"json",
				contentType:"application/json; charset=UTF-8",
				success:function(data){
					
				},
				error : function(xhr, textStatus, errorThrown){
					alert(textStatus + " (HTTP-)"+xhr.status + " / " + errorThrown + ")");
				}
			});
			
		})
	</script>
</head>
<body>
	<div class="container-fluid dashboard-content">
		<div class="row">
			<div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
				<div class="card">
					<div class="card-body">
						<div class="d-inline-block">
							<h5 class="text-muted">승인대기</h5>
							<h2 class="mb-0 product"></h2>
						</div>
						<div class="float-right icon-circle-medium  icon-box-lg  bg-info-light mt-1">
							<i class="fa fa-pencil-alt fa-fw fa-sm text-info"></i>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
				<div class="card">
					<div class="card-body">
						<div class="d-inline-block">
							<h5 class="text-muted">입금대기</h5>
							<h2 class="mb-0 deposit"></h2>
						</div>
						<div class="float-right icon-circle-medium  icon-box-lg  bg-brand-light mt-1">
							<i class="fa fa-won-sign fa-fw fa-sm text-brand"></i>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
				<div class="card">
					<div class="card-body">
						<div class="d-inline-block">
							<h5 class="text-muted">신고대기</h5>
							<h2 class="mb-0 service"></h2>
						</div>
						<div class="float-right icon-circle-medium  icon-box-lg  bg-secondary-light mt-1">
							<i class="fa fa-fire fa-fw fa-sm text-secondary"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>