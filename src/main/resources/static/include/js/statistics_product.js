var labelsList = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];

function template1(product, valueList, total) {
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
function template(mon, amount) {
	let $tbody = $(".amount-content");
	let $tb = $("#item2").clone().removeAttr("id");

	$tb.find('.mon').html(mon);
	$tb.find('.amount').html(amount);

	$tbody.append($tb);

}

$(function() {
	let admin = "<c:out value='${adminLogin.a_no }'/>";
	if (admin == "") {
		alert("잘못된 접근입니다.");
		location.href = "/admin/login";
	}
	$.ajax({
		url: "/admin/statistics/product",
		type: "get",
		dataType: "json",
		contentType: "application/json; charset=utf-8",
		success: function(data) {
			var list = new Array();
			var labelList = new Array();
			var colorList = new Array();
			var valueList = new Array();
			var valuesList = new Array();
			var dataList = new Array();
			var totalList = new Array();
			$.each(data, function(key, value) {
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

				colorList.push("#" + rcolor);
				dataList.push(valueList);
				valueList = [];
			});

			const datas = {
				labels: labelsList,
				datasets: [
					{
						label: '일반중고상품',
						data: dataList[0],
						order: 1,
						backgroundColor: 'rgba(255, 99, 132, 0.5)'
					},
					{
						label: '안심거래상품',
						data: dataList[1],
						order: 0,
						type: 'line',
						borderColor: 'rgba(54, 162, 235, 0.5)',
						backgroundColor: 'rgba(54, 162, 235, 0.5)',
						borderWidth: 1,
						fill: false
					}
				]
			};
			console.log(datas);
			var ctx = document.getElementById('myChart').getContext('2d');

			const myChart = new Chart(ctx, {
				type: 'bar',
				data: datas,
				options: {
					tooltips: {
						mode: 'index',
						intersect: false
					},
					hover: {
						intersect: false,
						mode: 'index'
					},
					responsive: true,
					scales: {
						y: [{
							ticks: {
								beginAtZero: true,
								stepSize: 10
							}
						}]
					}
				}
			});
			template1("일반중고상품", dataList[0], totalList[0]);
			template1("안심거래상품", dataList[1], totalList[1]);
		},
		error: function(xhr, textStatus, errorThrown) {
			alert(textStatus + " (HTTP-)" + xhr.status + " / " + errorThrown + ")");
		}
	});




	$.ajax({
		url: "/admin/statistics/productAmount",
		type: "get",
		dataType: "json",
		contentType: "application/json; charset=utf-8",
		success: function(data) {

			var valueList2 = new Array();
			var total = 0;
			$.each(data, function(key, value) {
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
				type: "bar",
				data: {
					labels: labelsList,
					datasets: [{
						label: '안심상품 결제내역',
						data: valueList2,
						backgroundColor: 'rgba(255, 206, 86, 0.5)'
					}]
				},
				options: {
					responsive: true,
					interaction: {
						intersect: true,
					},
					scales: {
						yAxes: [
							{
								ticks: {
									beginAtZero: true,
									stepSize: 5000
								}
							}
						]
					}
				}
			});

			for (var i = 0; i < 12; i++) {
				template(labelsList[i], valueList2[i]);
			}
			template("총합", total);
		},
		error: function(xhr, textStatus, errorThrown) {
			alert(textStatus + " (HTTP-)" + xhr.status + " / " + errorThrown + ")");
		}
	});

});