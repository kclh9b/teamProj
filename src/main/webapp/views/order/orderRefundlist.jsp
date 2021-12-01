<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/css/style_list.css"/>"></link>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
	#datepicker {
		display: none;
	}
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
<script>
   $(function() {
       //input을 datepicker로 선언
       $("#datepicker").datepicker({
           dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,showOn: "focus" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시 
           ,buttonText: "선택" //버튼 호버 텍스트             
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,yearRange: 'c-20:c+0'
           ,maxDate: 0  
       });                    
       
       $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
   });
</script>
<jsp:include page="../adminPage.jsp"/>
<div class="goods_list">
	<h2>반품/환불목록 </h2>
	<div class="search">
		<form action="" class="searchForm">
			<select name="searchType" id="selsearch" onchange ="optioncheck(this)">
				<option value="o">주문번호</option>
				<option value="u">회원아이디</option>
				<option value="d">반품신청날짜</option>
				<option value="rd">환불날짜</option>
			</select>
			<input type="text" id="datepicker" name="day">
			<input type="text" name="sch" id="sch">
			<input type="button" value="검색" id="search" onclick="searchsb()">
		</form>
	</div>
	<div class="array">
		<a href="<c:url value="/order/orderRefundlist"/>" id="all">전체</a>
		<a href="<c:url value="/order/orderRefundlist?searchType=1&day=&sch=반품신청"/>" id="arrbtn1">반품신청</a>
		<a href="<c:url value="/order/orderRefundlist?searchType=2&day=&sch=환불완료"/>" id="arrbtn2">환불완료</a>
	</div>
	<table class="basic">
		<thead>
			<tr>
				<th>번호</th>
				<th>주문번호</th>
				<th>회원아이디</th>
				<th>가격</th>
				<th>주문날짜</th>
				<th>주문상태</th>
				<th>반품신청날짜</th>
				<th>환불날짜</th>
			</tr>
		</thead>
		
		<tbody>
	<c:forEach items="${order }" var="od" varStatus="no">		
			<tr>
				<td>${no.index+1 }</td>
				<td><a href="<c:url value="orderRefunddetail?ono=${od.ono }&oino=${od.oino }"/>" id="click">${od.ono }</a></td>
				<td>${od.uid }</td>
				<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${od.price }" /></td>
				<td>${od.regdate }</td>
				<td>${od.paystate }</td>
				<td>${od.refunddate }</td>
				<td>${od.refundokdate }</td>
			</tr>
	</c:forEach>	
		</tbody>
	</table>
		<div id="paging">
			<c:if test="${pageInfo.startPage>1 }">
				<a href="?page=${pageInfo.startPage -1 }"><</a>
			</c:if>
			<c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }" var="i">
				<c:choose>
					<c:when test="${pageInfo.page == i }">
						[${i }]
					</c:when>
					<c:otherwise>
						<a href="?page=${i }&searchType=${orderVO.searchType }&day=${orderVO.day }&sch=${orderVO.sch }">${i }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pageInfo.endPage<pageInfo.totalPage}">
				<a href="?page=${pageInfo.endPage +1 }">></a>
			</c:if>		
		</div>
</div>
<jsp:include page="../footer.jsp"/>
	<script>
	$(document).ready(function(){
		var url = decodeURI(window.location.search);
		
		if(url == "") {
			$("#all").css("color","white");
			$("#all").css("background","black");
		}else if(url.indexOf("searchType=1&day=&sch=반품신청") != -1) {
			$("#arrbtn1").css("color","white");
			$("#arrbtn1").css("background","black");
		}else if(url.indexOf("searchType=2&day=&sch=환불완료") != -1) {
			$("#arrbtn2").css("color","white");
			$("#arrbtn2").css("background","black");
		}
	});
		
		$("#search").click(function(){
			if($("#sch").val() == '' && $("#datepicker1").val() == '') {
				alert("검색어를 입력해주세요");
			}
		});	
		
		var arr = new Array();
		
		<c:forEach items="${uorder }" var="uod">
			arr.push({paystate : "${uod.paystate}"}	);
			
		</c:forEach>
		
		$("#a").click(function(){
			for(var i=0; i<arr.length; i++) {
				if(arr[i].paystate != "결제완료") {
					$("#line").hide();
				}
			}
		});
		
		function optioncheck(obj) {
			if($(obj).val() == 'd' || $(obj).val() == 'rd' ) {
				$("#datepicker").css("display","block");
				$("#sch").css("display","none");
			}else {
				$("#datepicker").css("display","none");
				$("#sch").css("display","block");
			}			
		}
		
		function searchsb() {
			
			var selSearch = $("#selsearch").val();
			var day = $("#datepicker").val();
			
			if(selSearch == 'd') {
				var day_check = /^[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}$/; //https://dogfoot-note.tistory.com/14
				if(!(day_check.test(day))) {
					alert("날짜를 다시 입력해주세요. 예) 2021-06-01");
					return;
				}				
			}
			
			$(".searchForm").submit();
		}
	</script>
</body>
</html>