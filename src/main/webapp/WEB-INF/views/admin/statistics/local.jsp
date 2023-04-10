<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/admin.jspf"%>

		<!-- chart chartist js -->
		<script src="/resources/vendor/charts/charts-bundle/chartjs.js"></script>
		<script src="/resources/vendor/charts/charts-bundle/Chart.bundle.js"></script>
		<script src="/resources/vendor/slimscroll/jquery.slimscroll.js"></script>
		<script src="/resources/include/js/statistics_local.js"></script>
		<style>
			button {
				width: 30px;
				height: 30px;
				border: solid 1px black;
				background-color: white;
				margin: 0;
			}
			
			input {
				height: 30px;
				border: solid 1px black;
				width: 170px;
				text-align: center;
				margin: 0;
			}
			
			.bottomDiv {
				padding: 20px;
			}
			
			.local {
				margin-inline: auto;
			}
		</style>
	
	</head>
	<body>
		<c:if test='${not empty adminLogin }'>
			<div class="container-fluid  dashboard-content">
				<!-- ============================================================== -->
				<!-- simple pie chart  -->
				<!-- ============================================================== -->
				<div>
					<h2>선호 지역 통계</h2>
				</div>
				<div class="row">
					<div class="col-x1-6 col-lg-6 col-md-6 col-sm-12 col-12">
						<div class="card">
							<h5 class="card-header">지역 통계</h5>
							<div class="card-body">
								<canvas id="myChart"></canvas>
							</div>
						</div>
					</div>
					<div class="col-x1-6 col-lg-6 col-md-6 col-sm-12 col-12">
						<div class="card">
							<h5 class="card-header">지역 통계</h5>
							<div class="card-body">
								<canvas id="myChart2"></canvas>
							</div>
						</div>
					</div>
				</div>
				<div class="bottomDiv">
					<div>
						<table class="table table-hover cateTb">
							<thead>
								<tr>
									<td>지역명</td>
									<td>1월</td>
									<td>2월</td>
									<td>3월</td>
									<td>4월</td>
									<td>5월</td>
									<td>6월</td>
									<td>7월</td>
									<td>8월</td>
									<td>9월</td>
									<td>10월</td>
									<td>11월</td>
									<td>12월</td>
									<td>총합</td>
								</tr>
							</thead>
							<tbody class="local-content">
								<tr id="item">
									<td class="item"></td>
									<td class="item1"></td>
									<td class="item2"></td>
									<td class="item3"></td>
									<td class="item4"></td>
									<td class="item5"></td>
									<td class="item6"></td>
									<td class="item7"></td>
									<td class="item8"></td>
									<td class="item9"></td>
									<td class="item10"></td>
									<td class="item11"></td>
									<td class="item12"></td>
									<td class="total"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- end simple pie chart  -->
				<!-- ============================================================== -->
			</div>
		</c:if>
	</body>
</html>
