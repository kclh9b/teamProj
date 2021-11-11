<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value="/css/style_userPage.css"/>"></link>    
<div class="userList">
<a href="" id="title">마이페이지</a>
	<ul>
		<li><a href="<c:url value="/member/MemberListOne"/>">회원정보</a></li>
		<li><a href="<c:url value="/member/MyWriteList"/>">내가 쓴 글</a></li>
		<li><a href="<c:url value="/user/UserOrderlist"/>">주문내역</a></li>
	</ul>
</div>