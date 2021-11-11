<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style_list.css"></link>
<link rel="stylesheet" href="../css/style_adminPage.css"></link>
<style>
.deliveryChange {
	margin-top: 20px;
}

.deliveryChange button{
	border: 1px solid lightgray;
	background: lightgray;
	width: 150px;
	height: 40px;
}
</style>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="../header.jsp"/>
<jsp:include page="../adminPage.jsp"/>
<div class="goods_list">
	<h2>주문상세</h2>
	<div class="order">
		<span><strong>${order.regdate } 주문 - </strong></span>
		<span>주문번호 ${order.ono}</span>
		<span id="dno"> - 배송번호 ${order.dno}</span>
	</div>
	<div class="paystate">
		<p>주문상태 - <span id="paystate">${order.paystate }</span></p>
	</div>
	<table class="basic">
			<tr>
				<th>주문상태</th>
				<th>상품코드</th>
				<th>상품명</th>
				<th>메인이미지</th>
				<th>가격</th>
				<th>수량</th>
				<th>합계</th>
			</tr>
	<c:forEach items="${orderitem }" var="oi" varStatus="no">		
			<tr>	
				<td id="itemstate">${oi.itemstate }</td>
				<td>${oi.ino }</td>
				<td><a href="<c:url value="/item/${oi.ino}"/>">${oi.name }</a></td>
				<td><img class="orderMainImg" src="<c:url value="/up/item/${oi.main_img }" />" alt="" ></td>
				<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oi.calprice }" /></td>
				<c:choose>
					<c:when test="${oi.quantity == 0 }">
						<td>${oi.refundcnt }</td>
					</c:when>
					<c:otherwise>
						<td>${oi.quantity }</td>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${oi.quantity == 0 }">
						<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oi.refundcnt * oi.calprice}" /></td>
					</c:when>
					<c:otherwise>
						<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${oi.quantity * oi.calprice}" /></td>
					</c:otherwise>
				</c:choose>
			</tr>
	</c:forEach>		
	</table>
	
	<div class="canclerefund">
		<h3>취소/반품/환불</h3>
		<table class="information">
			<tr><th>회원아이디</th><td>${order.uid }</td></tr>
			<tr><th class="canceldate">취소날짜</th><td id="canceldate">${order.canceldate }</td></tr>
			<tr><th class="refunddate">반품신청날짜</th><td id="refunddate">${order.refunddate }</td></tr>
			<tr><th class="refundokdate">환불날짜</th><td id="refundokdate">${order.refundokdate }</td></tr>
			<tr><th class="cancelprice">취소금액</th><td class="cancelprice"><fmt:formatNumber type="number" maxFractionDigits="3" value="${order.price }" /></td></tr>
			<c:forEach items="${orderitem }" var="uoi" varStatus="no">	
			<c:choose>
				<c:when test="${oi.refund == 'n' }">
						<tr><th class="refund">반품사유</th><td id=refund>상품불량 - ${oi.name }</td></tr>
						<tr><th class="refundprice">환불금액</th><td id=refundprice><fmt:formatNumber type="number" maxFractionDigits="3" value="${oi.refundprice }" /></td></tr>	
				</c:when>
				<c:when test="${oi.refund == 'y' }">
						<tr><th class="refund">반품사유</th><td id=refund>고객변심</td></tr>
						<tr><th class="refundprice">환불금액</th><td id=refundprice><fmt:formatNumber type="number" maxFractionDigits="3" value="${oi.refundprice }" /></td></tr>	
				</c:when>
				<c:otherwise></c:otherwise>
			</c:choose>
			</c:forEach>
		</table>
	</div>
	
	<h3>받는사람 정보</h3>
	<table class="information">
		<tr><th>받는사람</th><td>${order.reciever }</td></tr>
		<tr><th>연락처</th><td>${order.phn }</td></tr>
		<tr><th>받는주소</th><td>${order.address1 } ${uorder.address2 }</td></tr>
		<tr><th>요청사항</th><td>${order.etc }</td></tr>
	</table>
	
	<div class="button">
		<button type="button" class="back">돌아가기</button>
	</div>
	
	<div class="deliveryChange">
		<form action="orderdeliverymodifyReg" method="post" class="deliveryForm">
			<input type="hidden" name="oino" value="${order.oino }">
			<input type="hidden" name="ono" value="${order.ono }">
			<input type="hidden" name="itemstate" class="itemstate" value="">
			<input type="hidden" name="paystate" class="paystate" value="">
			
			<button type="button" class="delivery_btn1">배송준비</button>
			<button type="button" class="delivery_btn2">배송중</button>
			<button type="button" class="delivery_btn3">배송완료</button>
			
			<script>
				$(".delivery_btn1").click(function(){
					if($("#itemstate").text() == "배송준비") {
						alert("배송준비중입니다.");
					}else if($("#itemstate").text() == "배송중") {
						alert("배송중입니다.")
					}else if($("#itemstate").text() == "배송완료") {
						alert("배송완료 되었습니다.")
					}else {
						$(".itemstate").val("배송준비");
						$(".paystate").val("배송준비");
	
						run();
					}
				});
				
				$(".delivery_btn2").click(function(){
					if($("#itemstate").text() == "결제완료") {
						alert("배송준비를 먼저 클릭하세요");
						return false;
						
					}else if($("#itemstate").text() == "배송중") {
						alert("배송중입니다.")
						
					}else if($("#itemstate").text() == "배송완료") {
						alert("배송완료 되었습니다.")
						
					}else {
						$(".itemstate").val("배송중");
						$(".paystate").val("배송중");
						run();
					}
				});
				
				$(".delivery_btn3").click(function(){
					if($("#itemstate").text() == "결제완료") {
						alert("배송준비를 먼저 클릭하세요");
						return false;
						
					}else if($("#itemstate").text() == "배송준비"){
						alert("배송중을 먼저 클릭하세요");
						return false;
						
					}else if($("#itemstate").text() == "배송완료") {
						alert("배송완료 되었습니다.")
						
					}else{
						$(".itemstate").val("배송완료");
						$(".paystate").val("배송완료");
						run();
					}
					
				});
				
				if($("#itemstate").text() == "주문취소" || $("#itemstate").text() == "반품신청" || $("#itemstate").text() == "환불완료") {
					$(".delivery_btn1").css("display","none");
					$(".delivery_btn2").css("display","none");
					$(".delivery_btn3").css("display","none");
				}
				
				function run() {
					$(".deliveryForm").submit();
				}
				
				if($("#paystate").text() == "결제완료" || $("#paystate").text() == "배송준비" || $("#paystate").text() == "주문취소") {
					$("#dno").css("display","none");	
				}
				if($("#paystate").text() == "결제완료" || $("#paystate").text() == "배송준비" || $("#paystate").text() == "배송중" || $("#paystate").text() == "배송완료") {
					$(".canclerefund").css("display","none");
				}
				if($("#paystate").text() == "주문취소" ) {
					$(".refunddate").css("display","none");
					$("#refunddate").css("display","none");
					$(".refundokdate").css("display","none");
					$("#refundokdate").css("display","none");
				}
				if($("#paystate").text() == "반품신청" ) {
					$(".cancelprice").css("display","none");
					$(".canceldate").css("display","none");
					$("#canceldate").css("display","none");
					$(".refundokdate").css("display","none");
					$("#refundokdate").css("display","none");
				}
				if($("#paystate").text() == "환불완료" ) {
					$(".cancelprice").css("display","none");
					$(".canceldate").css("display","none");
					$("#canceldate").css("display","none");
				}
				
				$(".back").click(function (){
					location.href="orderlist"
				});
				
			</script>
		</form>
	</div>
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>