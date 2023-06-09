<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/admin.jspf"%>
	<!-- chart chartist js -->
	<script src="/resources/vendor/charts/charts-bundle/chartjs.js"></script>
	<script src="/resources/vendor/charts/charts-bundle/Chart.bundle.js"></script>
	<script src="/resources/vendor/slimscroll/jquery.slimscroll.js"></script>

	<script src="/resources/include/js/adminMain.js"></script>
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