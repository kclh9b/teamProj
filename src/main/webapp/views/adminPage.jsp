<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value="/css/style_adminPage.css"/>"></link>    
<div class="adminList">
<a href="" id="title">쇼핑몰 관리</a>
	<ul>
		<li><a href="<c:url value="/member/MemberList"/>" id="a">회원관리</a></li>
		<li><a href="<c:url value="/admin/item"/>" id="b">상품목록</a></li>
		<li><a href="<c:url value="/admin/item/save"/>" id="c">상품등록</a></li>
		<li><a href="<c:url value="/order/orderlist"/>" id="d">주문목록</a></li>
		<li><a href="<c:url value="/order/orderCancellist"/>" id="e">취소목록</a></li>
		<li><a href="<c:url value="/order/orderRefundlist"/>" id="f">반품/환불목록</a></li>
		<li><a href="<c:url value="/adminRecommend"/>" id="g">추천상품</a></li>
		<li><a href="<c:url value="/adminSettle"/>" id="h">정산</a></li>
	</ul>
</div>

<script>
	var url = decodeURI(window.location.href);
	$(document).ready(function(){
		/* alert(url); */
		if(url.indexOf("MemberList") != -1) {
			$("#a").css("font-weight","bold");
		}
		else if(url.indexOf("productlist") != -1) {
			$("#b").css("font-weight","bold");
		}
		else if(url.indexOf("productForm") != -1) {
			$("#c").css("font-weight","bold"); 
		}
		else if(url.indexOf("orderlist") != -1) {
			$("#d").css("font-weight","bold");
		}
		else if(url.indexOf("orderCancellist") != -1) {
			$("#e").css("font-weight","bold");
		}
		else if(url.indexOf("orderRefundlist") != -1) {
			$("#f").css("font-weight","bold");
		}
		else if(url.indexOf("adminRecommend") != -1) {
			$("#g").css("font-weight","bold");
		}
		else if(url.indexOf("adminSettle") != -1) {
			$("#h").css("font-weight","bold");
		}
			
	})
</script>