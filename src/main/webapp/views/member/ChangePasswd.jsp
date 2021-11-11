<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/css/stlye_changePW.css"/>">

</head>
<body>
<jsp:include page="../header.jsp" />
	<div class="content_box">
	<div class="member_tit">
	<h2>비밀번호 변경</h2>
<form name="changepw" method="post" action="ChangePasswd2" name="pcha" id="pcha">
<div class="table_box">
<table>
	<tr>
	<td><input type="hidden" id="oldpasswd" name="oldpasswd" value="${memberData.passwd }"/></td>
	</tr>
	<tr>
	<td class="memberCols1">* 이전 비밀번호</td>
	<td class="memberCols2">
	<input type="password" id="oldpasswd2" name="oldpasswd2" /></td>
	</tr>
	<tr>
	<td class="memberCols1">비밀번호</td>
	<td class="memberCols2"><input type="password" id="passwd" name="passwd" /></td>
	</tr>
	<tr>
	<td  class="memberCols1">비밀번호 확인</td>
	<td  class="memberCols2"><input type="password" id="passwd2" name="passwd2"/></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="button" id="pwck" name="pwck" class="btn2" value="비밀번호 변경"><button type="button" class="btn3" onclick="location.href='<c:url value="/member/MemberModify"/>' ">돌아가기</button></td>
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

$("#pwck").on("click", function(){
	var pw1 = $("#passwd").val();
	var pw2 = $("#passwd2").val();
	var opw1 = $("#oldpasswd").val();
	var opw2 = $("#oldpasswd2").val();
	
	if(opw1==opw2) {
		
    if(pw1==pw2){
    	
    if(opw1==pw1) {
    	alert("변경하려는 비밀번호와 기존 비밀번호가 같습니다.");
    	return false;
    }
    else if(pw1=="") {
    	alert("비밀번호를 확인해 주세요.");
    	return false;
    }
    
	 else if(pwValidator($("#passwd").val())==false) {
		alert("허용되지 않은 비밀번호 양식입니다.")
		return false;
	}
    else if(opw1!=pw1){
        alert("변경완료!!");
        document.changepw.submit(); 
        }
    }
    else {
    	alert("비밀번호를 확인해 주세요.");	
    	return false;
    }
	}else {
		alert("기존 비밀번호를 확인해 주세요!");
		return false;
	}
	
	
});


function pwValidator(args) {
	if(/^(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$/.test(args)) {
		return true;
	}
	return false;
}

</script>
</html>