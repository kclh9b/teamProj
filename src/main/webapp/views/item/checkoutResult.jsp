<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="<c:url value="/css/style_checkoutResult.css"/>"></link>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="resultWrapper">
	<div class="resultBox">
		<h2 style="text-align:center;">주문이 완료되었습니다</h2>
		
		<input type="button" class="locationBtn" value="쇼핑 계속하기" onclick="location.href='<c:url value="/"/>'">
		<input type="button" class="locationBtn" value="장바구니 이동" onclick="location.href='<c:url value="/mypage/cart"/>'">
		<input type="button" class="locationBtn" value="주문내역 이동" onclick="location.href='<c:url value="/user/UserOrderlist"/>'">
	</div>
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>