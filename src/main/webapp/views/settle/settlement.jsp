<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="<c:url value="/css/style_settlement.css"/>"></link>
</head>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<style>
</style>
<body>
<jsp:include page="header.jsp"/>
<jsp:include page="adminPage.jsp"/>
<c:set var="order" value=""/>
<c:forEach items="${list }" var="list">
	<c:set var="order" value="${order + list.cnt}"/>
</c:forEach>

<c:set var="cnt" value=""/>
<c:forEach items="${list }" var="list">
	<c:set var="cnt" value="${cnt + list.quantity}"/>
</c:forEach>

<c:set var="sum" value=""/>
<c:forEach items="${list }" var="list">
	<c:set var="sum" value="${sum + list.pay}"/>
</c:forEach>
<div class="settleWrapper">
	<h2>정산</h2>
	<form action="" name="settleFrm">
		<div class="schCondition">
			<div class="cdt1">
				<select name="standard" id="standard">
					<option value="day">일별</option>
					<option value="month"<c:if test="${standard.equals('month') }">selected</c:if>>월별</option>
					<option value="year"<c:if test="${standard.equals('year') }">selected</c:if>>년별</option>
				</select>
				<input type="text" name="start" id="testDatepicker1" placeholder="시작날짜" value="${start }"> - 
				<input type="text" name="end" id="testDatepicker2" placeholder="마지막날짜" value="${end }" style="margin-left:5px;">
			</div>
			
			<div class="cdt2">
				<select onchange="categoryChange(this)">
					<option value="x">대분류</option>
					<option value="a">사료</option>
					<option value="b">관리용품</option>
					<option value="c">장난감</option>
					<option value="d">산책용품</option>
				</select>
				<select id="good" name="cateid">
				<option value="">소분류</option>
				</select>
				
				
				<input type="hidden" name="schKind" value="ino">
				<input type="text" value="" name="keyword" placeholder="상품코드를 입력해주세요">
				
				<input type="button" value="검색" onclick="search()">
			</div>
		</div>
	</form>
	
	<div class="resultBox">
		<div class="showCate">
			<h3>카테고리 : ${cateid }</h3> <h3>상품명 : ${name }</h3>
		</div>
		<canvas id="myChart" width="1000" height="600"></canvas><br><br>
		<table class="settle">
			<colgroup>
				<col width="20%">
				<col width="25%">
				<col width="25%">
				<col width="30%">
			</colgroup>
			<thead>
				<tr>
					<th>날짜</th>
					<th>주문건수</th>
					<th>판매량</th>
					<th>금액</th>
				</tr>
			</thead>
			
			<tbody>
				<c:choose>
					<c:when test="${list.size()!=0 }">
						<c:forEach items="${list }" var="list" varStatus="no">
						<tr>
							<td>${list.d }</td>
							<td>${list.cnt }</td>
							<td>${list.quantity }</td>
							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.pay }" /></td>
						</tr>
						</c:forEach>
						<tr>
							<td>합계</td>
							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${order }" /></td>
							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${cnt }" /></td>
							<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${sum }" /></td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr><td colspan="4">판매내역이 없습니다.</td></tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</div>
<jsp:include page="footer.jsp"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>

$(function() {
	var standard = $('#standard').val();
	$("#testDatepicker1").datepicker({
		changeMonth: true, 
  		changeYear: true,
		nextText: '다음 달',
		prevText: '이전 달',
		
		showMonthAfterYear : true,
		
        //numberOfMonths: [2,2],
       
        maxDate: 0,
        
		showButtonPanel: true, 
		currentText: '오늘 날짜', 
		closeText: '닫기', 
		dateFormat: "yy-mm-dd",
		
		changeMonth: true, 
		dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
		dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		yearRange: 'c-20:c+20'

	})
	
	
	$("#testDatepicker2").datepicker({
		changeMonth: true, 
  		changeYear: true,
		nextText: '다음 달',
		prevText: '이전 달',
		
		showMonthAfterYear : true,

        //numberOfMonths: [2,2],
        
        maxDate: 0,

		showButtonPanel: true, 
		currentText: '오늘 날짜', 
		closeText: '닫기', 
		dateFormat: "yy-mm-dd",
		
		changeMonth: true, 
		dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
		dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		yearRange: 'c-20:c+20'
	})
})



