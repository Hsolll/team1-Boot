function template(cate, mon1, mon2, mon3, mon4, mon5, mon6, mon7, mon8, mon9, mon10, mon11, mon12, total) {
	let $tbody = $(".cate-content");
	let $tb = $("#item").clone().removeAttr("id");

	$tb.find('.item-cate').html(cate);
	$tb.find('.item1').html(mon1);
	$tb.find('.item2').html(mon2);
	$tb.find('.item3').html(mon3);
	$tb.find('.item4').html(mon4);
	$tb.find('.item5').html(mon5);
	$tb.find('.item6').html(mon6);
	$tb.find('.item7').html(mon7);
	$tb.find('.item8').html(mon8);
	$tb.find('.item9').html(mon9);
	$tb.find('.item10').html(mon10);
	$tb.find('.item11').html(mon11);
	$tb.find('.item12').html(mon12);
	$tb.find('.item-total').html(total);

	$tbody.append($tb);

}
$(function() {
	let admin = "<c:out value='${adminLogin.a_no }'/>";
	if (admin == "") {
		alert("잘못된 접근입니다.");
		location.href = "/admin/login";
	}
	$.ajax({
		url: "/admin/statistics/allCategory",
		type: "get",
		dataType: "json",
		contentType: "application/json; charset=utf-8",
		success: function(data) {
			var labelList = new Array();
			var valueList = new Array();
			var colorList = new Array();

			$.each(data, function(key, value) {
				labelList.push(this["P_CATE"])

				valueList.push(this["CNT"]);

				/* 색 랜덤으로 추가하기 */
				var rcolor = 0;
				rcolor = Math.random() * 0xffffff;
				rcolor = parseInt(rcolor);
				rcolor = rcolor.toString(16);

				for (let color in colorList) {
					if (rcolor == color) {
						rcolor = Math.random() * 0xffffff;
						rcolor = parseInt(rcolor);
						rcolor = rcolor.toString(16);
					}
				}
				colorList.push("#" + rcolor);
			});

			const ctx = document.getElementById('myChart').getContext('2d');

			const myChart = new Chart(ctx, {
				type: "pie",
				data: {
					labels: labelList,
					datasets: [{
						label: '카테고리 통계',
						data: valueList,
						backgroundColor: colorList
					}]
				},
				options: {
					responsive: true,
					legend: {
						position: 'left'
					}
				}
			});

			const ctx2 = document.getElementById('myChart2').getContext('2d');

			var myChart2 = new Chart(ctx2, {
				type: "bar",
				data: {
					labels: labelList,
					datasets: [{
						label: '상품별',
						data: valueList,
						backgroundColor: colorList
					}]
				},
				options: {
					scales: {
						yAxes: [
							{
								ticks: {
									beginAtZero: true,
									stepSize: 5
								}
							}
						]
					},
					legend: {
						display: false
					},
					tooltips: {
						mode: 'index',
						intersect: false
					},
					hover: {
						intersect: false,
						mode: 'index'
					},
				}
			});
		},
		error: function(xhr, textStatus, errorThrown) {
			alert(textStatus + " (HTTP-)" + xhr.status + " / " + errorThrown + ")");
		}
	});

	$.ajax({
		url: "/admin/statistics/category",
		type: "get",
		data: $("#sForm").serialize(),
		dataType: "json",
		contentType: "application/json; charset=utf-8",
		success: function(data) {
			var labelsList = ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'];
			var labelList2 = new Array();
			var valueList2 = new Array();
			var colorList2 = new Array();

			$.each(data, function(key, value) {
				labelList2.push(this["P_CATE"])
				let cate = this["P_CATE"];
				console.log(cate);
				var valuesList = new Array();
				for (let i = 1; i < 13; i++) {
					valuesList.push(this[i + "월"]);
					console.log(i + "월 : " + this[i + "월"]);
				}
				valueList2.push(valuesList);
				let total = this["총합"];
				console.log("총합 : " + this["총합"])

				template(cate, valuesList[0], valuesList[1], valuesList[2], valuesList[3], valuesList[4], valuesList[5], valuesList[6], valuesList[7], valuesList[8], valuesList[9],
					valuesList[10], valuesList[11], total);
				/* 색 랜덤으로 추가하기 */
				var rcolor = 0;
				rcolor = Math.random() * 0xffffff;
				rcolor = parseInt(rcolor);
				rcolor = rcolor.toString(16);

				colorList2.push("#" + rcolor);
			});


			const ctx4 = document.getElementById('myChart4').getContext('2d');

			var myChart4 = new Chart(ctx4, {
				type: "bar",
				data: {
					labels: labelsList,
					datasets: [{
						label: labelList2[0],
						data: valueList2[0],
						backgroundColor: colorList2[0]
					}, {
						label: labelList2[1],
						data: valueList2[1],
						backgroundColor: colorList2[1]
					}, {
						label: labelList2[2],
						data: valueList2[2],
						backgroundColor: colorList2[2]
					}, {
						label: labelList2[3],
						data: valueList2[3],
						backgroundColor: colorList2[3]
					}, {
						label: labelList2[4],
						data: valueList2[4],
						backgroundColor: colorList2[4]
					}, {
						label: labelList2[5],
						data: valueList2[5],
						backgroundColor: colorList2[5]
					}, {
						label: labelList2[6],
						data: valueList2[6],
						backgroundColor: colorList2[6]
					}, {
						label: labelList2[7],
						data: valueList2[7],
						backgroundColor: colorList2[7]
					}, {
						label: labelList2[8],
						data: valueList2[8],
						backgroundColor: colorList2[8]
					}
					]
				},
				options: {
					maintainAspectRatio: false,
					responsive: true,
					
					scales: {
						xAxes: [{
							stacked: true
						}],
						yAxes: [
							{
								ticks: {
									beginAtZero: true,
									stepSize: 5
								},
								stacked: true
							}
						]
					}
				}
			});
		},
		error: function(xhr, textStatus, errorThrown) {
			alert(textStatus + " (HTTP-)" + xhr.status + " / " + errorThrown + ")");
		}
	});

});