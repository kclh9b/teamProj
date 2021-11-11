<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<link rel="stylesheet" href="<c:url value="/css/style_modify.css"/>">
<body>
<jsp:include page="../header.jsp" />
<jsp:include page="../userPage.jsp" />
	<div class="content_box">
	<div class="member_tit">
	<h2>회원 정보 수정</h2>
	</div>
<form action="MemberModify2" name="modi">
<div class="table_box">
	<table>
	
		<tr>
			<td class="memberCols1">아이디</td>
			<td class="memberCols2"><%= session.getAttribute("uid") %> </td>
			
		</tr>
		<tr>
			<td class="memberCols1">비밀번호</td>
			<td class="memberCols2"><button type="button" class="btn" onClick="location.href='ChangePasswd'">비밀번호 변경</button>
			</td>
		</tr>
		<tr>
			<td class="memberCols1">휴대폰 번호</td>
			<td class="memberCols2"><input type="text" id=phn name="phn" value="${memberData.phn}"/></td>
		</tr>
		<tr>
			<td class="memberCols1">이메일</td>
			<td class="memberCols2"><input type="text" id="email" name="email" value="${memberData.email}"/></td>
		</tr>
		<tr>
		<td class="memberCols1">주소</td>
		<td class="memberCols2">
		<input type="text" id="sample6_postcode" name="zipcode" placeholder="우편번호" maxlength='5' value="${memberData.zipcode}">
		<button type="button" class="btn" id="zipsearch" onclick="sample6_execDaumPostcode()" value="">우편번호 찾기</button>
		<tr>
		<td class="memberCols1"></td>
		<td class="memberCols2">
		<input type="text" id="sample6_address" name="address1" placeholder="주소" value="${memberData.address1}">
		</td></tr>
		<tr>
		<td class="memberCols1"></td>
		<td class="memberCols2">
		<input type="text" id="sample6_detailAddress" name="address2" placeholder="상세주소" value="${memberData.address2}"></td></tr>
		
		<tr>
			<td class="memberCols1">사이즈</td>
			<td class="memberCols2"><input type="radio" id="size" name="size" value="소" <c:if test="${memberData.size == '소' }">checked</c:if>>소형
				<input type="radio" id="size" name="size" value="중" <c:if test="${memberData.size == '중' }">checked</c:if>>중형
				<input type="radio" id="size" name="size" value="대" <c:if test="${memberData.size == '대' }">checked</c:if>>대형</td>
		</tr>
		<tr>
			<td class="memberCols1">털길이</td>
			<td class="memberCols2"><input type="radio" id="fur" name="fur" value="l" <c:if test="${memberData.fur == 'l' }">checked</c:if>>장모종
				<input type="radio" id="fur" name="fur" value="s" <c:if test="${memberData.fur == 's' }">checked</c:if>>단모종</td>
		</tr>
		<tr>
			<td class="memberCols1">나이</td>
			<td class="memberCols2"><input type="radio" id="age" name="age" value="자견" <c:if test="${memberData.age == '자견' }">checked</c:if>>1살 미만
				<input type="radio" id="age" name="age" value="성견" <c:if test="${memberData.age == '성견' }">checked</c:if>>1살 ~ 6살
				<input type="radio" id="age" name="age" value="노견" <c:if test="${memberData.age == '노견' }">checked</c:if>>7살 이상</td>
		</tr>
	
			<tr>
	<td colspan="2" align="center"><input class="btn2" id="sss" type="button" value="정보수정"><button class="btn3" type="button" onclick="location.href='<c:url value="/member/Mypage"/>' ">돌아가기</button></td>
	</tr>
	</table>
	</div>

</form>
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

			if( $("#name").val()=="") {
                alert("이름을 입력해주세요.");
                $("#name").focus();
                return false;
			}
		
			else if(nameValidator($("#name").val())==false) {
				alert("허용되지 않은 아이디 양식입니다.")
				return false;
			}
			
			else if( $("#phn").val()=="") {
                alert("휴대폰 번호를 입력해주세요.");
                $("#phn").focus();
                return false;
			}
			
			else if(telValidator($("#phn").val())==false) {
				alert("허용되지 않은 휴대폰 번호 양식입니다.")
				return false;
			}
			
			else if( $("#email").val()=="") {
                alert("이메일을 입력해주세요.");
                $("#email").focus();
                return false;
			}
			
			else if(emailValidator($("#email").val())==false) {
				alert("허용되지 않은 이메일 양식입니다.")
				return false;
			}
			
			else if( $("#sample6_postcode").val()=="") {
                alert("우편번호를 입력해주세요.");
                $("#sample6_postcode").focus();
                return false;
			}
			
			else if(zipcodeValidator($("#sample6_postcode").val())==false) {
				alert("허용되지 않은 우편번호 양식입니다.")
				return false;
			}
			

			
			
			else if( $("#sample6_address").val()=="") {
                alert("주소를 입력해주세요.");
                $("#address1").focus();
                return false;
			}
			
			else if( $("#sample6_detailAddress").val()=="") {
                alert("상세 주소를 입력해 주세요.");
                $("#address2").focus();
                return false;
			}
			
			
			

	/* 		else if (!$("input:checked[id='size']").is(":checked"))
			{ alert("애견의 크기를 입력해 주세요."); 
			  $("size").focus(); return false; }
			
			else if (!$("input:checked[id='fur']").is(":checked"))
			{ alert("애견의 털길이를 입력해 주세요"); 
			  $("fur").focus(); return false; }

			else if (!$("input:checked[id='age']").is(":checked"))
			{ alert("애견의 나이를 입력해 주세요"); 
			  $("age").focus(); return false; }
 */
			else {
	        	alert("정보수정.");
	        	console.log(document.modi);
	        	document.modi.submit(); 
	        	} 
    	});
 

	function telValidator(args) {

	    if (/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/.test(args)) {
	        return true;
	    }
	    return false;
	}

	function idValidator(args) {

	    if (/^[a-zA-z0-9]{4,12}$/.test(args)) {
	        return true;
	    }
	    return false;
	}
	
			
	function birthValidator(args) {
	    if (/^(\(?\+?[0-9]*\)?)?[0-9_\- \(\)]*.{8,}$/.test(args)) {
	        return true;
	    }
	    return false;
	}
	
	
	function zipcodeValidator(args) {
		  if (/^[0-9]{5,}$/.test(args)) {
	        return true;
	    }
	    return false;
	}
	
	
	
	function pwValidator(args) {
		if(/^(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$/.test(args)) {
			return true;
		}
		return false;
	}
	
	function nameValidator(args) {
		if(/^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|]+$/.test(args)) {
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