</script>
<script>
function categoryChange(e) {
	var x = ["소분류"];
	var food = ["전체", "퍼피용", "성견용", "노견용", "소형견용", "중형견용", "대형견용", "비만견용", "간식"];
	var clean = ["전체","배변판/패드", "기저귀", "털제거용품", "이발기구"];
	var toy = ["전체","봉제장난감", "고무", "공", "원반", "중대형견용"];
	var outdoor = ["전체","자동줄", "목줄", "하네스", "이동가방", "유모차"];
	var target = document.getElementById("good");

	if(e.value == "x") {
		var d = x;
		var val = [""];
	}else if(e.value == "a") {
		var d = food;
		var val = ["1__", "101", "102", "103", "104", "105", "106", "107", "108"];
	}
	else if(e.value == "b") {
		var d = clean;
		var val = ["2__","201", "202", "203", "204"];
	}
	else if(e.value == "c") {
		var d = toy;
		var val = ["3__","301", "302", "303", "304", "305"];
	}else if(e.value == "d") {
		var d = outdoor;
		var val = ["4__","401", "402", "403", "404", "405"];
	}

	target.options.length = 0;
	
	for (x in d) {
		var opt = document.createElement("option");
		opt.value = val[x];
		opt.innerHTML = d[x];
		target.appendChild(opt);
	}
}
</script>
<script>
function searchModule(str, arr) {
	var res = false
	for(var i in arr){
		if(arr[i].test(str)) {
			res = true
		}
	}
	return res;

}
	function search() {

		var standard = document.getElementById("standard").value;
		var start = document.getElementById("testDatepicker1").value;
		var end = document.getElementById("testDatepicker2").value;
		
		
		//console.log( searchModule(start, [/^[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}$/, /^[0-9]{4}-[0-9]{1,2}$/]) )
		
		if(standard=='day') {
			var day_check = /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/; //https://dogfoot-note.tistory.com/14
			if(!(day_check.test(start) && day_check.test(end))) {
				alert("날짜를 다시 입력해주세요. 예) 2021-06-01");
				return;
			}		
		}else if(standard=='month') {		
			
			var aaa =  [/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/, /^[0-9]{4}-[0-9]{2}$/]
			
			if(!(searchModule(start, aaa) && (searchModule(end, aaa)))) {
				alert("날짜를 다시 입력해주세요. 예) 2021-06 or 2021-06-01");
				return;
			}	
		}else {
			var aaa =  [/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/, /^[0-9]{4}-[0-9]{2}$/, /^[0-9]{4}$/]
			
			if(!(searchModule(start, aaa) && (searchModule(end, aaa)))) {
				alert("날짜를 다시 입력해주세요. 예) 2021 or 2021-06 or 2021-06-01");
				return;
			}
		}
		
		var date1 = new Date(start);
		var date2 = new Date(end);
		if(date1>date2) {
			alert("시작날짜가 마지막날짜보다 늦습니다. 다시 입력해주세요.")
			return;
		}
		
		document.settleFrm.submit();
		
	}
	
	/*
	$(function () {
		var previous; 
		$("#standard").on('focus', function () {
			// Store the current value on focus and on change 
			previous = this.value; }).change(function() { 
				// Do something with the previous value after the change 
				//alert(previous); 
				// Make sure the previous value is updated 
				if(previous=='day') {
					alert(111);
				}
				previous = this.value; 
			}); 
	});*/
	

</script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.4.1/chart.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.4.1/chart.esm.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.4.1/chart.esm.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.4.1/chart.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.4.1/helpers.esm.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.4.1/helpers.esm.min.js"></script>
<script>
var ctx = document.getElementById('myChart');
var myChart = new Chart(ctx, {
	type: 'bar',
	data: {
		labels: [
			<c:forEach items="${list2 }" var="list" varStatus="no">'${list.d }',</c:forEach>
			],
		datasets: [
			{
				label: '판매금액',
				data: [
					<c:forEach items="${list2 }" var="list" varStatus="no">'${list.pay }',</c:forEach>
					],
				maxBarThickness: 50,
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
				borderWidth: 1,
				
			}
		]
	},
	options: {
		responsive: false,
		scales: {
			xAxes: [{
				 barThickness: 6,  // number (pixels) or 'flex'
	             maxBarThickness: 8 // number (pixels)
			}],
			yAxes: [{
				ticks: {
					beginAtZero: true
				}
			}]
		}
	}
});
</script>
</body>
</html>