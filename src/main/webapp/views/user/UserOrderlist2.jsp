<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix ="fmt" uri ="http://java.sun.com/jsp/jstl/fmt" %>
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
           ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
       });                    
       
       $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
   });
</script>
<jsp:include page="../userPage.jsp"/>
<div class="goods_list">
	<h2>주문내역</h2>
	<div class="search">
		<form action="" class="searchForm">
			<select name="searchType" id="selsearch" onchange ="optioncheck(this)">
				<option value="n">주문번호</option>
				<option value="d">주문일</option>
			</select>
	        <input type="text" id="datepicker" name="day">
			<input type="text" name="sch" id="sch">
			<input type="button" value="검색" id="search" onclick="searchsb()">
		</form>
	</div>
	<div class="array">
		<a href="/user/UserOrderlist" id="all">전체</a>
		<a href="/user/UserOrderlist?searchType=1&day=&sch=결제완료" id="arrbtn1">결제완료</a>
		<a href="/user/UserOrderlist?searchType=2&day=&sch=배송준비" id="arrbtn2">배송준비</a>
		<a href="/user/UserOrderlist?searchType=3&day=&sch=배송중" id="arrbtn3">배송중</a>
		<a href="/user/UserOrderlist?searchType=4&day=&sch=배송완료" id="arrbtn4">배송완료</a>
		<a href="/user/UserOrderlist?searchType=5&day=&sch=주문취소" id="arrbtn5">주문취소</a>
		<a href="/user/UserOrderlist?searchType=6&day=&sch=반품신청" id="arrbtn6">반품신청</a>
		<a href="/user/UserOrderlist?searchType=7&day=&sch=환불완료" id="arrbtn7">환불완료</a>
	</div>
	<table class="basic">
		<thead>
			<tr>
				<th>번호</th>
				<th>주문일</th>
				<th>주문번호</th>			
				<th>수령인</th>			
				<th>가격</th>
				<th>주문상태</th>
				<th>취소/반품</th>
			</tr>
		</thead>
		
		<tbody>
	<c:forEach items="${uorder }" var="uod" varStatus="no">		
			<tr id="line">
				<td>${no.index+1 }</td>
				<td>${uod.regdate }</td>
				<td><a href="UserOrderdetail?ono=${uod.ono }&oino=${uod.oino }" id="click">${uod.ono }</a></td>
				<td>${uod.reciever }</td>
				<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${uod.price }" /></td>
				<td id="paystate">${uod.paystate }</td>
			<c:choose>
			<c:when test="${uod.paystate eq '결제완료' || uod.paystate eq '배송준비' }">
				<td><a href="UserOrdercancel?ono=${uod.ono }&oino=${uod.oino}">취소신청</a></td>
			</c:when>
			<c:when test="${uod.paystate eq '배송중' || uod.paystate eq '배송완료' }">
				<td><a href="UserOrderrefund?ono=${uod.ono }&oino=${uod.oino }">반품신청</a></td>
			</c:when>
			<c:otherwise>
				<td></td>
			</c:otherwise>
			</c:choose>
			</tr>
	</c:forEach>	
		</tbody>
	</table>
		<div id="paging">
			<c:if test="${pageInfo.startPage>1 }">
				<a href="?nowPage=${pageInfo.startPage -1 }"><</a>
			</c:if>
			<c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }" var="i">
				<c:choose>
					<c:when test="${pageInfo.nowPage == i }">
						[${i }]
					</c:when>
					<c:otherwise>
						<a href="?nowPage=${i }">${i }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pageInfo.endPage<pageInfo.totalPage}">
				<a href="?nowPage=${pageInfo.endPage +1 }">></a>
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
		}else if(url == "?searchType=1&day=&sch=결제완료") {
			$("#arrbtn1").css("color","white");
			$("#arrbtn1").css("background","black");
		}else if(url == "?searchType=2&day=&sch=배송준비") {
			$("#arrbtn2").css("color","white");
			$("#arrbtn2").css("background","black");
		}else if(url == "?searchType=3&day=&sch=배송중") {
			$("#arrbtn3").css("color","white");
			$("#arrbtn3").css("background","black");
		}else if(url == "?searchType=4&day=&sch=배송완료") {
			$("#arrbtn4").css("color","white");
			$("#arrbtn4").css("background","black");
		}else if(url == "?searchType=5&day=&sch=주문취소") {
			$("#arrbtn5").css("color","white");
			$("#arrbtn5").css("background","black");
		}else if(url == "?searchType=6&day=&sch=반품신청") {
			$("#arrbtn6").css("color","white");
			$("#arrbtn6").css("background","black");
		}else if(url == "?searchType=7&day=&sch=환불완료") {
			$("#arrbtn7").css("color","white");
			$("#arrbtn7").css("background","black");
		}
	});
	
		$("#search").click(function(){
			if($("#sch").val() == '' && $("#datepicker1").val() == '') {
				alert("검색어를 입력해주세요");
				/* alert($('#selsearch option:selected').val()); */
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
			if($(obj).val() == 'd') {
				$("#datepicker").css("display","block");
				$("#sch").css("display","none");
			}else if($(obj).val() == 'n') {
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