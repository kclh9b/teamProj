<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />

<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<body>

일간 수익 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${day.pay}" />원 <br>
주간 수익 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${week.pay}" />원 <br>
월간 수익 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${month.pay}" />원 <br>
연간 수익 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${year.pay}" />원 <br>
<form action="">
<select onchange="categoryChange(this)">
	<option>조회 기준 선택</option>
	<option value="a">일별</option>
	<option value="b">월별</option>
	<option value="c">년별</option>
</select>
<select id="good" name="sch">
<option>세부 기준 선택</option>
</select>
<input type="text" name="start" id="testDatepicker" placeholder="시작날짜">
<input type="text" name="end" id="testDatepicker" placeholder="마지막날짜">
<input type="submit" value="검색">
</form>
<br>
<c:choose>
	<c:when test="${list.size()!=0 }">
		<c:choose>
			<c:when test="${list.get(0).day!=null }">
				<c:forEach items="${list }" var="list" varStatus="no">
				${list.day }일 
				판매건수:${list.cnt }
				판매금액:<fmt:formatNumber type="number" maxFractionDigits="3" value="${list.pay }" />원 <br><br>
				</c:forEach>	
			</c:when>
			<c:when test="${list.get(0).month!=null }">
				<c:forEach items="${list }" var="list" varStatus="no">
				${list.month }월 
				판매건수:${list.cnt }
				판매금액:<fmt:formatNumber type="number" maxFractionDigits="3" value="${list.pay }" />원 <br><br>
				</c:forEach>	
			</c:when>
			<c:when test="${list.get(0).year!=null }">
				<c:forEach items="${list }" var="list" varStatus="no">
				${list.year }년 
				판매건수:${list.cnt }
				판매금액:<fmt:formatNumber type="number" maxFractionDigits="3" value="${list.pay }" />원 <br><br>
				</c:forEach>	
			</c:when>
		</c:choose>
	</c:when>
	<c:otherwise>
		<p>판매내역이 없습니다.</p>
	</c:otherwise>
</c:choose>
<c:set var="sum" value=""/>
<c:forEach items="${list }" var="list">
	<c:set var="sum" value="${sum + list.pay}"/>
</c:forEach>
<br> 
총 합 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${sum }" />원
<!--<c:out value="${sum}"/>-->

<!-- 
<div style="width:75%;">
	<canvas id="canvas"></canvas>
</div>
-->

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
$(function() {
	$("#testDatepicker").datepicker({
		
	})
})
$(function() {
  $( "#testDatepicker" ).datepicker({
         changeMonth: true, 
         changeYear: true,
         nextText: '다음 달',
         prevText: '이전 달' 
  });
});
</script>
<script>
function categoryChange(e) {
	var day = ["7일", "15일", "30일"];
	var month = ["6개월", "12개월"];
	var year = ["5년", "10년", "전체"];
	var target = document.getElementById("good");

	if(e.value == "a") {
		var d = day;
		var val = ["d7", "d15", "d30"];
	}
	else if(e.value == "b") {
		var d = month;
		var val = ["m6", "m12"];
	}
	else if(e.value == "c") {
		var d = year;
		var val = ["y5", "y10", "yall"];
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
</body>
</html>