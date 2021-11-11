<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<style>
table td{
	text-align: right;
}

</style>
</head>
<body>
<h1>상품 목록 페이지</h1>
<table border="">
	<thead>
		<tr>
			<th>번호</th>
			<th>상품코드</th>
			<th>카테고리</th>
			<th>상품명</th>
			<th>가격</th>
			<th>할인율</th>
			<th>원산지</th>
			<th>제조사</th>
			<th>수량</th>
			<th>메인이미지</th>
			<th>상세이미지</th>
			<th>사이즈</th>
			<th>털길이</th>
			<th>나이</th>
			<th>비만</th>
			<th>등록날짜</th>
		</tr>
	</thead>
	
	<tbody>
<c:forEach items="${item }" var="it" varStatus="no">		
		<tr>
			<td>${no.index+1}</td>
			<td>${it.ino}</td>
			<td>${it.cateid}</td>
			<td><a href="itemdetail?ino=${it.ino }">${it.name }</a></td>
			<td>${it.price }</td>
			<td>${it.discount }</td>
			<td>${it.origin }</td>
			<td>${it.manufac }</td>
			<td>${it.quantity }</td>
			<td>${it.main_img }</td>
			<td>${it.detail_img }</td>
			<td>${it.size }</td>
			<td>${it.fur }</td>
			<td>${it.age }</td>
			<td>${it.fatyn }</td>
			<td>${it.regdate }</td>
		</tr>
</c:forEach>
		<tr>
			<td colspan="16" align="right">
				 <a href="itemForm">상품등록</a>
			</td>
		</tr>			
	</tbody>
</table>
</body>
</html>