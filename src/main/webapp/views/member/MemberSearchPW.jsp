<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value="/css/style_search.css"/>"><meta charset="UTF-8">
</head>
<body>
<jsp:include page="../header.jsp" />
	<div class="content_box">
	<div class="member_wrap">
	<div class="member_tit">
	<h1>비밀번호 찾기</h1>
	</div> 
	<div class="member_cont">
	<div class="member_login_box">
	<h3>비밀번호 찾기</h3>
	<div class="login_input">
	<div>
	
<form action="MemberSearchPWpro">

		<input type="text" name="uid" placeholder="아이디"/>	
		<input type="text" name="phn" placeholder="휴대폰 번호"/>
		<input class="btn" type="submit" value="비밀번호찾기" />
		
		<button class="btn2" type="button" onclick="location.href='<c:url value="/member/MemberLogin"/>' ">돌아가기</button>

	</form>
		</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>