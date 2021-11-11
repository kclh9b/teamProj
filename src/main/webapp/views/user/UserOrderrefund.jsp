<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style_header.css"></link>
<link rel="stylesheet" href="../css/style_footer.css"></link>
<link rel="stylesheet" href="../css/style_list.css"></link>
<style>
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="../userPage.jsp"/>
<div class="goods_list">
	<h2>반품신청</h2>
	<div class="order">
		<span><strong>${order.regdate } 주문 - </strong></span>
		<span>주문번호 ${order.ono} </span>
		<span id="dno"> - 배송번호 ${order.dno}</span>
	</div>
		<form action="refundReg" class="refundForm">
			<input type="hidden" name="ono" value="${order.ono }">
			<input type="hidden" name="oino" value="${order.oino }"> <!-- ordertable -->
			<input type="hidden" name="itemstate" class="itemstate">
			<input type="hidden" name="paystate" class="paystate" value="${order.paystate }">
			
		<div class="inputArea">
			<p>주문번호 - ${order.ono }</p>
		</div>
		
		<table class="basic">
			<tr>
				<th>상품명</th>
				<th>상품이미지</th>
				<th>수량</th>
				<th>가격</th>
				<th>합계</th>
				<th>주문상태</th>
			</tr>
			<c:forEach items="${orderitem }" var="orit" varStatus="no">		
			<tr>	
				<td>${orit.name }</td>
				<td><img class="orderMainImg" src="<c:url value="/up/item/${orit.main_img }" />" alt="" ></td>
				<td>${orit.quantity }</td>
				<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${orit.calprice }" /></td>
				<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${orit.totalPrice }" /></td>
				<td>${orit.itemstate }</td>
			</tr>
			</c:forEach>
		</table>
		
		<div class="refundreason">
			<input type="hidden" class="refundprice" name="refundprice" value="">
			<h3>반품</h3>
			<table class="information">
			<tr><th>반품사유</th><td><input type="radio" name="refund" id="refund" value="y">고객변심 <input type="radio" name="refund" id="refund" value="n">상품불량</td></tr>
			<tr><th>상품명</th>
				<td>
					<c:forEach items="${orderitem }" var="orit" varStatus="no">
						<input type="radio" name="ino" id="ino" value="${orit.ino }">${orit.name }		
					</c:forEach>
				</td>
			</tr>
			<tr><th>환불금액</th><td id="refundprice"></td></tr>
			</table>			
		</div>
		
		<div class="button">
			<button type="button" class="submit">반품신청</button>
			<button type="button" class="back">돌아가기</button>
		</div>	
			
		<script>
			$(document).ready(function(){
				/* alert($("#refundprice").text()); */
				$("input:radio[name=refund]").click(function(){
       			
					if($("input:radio[name=refund]:checked").val() == "y") {
       					$("#refundprice").text(${order.price - order.delifee});
       					$(".refundprice").val(${order.price - order.delifee});
       				 }else if($("input:radio[name=refund]:checked").val() == "n") {
       					$("#refundprice").text(${order.price});
       					$(".refundprice").val(${order.price});
       				 }
				})
			})
			
			$(".back").click(function (){
				history.back();
			});
			
			$(".submit").click(function (){
				if(confirm("상품을 반품하시겠습니까?")) {
					if($('input:radio[name=refund]').is(':checked') == false) {
						alert("반품사유를 체크해주세요");
						return;
					}
					if($('input:radio[name=ino]').is(':checked') == false) {
						alert("상품명을 체크해주세요");
						return;
					}
					$(".itemstate").val("반품신청");
					$(".paystate").val("반품신청");
					$(".refundForm").submit(); 
				}
			});
			
		</script>
			
		</form>
</div>		
<jsp:include page="../footer.jsp"/>	
</body>
</html>