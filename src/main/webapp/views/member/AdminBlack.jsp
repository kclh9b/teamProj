<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/css/style_black.css"/>">
</head>
<body>
<jsp:include page="../header.jsp" />
<jsp:include page="../userPage.jsp" />
	<div class="content_box">
	<div class="member_tit">
	<h2>회원 블랙리스트</h2>
	</div>
<form name="blackList">
	<input type="hidden" name="uid" value="${memberData.uid }">
	<div class="table_box">
	<table>
		<tr>
			<td class="memberCols1">아이디</td>
			<td class="memberCols2">${memberData.uid }</td>
		</tr>
		<tr>
			<td class="memberCols1">주소</td>
			<td class="memberCols2">${memberData.address1} ${memberData.address2 }</td>
		</tr>
		<tr>
			<td class="memberCols1">이메일</td>
			<td class="memberCols2">${memberData.email }</td>
		</tr>
		<tr>
			<td class="memberCols1">휴대전화 번호</td>
			<td class="memberCols2">${memberData.phn }</td>
		</tr>
		<tr>
			<td class="memberCols1">경고횟수</td>
			<td class="memberCols2">${memberData.warncnt }</td>
		</tr>
		<tr>
		<td colspan="4" align="center">    
		<input type="submit" id="blackA" class="btn" value="블랙리스트 처리" onClick="al1(); javascript: form.action='AdminBlackA'; ">
     	<input type="submit" id="blackF" class="btn2" value="블랙리스트 해제" onClick="al2(); javascript: form.action='AdminBlackF';"></td>
		</tr>		
	</table>
	</div>

               
</form>
</div>
<jsp:include page="../footer.jsp" />
</body>
<script>

function al1(){
	alert("블랙리스트 처리!");
}

function al2(){
	alert("블랙리스트 해제!");
}
</script>
</html>

