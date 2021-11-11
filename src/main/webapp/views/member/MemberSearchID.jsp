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
	<h1>아이디 찾기</h1>
	</div> 
	<div class="member_cont">
	<div class="member_login_box">
	<h3>아이디 찾기</h3>
	<div class="login_input">
	<div>
	<form action="MemberSearchIDpro" id="schid">
			<input type="text" id="email" name="email" placeholder="이메일"/>
			<input type="text" id="phn" name="phn" placeholder="휴대폰 번호"/>
			<button class="btn" type="submit" id="searchID">아이디 찾기</button>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
        $("#searchID").on("click", function(){
		
			if( $("#email").val()=="") {
                alert("이메일을 입력해주세요.");
                $("#email").focus();
                return false; 
			}
			else if( $("#phn").val()=="") {
                    alert("휴대폰 번호를 입력해주세요.");
                    $("#phn").focus();
                    return false; }  
                else {
    	        	document.schid.submit(); } 
			});
        </script>
</html>