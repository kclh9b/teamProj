<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.4.1/chart.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.4.1/chart.esm.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.4.1/chart.esm.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.4.1/chart.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.4.1/helpers.esm.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.4.1/helpers.esm.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<body>
일간 수익 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${day.price-day.delifee}" />원 <br>
주간 수익 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${week.price-week.delifee}" />원 <br>
월간 수익 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${month.price-month.delifee}" />원 <br>
연간 수익 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${year.price-year.delifee}" />원 <br>
<select>
	<option>일간</option>
	<option>주간</option>
	<option>월간</option>
	<option>연간</option>
</select>
<select>
	<option></option>
	<option>주간</option>
	<option>월간</option>
	<option>연간</option>
</select>
<form action="">
<input name="fromDt" type="text" id="fromDt" size="8" maxlength="8" title="시작일자"> ~
<input name="toDt" type="text" id="toDt" size="8" maxlength="8" title="종료일자">
<input type="submit" value="검색">
</form>
<!-- 
<div style="width:75%;">
	<canvas id="canvas"></canvas>
</div>
-->
<select onchange="categoryChange(this)">
	<option>조회 기준 선택</option>
	<option value="a">일별</option>
	<option value="b">월별</option>
	<option value="c">년별</option>
</select>

<select id="good">
<option>좋아하는 멤버를 선택해주세요</option>
</select>
<canvas id="myChart" width="400" height="400"></canvas>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script> 

<script>
 $(document).ready(function() {

  //******************************************************************************
  // 상세검색 달력 스크립트
  //******************************************************************************
  var clareCalendar = {
   monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
   dayNamesMin: ['일','월','화','수','목','금','토'],
   weekHeader: 'Wk',
   dateFormat: 'yy-mm-dd', //형식(20120303)
   autoSize: false, //오토리사이즈(body등 상위태그의 설정에 따른다)
   changeMonth: true, //월변경가능
   changeYear: true, //년변경가능
   showMonthAfterYear: true, //년 뒤에 월 표시
   buttonImageOnly: true, //이미지표시
   buttonText: '', //버튼 텍스트 표시
   //buttonImage: 'res/img/comn/calendar.gif', //이미지주소
   showOn: "both", //엘리먼트와 이미지 동시 사용(both,button)
   yearRange: '1990:2050' //1990년부터 2020년까지
  };
  $("#fromDt").datepicker(clareCalendar);
  $("#toDt").datepicker(clareCalendar);
  $("img.ui-datepicker-trigger").attr("style","margin-left:5px; vertical-align:middle; cursor:pointer;"); //이미지버튼 style적용
  $("#ui-datepicker-div").hide(); //자동으로 생성되는 div객체 숨김  
 });

</script>

<script>
function categoryChange(e) {
	var good_a = ["7일", "15일", "30일"];
	var good_b = ["1개월", "3개월", "6개월", "12개월"];
	var good_c = ["1년", "3년", "5년", "10년", "전체"];
	var target = document.getElementById("good");

	if(e.value == "a") var d = good_a;
	else if(e.value == "b") var d = good_b;
	else if(e.value == "c") var d = good_c;

	target.options.length = 0;

	for (x in d) {
		var opt = document.createElement("option");
		opt.value = d[x];
		opt.innerHTML = d[x];
		target.appendChild(opt);
	}	
}
</script>

	 


<script>


/*
	var data = {
	    labels: [
	    	'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'
	    ],
	    datasets: [
	        {
	            label: '판매량',
	            data: [
	            	10,
	                3,
	                30,
	                23,
	                10,
	                5,
	                50
	            ],
	            backgroundColor: [
	                'rgba(255, 201, 14, 1)'
	            ],
	            borderColor: [
	                'rgba(255, 201, 14, 0.5)'
	            ],
	            borderWidth: 2
	        }
	    ]
	};
	
	var options = {
			responsive: true,
	        title: {
	            display: false,
	            text: '라인 차트 테스트'
	        },
	        tooltips: {
	            mode: 'index',
	            intersect: false,
	        },
	        hover: {
	            mode: 'nearest',
	            intersect: true
	        },
	        scales: {
	            xAxes: [{
	                display: true,
	                scaleLabel: {
	                    display: true,
	                    labelString: 'x축'
	                }
	            }],
	            yAxes: [{
	                display: true,
	                ticks: {
	                    suggestedMin: 0,
	                },
	                scaleLabel: {
	                    display: true,
	                    labelString: 'y축'
	                }
	            }]
	        }
	};
	
	var ctx = document.getElementById("canvas").getContext('2d');
	var myBarChart = new Chart(ctx, {
	    type: 'line',
	    data: data,
	    options: options
	});
	
	
	function sendAjax(url) {
	    var oReq = new XMLHttpRequest();

	    oReq.open('POST', url);
	    oReq.setRequestHeader('Content-Type', "application/json") // json 형태로 보낸다
	    oReq.send();

	    oReq.addEventListener('load', function() {
	        var result = JSON.parse(oReq.responseText);
	        var score = result.score;
	        var comp_data = data.datasets[0].data;

	        for (var i = 0; i < comp_data.length; i++) {
	            comp_data[i] = score[i];
	        }

	        data.datasets[0].data = comp_data;
	        myBarChart.update();
	    })
	}

	sendAjax('http://localhost:8765/dailySales');
	var comp_data = data.datasets[0].data;
	comp_data[0] = 20;
	data.datasets[0].data = comp_data;
	myBarChart.update();

	*/
	
	/*
	new Chart(document.getElementById("canvas"), {
	    type: 'line',
	    data: {
	        labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'],
	        datasets: [{
	            label: '구매량',
	            data: [
	                10,
	                3,
	                30,
	                23,
	                10,
	                5,
	                50
	            ],
	            borderColor: "rgba(255, 201, 14, 1)",
	            backgroundColor: "rgba(255, 201, 14, 0.5)",
	            fill: true,
	            lineTension: 0
	        }]
	    },
	    options: {
	        responsive: true,
	        title: {
	            display: false,
	            text: '라인 차트 테스트'
	        },
	        tooltips: {
	            mode: 'index',
	            intersect: false,
	        },
	        hover: {
	            mode: 'nearest',
	            intersect: true
	        },
	        scales: {
	            xAxes: [{
	                display: true,
	                scaleLabel: {
	                    display: true,
	                    labelString: 'x축'
	                }
	            }],
	            yAxes: [{
	                display: true,
	                ticks: {
	                    suggestedMin: 0,
	                },
	                scaleLabel: {
	                    display: true,
	                    labelString: 'y축'
	                }
	            }]
	        },
	    }
	});
	*/
	
	
	
	
	var ctx = document.getElementById('myChart');
	var myChart = new Chart(ctx, {
		type: 'bar',
		data: {
			labels: ['-6일', '-5일', '-4일', '-3일', '-2일', '-1일', '오늘'],
			datasets: [{
				label: '주간 판매량',
				data: [12, 19, 3, 5, 2, 3, 9],
				backgroundColor: [
					'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(255, 159, 64, 0.2)',
					'rgba(200, 159, 200, 0.2)'
				],
				borderColor: [
					'rgba(255, 99, 132, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(255, 159, 64, 1)',
					'rgba(200, 159, 200, 1)'
				],
				borderWidth: 1
			}]
		},
		options: {
			responsive: false,
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero: true
					}
				}]
			},
		}
	});
	
	
	
</script>
</body>
</html>