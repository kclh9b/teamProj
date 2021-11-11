<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div {
		width: 500px;
		height: 200px;
		border: 1px solid black;
	}
</style>
</head>
<body>
	추천상품 선정화면입니다.
	<div>상품 1
		<form action="/recItemAction">
			<input type="hidden" name="recno" value="1">
			<select name="ino">
				<option value="0">선택</option>
				<c:forEach items="${inos }" var="list" varStatus="no">
					<option value="${list.ino }" <c:if test="${list.ino.equals(recinos.get(0).ino) }">selected</c:if>>${list.ino }</option>
				</c:forEach>
			</select>
			<input type="submit" value="등록">
		</form>
	</div>
	<div>상품 2
		<form action="/recItemAction">
			<input type="hidden" name="recno" value="2">
			<select name="ino">
				<option value="0">선택</option>
				<c:forEach items="${inos }" var="list" varStatus="no">
					<option value="${list.ino }" <c:if test="${list.ino.equals(recinos.get(1).ino) }">selected</c:if>>${list.ino }</option>
				</c:forEach>
			</select>
			<input type="submit" value="등록">
		</form>
	</div>
	<div>상품 3
		<form action="/recItemAction">
			<input type="hidden" name="recno" value="3">
			<select name="ino">
				<option value="0">선택</option>
				<c:forEach items="${inos }" var="list" varStatus="no">
					<option value="${list.ino }" <c:if test="${list.ino.equals(recinos.get(2).ino) }">selected</c:if>>${list.ino }</option>
				</c:forEach>
			</select>
			<input type="submit" value="등록">
		</form>
	</div>
	<div>상품 4
		<form action="/recItemAction">
			<input type="hidden" name="recno" value="4">
			<select name="ino">
				<option value="0">선택</option>
				<c:forEach items="${inos }" var="list" varStatus="no">
					<option value="${list.ino }" <c:if test="${list.ino.equals(recinos.get(3).ino) }">selected</c:if>>${list.ino }</option>
				</c:forEach>
			</select>
			<input type="submit" value="등록">
		</form>
	</div>
	<div>상품 5
		<form action="/recItemAction">
			<input type="hidden" name="recno" value="5">
			<select name="ino">
				<option value="0">선택</option>
				<c:forEach items="${inos }" var="list" varStatus="no">
					<option value="${list.ino }" <c:if test="${list.ino.equals(recinos.get(4).ino) }">selected</c:if>>${list.ino }</option>
				</c:forEach>
			</select>
			<input type="submit" value="등록">
		</form>
	</div>
</body>
</html>