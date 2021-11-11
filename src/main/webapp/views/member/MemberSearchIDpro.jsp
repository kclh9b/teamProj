<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="<c:url value="/css/style_search.css"/>">
<head>
<meta charset="UTF-8">

</head>
<body>
<jsp:include page="../header.jsp" />
	<div class="content_box">
	<div class="member_wrap">
	<div class="member_tit">
	<h1>아이디 확인</h1>
	<div class="login_input">
	</div>
<c:if test="${memberData.uid!=null}">${memberData.uid }</c:if>
<c:if test="${memberData.uid==null}">이메일 혹은 휴대폰 번호를 확인해 주세요.</c:if><p>
<button onclick="location.href='<c:url value="/member/MemberSearchPW"/>' " class="btn_member_white">비밀번호 찾기</button>
<button onclick="location.href='<c:url value="/member/MemberLogin"/>' " class="btn_member_join">로그인</button>

</div>
</div>
</div>
<jsp:include page="../footer.jsp" />
</body>
</html>