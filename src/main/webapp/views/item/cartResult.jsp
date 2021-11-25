<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dog과함께</title>
<link rel="stylesheet" href="<c:url value="/css/style_cartResult.css"/>"></link>
</head>
<body>
<div class="cartResultWrapper">
	<h2>장바구니에 추가되었습니다</h2>
	
	<button class="locationBtn" onclick="closeWindow()">쇼핑 계속하기</button> <button class="locationBtn" onclick="send('<c:url value="/mypage/cart"/>')">장바구니 이동</button>
</div>
</body>
<script>
function closeWindow() {
	self.close();
}
function send(url) {
	self.close();
	opener.location.href = url;
}
</script>