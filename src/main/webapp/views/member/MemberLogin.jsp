<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>




<link rel="stylesheet" href="<c:url value="/css/style_login.css"/>">
<meta charset="UTF-8">
</head>
<body>

	<jsp:include page="../header.jsp" />
	<div class="content_box">
	<div class="member_wrap">
	<div class="member_tit">
	<h1>로그인</h1>
	</div> 
	<div class="member_cont">
	<div class="member_login_box">
	<h3>회원 로그인</h3>
	<div class="login_input">
	<div>
				<form action="MemberLoginReg" id="login1" name="login1" method="post">
				<input type="text" id="uid" name="uid"  placeholder="아이디">
				<input type="password" id="passwd" name="passwd"  placeholder="비밀번호">
				<button id="log">로그인</button>
				</form>
				</div>
				</div>
				<p>
				<div class="btn_login_box">
						<ul>
							<li>
								<button class="btn_member_join" onclick="location.href='<c:url value="/member/MemberReg"/>' ">회원가입</button>
							</li>
							<li>
								<button class="btn_member_white" onclick="location.href='<c:url value="/member/MemberSearchID"/>' ">아이디 찾기</button>
							</li>
							<li>
								<button onclick="location.href='<c:url value="/member/MemberSearchPW"/>' " class="btn_member_white">비밀번호 찾기</button>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		</div>
</body>
<jsp:include page="../footer.jsp" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
        $("#log").on("click", function(){
		
			if( $("#uid").val()=="") {
                alert("아이디를 입력해주세요.");
                $("#uid").focus();
                return false; 
			}
			else if( $("#passwd").val()=="") {
                    alert("비밀번호를 입력해주세요.");
                    $("#passwd").focus();
                    return false; }  
                else {
    	        	document.login1.submit(); } 
			});
                    </script>
</html>
