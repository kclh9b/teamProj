<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value="/css/style_mywrite.css"/>">

</head>
<body>
<jsp:include page="../header.jsp" />
<jsp:include page="../userPage.jsp" />
	<div class="content">
	<div class="member_tit">
	<h2 style="width:1200px; margin:20px auto;">내가 쓴 글</h2>
	</div> 
<div class="mems_list">
<p>
<h2>자유게시판</h2>
<table class="basic">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성일</th>
		</tr>
	</thead>
	
	<tbody>
	<c:forEach items="${memberData }" var="vo" varStatus="no">
	<tr>
		<td>${vo.comuno }</td>
		<td><a href="../board/cbdetail?comuno=${vo.comuno }">${vo.title }</a></td>
		<td>${vo.regdate }</td>
	</c:forEach>
</table>
<p>

<h2>리뷰 게시판</h2>
<table class="basic">
	<thead>
		<tr>
			<th>번호</th>
			<th>상품번호</th>
			<th>작성일</th>
		</tr>
	</thead>

	<tbody>
	<c:forEach items="${memberData2 }" var="vo2" varStatus="no">
	
		<tr>
		<td>${vo2.revno }</td>
		<td><a href="../board/revDet?revno=${vo2.revno }">${vo2.ino }</a></td>
		<td>${vo2.regdate }</td>
	</tr>
	</c:forEach> 
</table>

<p>

<h2>QNA 게시판</h2>
<table class="basic">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성일</th>
		</tr>
	</thead>

	<tbody>
	<c:forEach items="${memberData3 }" var="vo3" varStatus="no">
	
		<tr>
		<td>${vo3.qnano }</td>
		<td><a href="../board/qnaDet?qnano=${vo3.qnano }">${vo3.title }</a></td>
		<td>${vo3.regdate }</td>
	</tr>
	</c:forEach> 
<tr>

</table>
<div style="width: 152px; margin: 0 auto;">
	<button style="margin-top: 50px;" class="btn3" type="button" onclick="location.href='<c:url value="/member/Mypage"/>' ">돌아가기</button>
</div>
</div>
</div>
<jsp:include page="../footer.jsp" />

</body>

</html>