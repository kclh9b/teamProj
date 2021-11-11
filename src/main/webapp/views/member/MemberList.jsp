<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/css/style_list_mem.css"/>">
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="../header.jsp" />
<jsp:include page="../adminPage.jsp"/>
<div class="search">
	<form action="">
		<select name="searchType">
			<option value="i">아이디</option>
			<option value="e">이메일</option>
		</select>
		<input type="text" name="sch" id="sch">
		<input type="submit" value="검색" id="search" class="btn">
	</form>
</div>
<div class="mems_list">
<!-- <form action="AdminModify"> -->
<table class="basic">
	<thead>
		<tr>
			<th><a href="<c:url value="/member/MemberList"/>">아이디</a></th>
			<th>이메일</th>
			<th>주소</th>
			<th>경고횟수</th>
			<th><a href="<c:url value="/member/MemberList?searchType=a&sch=n"/>">탈퇴 여부</a></th>
			<th><a href="<c:url value="/member/MemberList?searchType=b&sch=y"/>">블랙리스트</a></th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${memberData }" var="vo" varStatus="no">

		<tr>
			
			<td><a href="/member/AdminModify?uid=${vo.uid}">${vo.uid}</a></td>
			<td>${vo.email}</td>
			<td>${vo.address1} ${vo.address2 }</td>
			<td>${vo.warncnt}</td>
			<td><c:if test="${vo.available=='y'}"></c:if>
				<c:if test="${vo.available=='n'}">○</c:if>
				</td>
				<td><c:if test="${vo.black=='y'}">○</c:if>
				<c:if test="${vo.black=='n'}"></c:if>
				</td>
		</tr>
		</c:forEach>
		<tr><td colspan="6"><!-- 
	<input type="submit" class="btn2" id="modi" value="정보수정" /> -->
	<button class="btn3" type="button" onclick="location.href='<c:url value="/member/Mypage"/>' ">돌아가기</button>
	</td>
	</table>
	
</form>
</div>
<jsp:include page="../footer.jsp" />
	
<script>
$("#search").click(function(){
	if($("#sch").val() == '') {
		alert("검색어를 입력해주세요");
		return false;
	}
});	

$("#modi").click(function(){
	if (!$("input:checked[name='uid']").is(":checked")) {
		alert("수정할 회원을 선택해 주세요.");
		return false;
	}
});	
</script>
</body>
</html>