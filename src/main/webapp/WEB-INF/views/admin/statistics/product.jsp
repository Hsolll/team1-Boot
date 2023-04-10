<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/admin.jspf"%>

		<!-- chart chartist js -->
		<script src="/resources/vendor/charts/charts-bundle/chartjs.js"></script>
		<script src="/resources/vendor/charts/charts-bundle/Chart.bundle.js"></script>
		<script src="/resources/vendor/slimscroll/jquery.slimscroll.js"></script>
		<script src="/resources/include/js/statistics_product.js"></script>
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
			
			#safe {
				margin-top: 40px;
			}
			
			.bottomDiv {
				padding-left: 20px;
			}
			
			.amountTb {
				width: 500px;
				margin-left: 100px;
			}
		</style>
	</head>
	<body>
		<c:if test='${not empty adminLogin }'>
			<div class="container-fluid  dashboard-content">
				<div>
					<h2>상품별 통계</h2>
				</div>
				<div class="row">
					<div class="col-x1-6 col-lg-6 col-md-6 col-sm-12 col-12">
						<div class="card">
							<h5 class="card-header">상품별 통계</h5>
							<div class="card-body">
								<canvas id="myChart" width="800" height="400"></canvas>
							</div>
						</div>
					</div>
				</div>
				<div>
					<table class="table table-hover productTb text-center">
						<thead>
							<tr>
								<td>종류</td>
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
								<td>합계</td>
							</tr>
						</thead>
						<tbody class="product-content">
							<tr id="item1">
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
				<div id="safe">
					<h2>안심거래 통계</h2>
					<div class="bottomDiv">
						<div class="row">
							<div class="product">
								<div class="card">
									<h5 class="card-header">안심거래 결제내역 통계</h5>
									<div class="card-body">
										<canvas id="myChart2" width="800" height="450"></canvas>
									</div>
								</div>
							</div>
							<div>
								<table class="table table-hover amountTb text-center">
									<thead>
										<tr>
											<td>월</td>
											<td>금액(원)</td>
										</tr>
									</thead>
									<tbody class="amount-content">
										<tr id="item2">
											<td class="mon"></td>
											<td class="amount"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
	</body>
</html>
