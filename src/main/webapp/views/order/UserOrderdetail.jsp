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
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="../userPage.jsp"/>
<div class="goods_list">
	<h2>주문 상세</h2>
	<div class="order">
		<span><strong>${uorder.regdate } 주문 - </strong></span>
		<span>주문번호 ${uorder.ono}</span>
		<span id="dno"> - 배송번호 ${uorder.dno}</span>
	</div>
	<div class="paystate">
		<p>주문상태 - <span id="paystate">${uorder.paystate }</span></p>
	</div>
	<table class="basic">
			<tr>
				<th>주문상태</th>
				<th>상품명</th>
				<th>이미지</th>
				<th>수량</th>
				<th>가격</th>
				<th>합계</th>
			</tr>
	<c:forEach items="${uorderitem }" var="uoi" varStatus="no">		
			<tr>	
				<td id="itemstate">${uoi.itemstate }</td>
				<td><a href="<c:url value="/item/${uoi.ino}"/>">${uoi.name }</a></td>
				<td><img class="orderMainImg" src="<c:url value="/up/item/${uoi.main_img }" />" alt="" ></td>
				<c:choose>
					<c:when test="${uoi.quantity == 0 }">
						<td>${uoi.refundcnt }</td>
					</c:when>
					<c:otherwise>
						<td>${uoi.quantity }</td>
					</c:otherwise>
				</c:choose>
				<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${uoi.calprice }" /></td>
				<c:choose>
					<c:when test="${uoi.quantity == 0 }">
						<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${uoi.refundcnt * uoi.calprice}" /></td>
					</c:when>
					<c:otherwise>
						<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${uoi.quantity * uoi.calprice}" /></td>
					</c:otherwise>
				</c:choose>			
	</c:forEach>
	</table>
	
	<div class="canclerefund">
		<h3>취소/반품/환불</h3>
		<table class="information">
			<tr><th class="canceldate">취소날짜</th><td id="canceldate">${uorder.canceldate }</td></tr>
			<tr><th class="refunddate">반품신청날짜</th><td id="refunddate">${uorder.refunddate }</td></tr>
			<tr><th class="refundokdate">환불날짜</th><td id="refundokdate">${uorder.refundokdate }</td></tr>
			<tr><th class="cancelprice">취소금액</th><td class="cancelprice"><fmt:formatNumber type="number" maxFractionDigits="3" value="${uorder.price }" /></td></tr>
			<c:forEach items="${uorderitem }" var="uoi" varStatus="no">	
			<c:choose>
				<c:when test="${uoi.refund == 'n' }">
						<tr><th class="refund">반품사유</th><td id=refund>상품불량 - ${uoi.name }</td></tr>
						<tr><th class="refundprice">환불금액</th><td id=refundprice><fmt:formatNumber type="number" maxFractionDigits="3" value="${uoi.refundprice }" /></td></tr>	
				</c:when>
				<c:when test="${uoi.refund == 'y' }">
						<tr><th class="refund">반품사유</th><td id=refund>고객변심</td></tr>
						<tr><th class="refundprice">환불금액</th><td id=refundprice><fmt:formatNumber type="number" maxFractionDigits="3" value="${uoi.refundprice }" /></td></tr>	
				</c:when>
				<c:otherwise></c:otherwise>
			</c:choose>
			</c:forEach>
		</table>
	</div>
	
	<h3>받는사람 정보</h3>
	<table class="information">
		<tr><th>받는사람</th><td>${uorder.reciever }</td></tr>
		<tr><th>연락처</th><td>${uorder.phn }</td></tr>
		<tr><th>받는주소</th><td>${uorder.address1 } ${uorder.address2 }</td></tr>
		<tr><th>요청사항</th><td>${uorder.etc }</td></tr>
	</table>
	
	<div class="orderlist">
		<a href="UserOrderlist">주문목록</a>
	</div>
	
	<%-- <div>
		<c:forEach items="${uorderitem }" var="uoi" varStatus="no">	
			<c:choose>
				<c:when test="${uoi.refund == 'n' }">
					<table>
						<tr><td class="refund">반품사유</td><td id=refund>상품불량 - ${uoi.name }</td></tr>
						<tr><td class="refundprice">환불금액</td><td id=refundprice>${uoi.refundprice }</td></tr>	
					</table>
				</c:when>
				<c:when test="${uoi.refund == 'y' }">
					<table>
						<tr><td class="refund">반품사유</td><td id=refund>고객변심</td></tr>
						<tr><td class="refundprice">환불금액</td><td id=refundprice>${uoi.refundprice }</td></tr>	
					</table>
				</c:when>
				<c:otherwise></c:otherwise>
			</c:choose>
		</c:forEach>
	</div> --%>
	
	<%-- <div class="cancelprice">
		<table>
			<tr>
				<td>취소금액</td><td>${uorder.price }</td>
			</tr>
		</table>
	</div> --%>
	
</div>		
<jsp:include page="../footer.jsp"/>	
	<script>
	$(document).ready(function(){
		/* if($("#refund").text() == "n") {
			$("#refund").text("상품불량");
		}
		if($("#refund").text() == "y") {
			$("#refund").text("고객변심");
		} */
		
		/* if($("#paystate").text() == "주문취소" ) {
			$(".cancelprice").css("display","block");
			$(".canceldate").css("display","block");
			$("#canceldate").css("display","block");
		}
		if($("#paystate").text() == "반품신청" ) {
			$(".refunddate").css("display","block");
			$("#refunddate").css("display","block");
		}
		if($("#paystate").text() == "환불완료" ) {
			$(".refunddate").css("display","block");
			$("#refunddate").css("display","block");
			$(".refundokdate").css("display","block");
			$("#refundokdate").css("display","block");
		} */
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
	});	
	
		/* alert($("#paystate").text()); */
	</script>	
</body>
</html>