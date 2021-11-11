<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/css/style_search.css"/>">

</head>
<body>
<jsp:include page="../header.jsp" />
	<div class="content_box">
	<div class="member_wrap">
	<div class="member_tit">
	<h1>비밀번호 찾기</h1>
	</div>
	<div class="login_input">
	<c:if test="${memberData.passwd!=null}">${memberData.passwd }</c:if>
	<c:if test="${memberData.passwd==null}">아이디나 휴대폰 번호를 확인해 주세요.</c:if><p>
	<button onclick="location.href='<c:url value="/member/MemberLogin"/>' " class="btn_member_join">로그인</button>

	</div>
	</div>
	</div>
<jsp:include page="../footer.jsp" />
</body>
</html>