<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/css/style_modify.css"/>">

</head>
<body>
<jsp:include page="../header.jsp" />
<jsp:include page="../userPage.jsp" />
	<div class="content_box">
	<div class="member_tit">
	<h2>회원 탈퇴</h2>
<form action="MemberDelete2" name="delform" id="delform" method="post">
<div class="table_box">

	<table>
			<tr>
				
				<td class="memberCols1">아이디</td>
				<td class="memberCols2">${memberData.uid}
				<input type="hidden" value="${memberData.uid}" id="uid" name="uid">
				</td>
			</tr>
			<tr>
				<td class="memberCols1">PW확인</td>
				<td class="memberCols2"><input type="password" id="passwd" name="passwd">
				<input type="hidden" value="${memberData.passwd}" id="pwck" name="pwck">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"></td>
				<td><input class="btn2" id="subdel" type="button" value="회원탈퇴"></td>
			</tr>
		</table>
		</div>
		</form>
		</div>
		</div>
		<jsp:include page="../footer.jsp" />
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$("#subdel").on("click", function(){
	var pw = $("#passwd").val();
var pwck = $("#pwck").val();

	if(pw=="") {alert("비밀번호를 입력하세요");
		return false;
	}

	else if(pw!=pwck) {
		alert("비밀번호가 다릅니다!");
		return false;
	} 
	else {
		alert("회원탈퇴!");
		document.delform.submit(); 
		}
});
</script>
</html>