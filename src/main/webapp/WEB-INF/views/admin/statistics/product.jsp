<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/admin.jspf"%>

		<!-- chart chartist js -->
		<script src="/resources/vendor/charts/charts-bundle/chartjs.js"></script>
		<script src="/resources/vendor/charts/charts-bundle/Chart.bundle.js"></script>
		<script src="/resources/vendor/slimscroll/jquery.slimscroll.js"></script>
		<style>
	  		button {
			    width: 30px;
			    height: 30px;
			    border: solid 1px black;
			    background-color: white;
			    margin:0;
			}
			input {
			    height: 30px;
			    border: solid 1px black;
			    width: 170px;
			    text-align: center;
			    margin:0;
			}
			#safe{
				margin-top: 40px;
			}
			.bottomDiv{
				padding-left:20px;
				
			}
			.amountTb{
				width: 500px;
				margin-left: 100px;
			}
	  	</style>
	  	<script type="text/javascript">
	  		var labelsList = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];
	  		
	    	function template1(product, valueList, total){
	    		let $tbody = $(".product-content");
	    		let $tb = $("#item1").clone().removeAttr("id");
	    		
	    		$tb.find('.item').html(product);
	    		$tb.find('.item1').html(valueList[0]);
	    		$tb.find('.item2').html(valueList[1]);
	    		$tb.find('.item3').html(valueList[2]);
	    		$tb.find('.item4').html(valueList[3]);
	    		$tb.find('.item5').html(valueList[4]);
	    		$tb.find('.item6').html(valueList[5]);
	    		$tb.find('.item7').html(valueList[6]);
	    		$tb.find('.item8').html(valueList[7]);
	    		$tb.find('.item9').html(valueList[8]);
	    		$tb.find('.item10').html(valueList[9]);
	    		$tb.find('.item11').html(valueList[10]);
	    		$tb.find('.item12').html(valueList[11]);
	    		$tb.find('.total').html(total);
	    		
	    		$tbody.append($tb);
	    		
	    	}
	    	function template(mon, amount){
	    		let $tbody = $(".amount-content");
	    		let $tb = $("#item2").clone().removeAttr("id");
	    		
	    		$tb.find('.mon').html(mon);
	    		$tb.find('.amount').html(amount);
	    		
	    		$tbody.append($tb);
	    		
	    	}
	    	
			$(function(){
				let admin = "<c:out value='${adminLogin.a_no }'/>";
				if(admin == ""){
					alert("잘못된 접근입니다.");
					location.href="/admin/login";
				}
				$.ajax({
						url : "/admin/statistics/product",
						type:"get",
						dataType:"json",
						contentType:"application/json; charset=utf-8",
						success:function(data){
							var list = new Array();
							var labelList = new Array();
							var colorList = new Array();
							var valueList = new Array();
							var valuesList = new Array();
							var dataList  = new Array();
							var totalList = new Array();
							$.each(data, function(key, value){
								labelList.push(this.key);
								
								valueList.push(this["1월"]);
								valueList.push(this["2월"]);
								valueList.push(this["3월"]);
								valueList.push(this["4월"]);
								valueList.push(this["5월"]);
								valueList.push(this["6월"]);
								valueList.push(this["7월"]);
								valueList.push(this["8월"]);
								valueList.push(this["9월"]);
								valueList.push(this["10월"]);
								valueList.push(this["11월"]);
								valueList.push(this["12월"]);
								totalList.push(this["총합"]);
								/* 색 랜덤으로 추가하기 */
								var rcolor = 0;
								rcolor = Math.random() * 0xffffff;
								rcolor = parseInt(rcolor);
								rcolor = rcolor.toString(16);
								
								colorList.push("#"+rcolor);
								dataList.push(valueList);
								valueList = [];
							});
							
							const datas = {
								labels : labelsList,
								datasets:[
									{
										label:'일반중고상품',
										data:dataList[0],
										order:1,
										backgroundColor:'rgba(255, 99, 132, 0.5)'
									},
									{
										label:'안심거래상품',
										data:dataList[1],
										order:0,
										type:'line',
										borderColor:'rgba(54, 162, 235, 0.5)',
										backgroundColor:'rgba(54, 162, 235, 0.5)',
										borderWidth:1,
										fill:false
									}
								]
							};
							console.log(datas);
							var ctx = document.getElementById('myChart').getContext('2d');
							
							const myChart = new Chart(ctx, {
								type:'bar',
								data: datas,
								options:{
									tooltips:{
										mode:'index',
										intersect:false
									},
									hover:{
										intersect:false,
										mode:'index'
									},
									responsive:true,
									scales:{
										y:[{
											ticks:{
												beginAtZero:true,
												stepSize: 10
											}
										}]
									}
								}
							});
							template1("일반중고상품", dataList[0], totalList[0]);
							template1("안심거래상품", dataList[1], totalList[1]);
						},
						error : function(xhr, textStatus, errorThrown){
							alert(textStatus + " (HTTP-)"+xhr.status + " / " + errorThrown + ")");
						}
					});
				
			
				
			
				$.ajax({
					url : "/admin/statistics/productAmount",
					type:"get",
					dataType:"json",
					contentType:"application/json; charset=utf-8",
					success:function(data){
						
						var valueList2 = new Array();
						var total = 0;
						$.each(data, function(key, value){
							valueList2.push(this["1월"]);
							valueList2.push(this["2월"]);
							valueList2.push(this["3월"]);
							valueList2.push(this["4월"]);
							valueList2.push(this["5월"]);
							valueList2.push(this["6월"]);
							valueList2.push(this["7월"]);
							valueList2.push(this["8월"]);
							valueList2.push(this["9월"]);
							valueList2.push(this["10월"]);
							valueList2.push(this["11월"]);
							valueList2.push(this["12월"]);
							total = this["총합"];
						});
						const ctx2 = document.getElementById('myChart2').getContext('2d');
						
						var myChart2 = new Chart(ctx2, {
							type:"bar",
							data : {
								labels : labelsList,
								datasets : [{
									label : '안심상품 결제내역',
									data : valueList2,
									backgroundColor : 'rgba(255, 206, 86, 0.5)'
								}]
							},
							options : {
								responsive:true,
								interaction:{
									intersect:true,
								},
								scales : {
									yAxes : [
										{
											ticks:{
												beginAtZero:true,
												stepSize: 1000
											}
										}
									]
								}
							}
						});
						
						for(var i = 0; i<12; i++){
							template(labelsList[i], valueList2[i]);
						}
						template("총합",total);
					},
					error : function(xhr, textStatus, errorThrown){
						alert(textStatus + " (HTTP-)"+xhr.status + " / " + errorThrown + ")");
					}
				}); 
			
			});
		</script>
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
									<td >1월</td>
									<td >2월</td>
									<td >3월</td>
									<td >4월</td>
									<td >5월</td>
									<td >6월</td>
									<td >7월</td>
									<td >8월</td>
									<td >9월</td>
									<td >10월</td>
									<td >11월</td>
									<td >12월</td>
									<td >합계</td>
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
									<td >금액(원)</td>
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
