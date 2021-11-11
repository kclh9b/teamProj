<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/css/style_listone.css"/>">

</head>
<body>

<jsp:include page="../header.jsp" />
<jsp:include page="../userPage.jsp" />
	<div class="content_box">
	<div class="member_tit">
	<h2 style="width: 1200px; margin: 20px auto;">회원 정보</h2>
<div class="table_box">
<table>
	<tr>
		<td class="memberCols1">아이디</td>
		<td class="memberCols2">${memberData.uid}</td>
	</tr>
	<tr>
		<td class="memberCols1">휴대폰번호</td>
		<td class="memberCols2">${memberData.phn}</td>
	</tr>
	<tr>
		<td class="memberCols1">이메일</td>
		<td class="memberCols2">${memberData.email}</td>
	</tr>
		<tr>
		<td class="memberCols1">애견 사이즈</td>
		<td class="memberCols2">
		<c:if test="${memberData.size=='소'}">소형</c:if>
		<c:if test="${memberData.size=='중'}">중형</c:if>
		<c:if test="${memberData.size=='대'}">대형</c:if>
		</td>
	</tr>
		<tr>
		<td class="memberCols1">애견 털길이</td>
		<td class="memberCols2">
		<c:if test="${memberData.fur=='s'}">단모종</c:if>
		<c:if test="${memberData.fur=='l'}">장모종</c:if>
		</td>
	</tr>
		<tr>
		<td class="memberCols1">애견 나이</td>
		<td class="memberCols2">
		<c:if test="${memberData.age=='자견'}">1살 미만</c:if>
		<c:if test="${memberData.age=='성견'}">1살~6살</c:if>
		<c:if test="${memberData.age=='노견'}">6살 초과</c:if>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<button class="btn2" type="button" onclick="location.href='<c:url value="/member/MemberModify"/>' ">정보수정</button>
		<button class="btn2" type="button" onclick="location.href='<c:url value="/member/MemberDelete"/>' ">회원탈퇴</button>
		<button class="btn3" type="button" onclick="location.href='<c:url value="/member/Mypage"/>' ">돌아가기</button>
		</td>
	</tr>
</table>
</div>
</div>
</div>
</body>
<jsp:include page="../footer.jsp" />
</html>