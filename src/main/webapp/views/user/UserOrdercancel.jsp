<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style_list.css"></link>
<style>
td#black {
	background : black;
}

.inputArea {
	display: none;
}
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="../userPage.jsp"/>
<div class="goods_list">
<h2>주문취소</h2>
	<div class="order">
		<span><strong>${order.regdate } 주문 - </strong></span>
		<span>주문번호 ${order.ono} </span>
	</div>
	<form action="cancelReg" class="cancelForm">
		<input type="hidden" name="ono" value="${order.ono }">
		<input type="hidden" name="oino" value="${order.oino }"> <!-- ordertable -->
		<input type="hidden" name="itemstate" class="itemstate">
		<input type="hidden" name="paystate" class="paystate" value="${order.paystate }">
		
	<div class="inputArea">
		<p>주문번호 - ${order.ono }</p>
	</div>
	
	<table class="basic">
		<tr>
			<th>주문상태</th>
			<th>상품명</th>
			<th>상품이미지</th>
			<th>갯수</th>
			<th>가격</th>
			<th>합계</th>
		</tr>
		<c:forEach items="${orderitem }" var="orit" varStatus="no">		
		<tr>	
			<td>${orit.itemstate }</td>
			<td>${orit.name }</td>
			<td><img src="<c:url value="/up/item/${orit.main_img }" />" alt="" class="orderMainImg"></td>
			<td>${orit.quantity }</td>
			<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${orit.calprice }" /></td>
			<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${orit.totalPrice }" /></td>
		</tr>
		</c:forEach>
	</table>
	
	<div class="button">
		<button type="button" class="submit">주문취소</button>
		<button type="button" class="back">돌아가기</button>
	</div>
		
	<script>
		$(".back").click(function (){
			history.back();
		});
		
		$(".submit").click(function (){
			if(confirm("주문을 취소하시겠습니까?")) {
				var paystate = $(".paystate").val();
				
				if(paystate == "주문취소") {
					alert("이미 주문취소되었습니다.");
					return;
				}else if(paystate == "배송중" || paystate == "배송완료" ) {
					alert("취소가 불가합니다 주문상세 - 반품신청으로 처리해주십시오");
					return;
				}else if(paystate == "반품신청"){
					alert("반품진행중인 상품입니다.");
					return;
				}else if(paystate == "환불완료"){
					alert("환불이 완료된 상품입니다.");
					return;
				}else{
					$(".itemstate").val("주문취소");
					$(".paystate").val("주문취소");
					$(".cancelForm").submit(); 
				} 
			}
		});
		
	</script>
		
	</form>
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>