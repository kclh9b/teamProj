<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/css/style_adminModi.css"/>">

</head>
<body>
<jsp:include page="../header.jsp" />
<div class="content_box">
	<div class="member_tit">
	<h2>관리자 회원 관리</h2>
<form id="modform" name="modform" >
	<div class="table_box">
	<table>
		<tr>
			<td class="memberCols1">아이디</td>
			<td class="memberCols2"><input type="hidden" name="uid" value="${memberData.uid }"/>${memberData.uid }</td>
		</tr>
		<tr>
			<td class="memberCols1">이메일</td>
			<td class="memberCols2"><input type="text" id="email" name="email" value="${memberData.email }"/></td>
		</tr>
		<tr>
			<td class="memberCols1">경고횟수</td>
			<td class="memberCols2"><input type="text" maxlength='2' id="warncnt" name="warncnt" value="${memberData.warncnt }" /></td>
		</tr>
		<tr>
		<td class="memberCols1">주소</td>
		<td class="memberCols2">
		<input type="text" id="sample6_postcode" name="zipcode" maxlength='5' placeholder="우편번호" value="${memberData.zipcode}">
		<button type="button" class="btn" id="zipsearch" onclick="sample6_execDaumPostcode()" value="">우편번호 찾기</button>
		</td>
		</tr>
		<tr>
		<td class="memberCols1"></td>
		<td class="memberCols2"><input type="text" id="sample6_address" name="address1" placeholder="주소" value="${memberData.address1}">
		</tr>
		<tr><td class="memberCols1"></td>
		<td class="memberCols2">
		<input type="text" id="sample6_detailAddress" name="address2" placeholder="상세주소" value="${memberData.address2}"></td></tr>
		<tr>
			<td class="memberCols1">탈퇴여부</td>
			<td class="memberCols2">
			<input type="radio" id="available" name="available" value="y" <c:if test="${memberData.available == 'y' }">checked</c:if>/>일반회원
			<input type="radio" id="available" name="available" value="n" <c:if test="${memberData.available == 'n' }">checked</c:if> />탈퇴회원</td>
			</tr>
			<tr>
			<td class="memberCols1">블랙리스트여부</td>
			<td class="memberCols2">
			<c:if test="${memberData.black eq 'y'}">블랙리스트 회원</c:if>
			<c:if test="${memberData.black eq 'n'}">일반 회원</c:if>
			<input type="submit" class="btn4" value="블랙리스트 관리" onClick="javascript: form.action='AdminBlack';"/>
		 
			</td>
		</tr>
		<tr>
		<td colspan="2" align="center"><input type="submit" id="sss" class="btn2" value="정보수정" onclick="javascript: form.action='AdminModify3';"/>
		<button class="btn3" type="button" onclick="location.href='<c:url value="/member/MemberList"/>' ">취소</button>
	
		 </td>
		</tr>
</table>
</div>
</form>
</div>
</div>


<jsp:include page="../footer.jsp" />
</body>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    // document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    // document.getElementById("sample6_extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	    
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$("#sss").on("click", function(){
	
	if( $("#email").val()=="") {
        alert("이메일을 입력해주세요.");
        $("#email").focus();
        return false; }
	
	else if(emailValidator($("#email").val())==false) {
		alert("허용되지 않은 이메일 양식입니다.");
		return false;
	}
	
	else if( $("#warncnt").val()=="") {
        alert("경고횟수를 입력해주세요.");
        $("#warncnt").focus();
        return false; }
	
	else if(warnValidator($("#warncnt").val())==false) {
		alert("2자리 이하의 숫자만 입력해 주세요.");
		return false;
	}
	else if( $("#sample6_address").val()=="") {
        alert("주소를 입력해주세요.");
        $("#sample6_address").focus();
        return false; }
	
	else if( $("#sample6_detailAddress").val()=="") {
        alert("상세 주소를 입력해주세요.");
        $("#sample6_detailAddress").focus();
        return false; }
	
	else if( $("#sample6_postcode").val()=="") {
        alert("우편번호를 입력해주세요.");
        $("#sample6_postcode").focus();
        return false; }
	
	else if(zipcodeValidator($("#sample6_postcode").val())==false) {
		alert("올바른 우편번호 형식이 아닙니다.");
		return false;
	}
	else if( $("#available").val()=="") {
        alert("계정활성화 여부를 입력해주세요.");
        $("#available").focus();
        return false; }
});
	

function zipcodeValidator(args) {

    if (/^[0-9]{5,}$/.test(args)) {
        return true;
    }
    return false;
}

function warnValidator(args) {

    if (/^[0-9]{1,2}$/.test(args)) {
        return true;
    }
    return false;
}

function emailValidator(args) {
	if(/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/.test(args)) {
		return true;
	}
	return false;
}
	
	</script>
</html>