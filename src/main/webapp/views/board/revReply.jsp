<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<h2>댓글 달기</h2>
	
	<form action="revRepReg">
	
	<table border="">
		
		<tr>
			<td>상품후기번호</td>
			<td>작성자</td>			
		</tr>
		
		<tr>
			<td><input type="hidden" name="revno" value="${mainData.revno }">${mainData.revno }</td>
			<td><input type="hidden" name="uid" value="${uid }">${uid }</td>
		</tr>
		<tr>
			<td colspan="2" align="center">내용</td>
		</tr>
		<tr>
			<td colspan="3"><textarea name="content" cols="30" rows="10"></textarea></td>
		</tr>	
		
			<!-- (세션 체크해서 관리자만 보여지게) -->		
		<tr>
			<td colspan="5" align="right">
			<button>작성</button>
		</tr>
		
	</table>	

	</form>
	
</body>
</html>