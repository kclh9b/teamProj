<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<link rel="stylesheet" href="<c:url value="/css/style_reg.css"/>">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<body>
	<jsp:include page="../header.jsp" />
	
	<div class="content_box">
	<div class="member_tit">
	<h2>회원가입</h2>

	</div> 
		<form name="regform" action="MemberReg2" method="post">
			<div class="table_box">
			<table class="regTable">
					<tr>
						<td class="memberCols1"><span id="essential">*</span>아이디</td>
						<td class="memberCols2"><input type="text" id="uid" name="uid" placeholder="영문, 숫자 4~12자리를 입력해 주세요."/>
							<button type="button" class="btn" id="idck" onclick="idchk();" value="N">중복확인</button>
						</td>
					</tr>
					<tr>
						<td class="memberCols1"><span id="essential">*</span>비밀번호</td>
						<td class="memberCols2"><input type="password" id="passwd" name="passwd" placeholder="영문,숫자,특수문자가 포함된 8자리 이상 문자"/></td>
					</tr>
					<tr>
						<td class="memberCols1"><span id="essential">*</span>비밀번호 체크</td>
						<td class="memberCols2"><input type="password" id="passwd2" name="passwd2" /></td>
					</tr>
					<tr>
						<td class="memberCols1"><span id="essential">*</span>이름</td>
						<td class="memberCols2"><input type="text" id="name" name="name" placeholder="한글 혹은 영문만 입력" /></td>
					</tr>
					<tr>
						
						<td class="memberCols1"><span id="essential">*</span>생년월일</td>
						<td class="memberCols2">
						<input type="text" id="birth" name="birth" placeholder="8자리 숫자" maxlength='8'/>
						</td>
					</tr>
					<tr>
						<td class="memberCols1"><span id="essential">*</span>성별</td>
						<td class="memberCols2"><input type="radio" id="gender" name="gender" value="남" />남
							<input type="radio" id="gender" name="gender" value="여" />여</td>
					</tr>

					<tr>
						<td class="memberCols1"><span id="essential">*</span>주소</td>
						<td class="memberCols2"><input type="text" id="sample6_postcode" name="zipcode"
							placeholder="우편번호" value="" placeholder="5자리 숫자" maxlength='5'>
							<button type="button" id="zipsearch" class="btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">우편번호 찾기</button> 
						</td>
						<tr>
						<td class="memberCols1"></td>
							<td class="memberCols2"><input type="text" id="sample6_address" name="address1" placeholder="주소" value=""> </td>
						</tr>
						<tr>
						<td class="memberCols1"></td>
							<td class="memberCols2"><input type="text" id="sample6_detailAddress" name="address2" placeholder="상세주소" value=""></td>
					</tr>
					<tr>
						<td class="memberCols1"><span id="essential">*</span>휴대폰 번호</td>
						<td class="memberCols2"><input type="text" id="phn" name="phn" placeholder="하이픈(-) 포함"/></td>
					</tr>
					<tr>
						<td class="memberCols1"><span id="essential">*</span>이메일</td>
						<td class="memberCols2">
						<input type="text" id="email" name="email" />
						<button type="button" class="btn" id="emailck" onclick="emailchk();" value="N">중복확인</button>
						</td>
					</tr>
					<tr>
						<td class="memberCols1">사이즈
						<button type="button" class="btn" id="doginfo" onclick="dogin();">애견 정보</button>
						</td>
						<td class="memberCols2"><input type="radio" id="size" name="size" value="소" />소형견
							<input type="radio" id="size" name="size" value="중" />중형견 <input
							type="radio" id="size" name="size" value="대" />대형견
							</td>
					</tr>
					<tr>
						<td class="memberCols1">털길이</td>
						<td class="memberCols2"><input type="radio" id="fur" name="fur" value="l" />장모종 <input
							type="radio" id="fur" name="fur" value="s" />단모종</td>
					</tr>
					<tr>
						<td class="memberCols1">강아지 나이</td>
						<td class="memberCols2"><input type="radio" id="age" name="age" value="자견" />1살
							미만 <input type="radio" id="age" name="age" value="성견" />1살 ~ 6살 <input
							type="radio" id="age" name="age" value="노견" />7살 이상</td>
			
					</tr>

					<tr>
						<td colspan="2" align="center"><input type="button" class="btn2" id="sss" value="회원가입" /></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	
			
	<jsp:include page="../footer.jsp" />
</body>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!-- 달력 api -->
<script>
   $(function() {
       //input을 datepicker로 선언
       $("#birth").datepicker({
           dateFormat: 'yymmdd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,showOn: "focus" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시 
           ,buttonText: "선택" //버튼 호버 텍스트             
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
          /*  ,minDate: "-100Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "-1D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)   */
           ,yearRange: 'c-100:c+0'
           ,maxDate: 0
       });                    
       
       /* $('#birth').datepicker('setDate', 'today'); */ //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
   });
</script>



<script type="text/javascript">

function dogin(){
    var url = "/member/info";
    var name = "popup test";
    var option = "width = 500, height = 500, top = 100, left = 200, location = no"
    window.open(url, name, option);
}
		
        $("#sss").on("click", function(){
 			var pw = $("#passwd").val();
 			var pwc = $("#passwd2").val();
			var idChkVal = $("#idck").val();	
			var emailChkVal = $("#emailck").val();	
			if( $("#uid").val()=="") {
                alert("아이디를 입력해주세요.");
                $("#uid").focus();
                return false; }
			else if(idValidator($("#uid").val())==false) {
				alert("허용되지 않은 아이디 양식입니다.")
				return false;
			}
			else if(idChkVal == "N")  {
				alert("아이디 중복확인을 해주세요!");
				return false;
			}
                
			else if( $("#passwd").val()=="") {
                    alert("비밀번호를 입력해주세요.");
                    $("#passwd").focus();
                    return false; }
			
			else if (pw!=pwc) {
					alert("비밀번호가 일치하지 않습니다.");
					$("#passwd").focus();
					$("#passwd2").focus();
					return false;
				}
			
			else if(pwValidator($("#passwd").val())==false) {
				alert("허용되지 않은 비밀번호 양식입니다.");
				$("#passwd").focus();
				return false;
			}
			else if( $("#name").val()=="") {
                alert("이름을 입력해주세요.");
                $("#name").focus();
                return false;
			}
			
			else if(nameValidator($("#name").val())==false) {
				alert("허용되지 않은 이름 양식입니다.")
				return false;
			}
			
			
			else if( $("#birth").val()=="") {
                alert("생일을 입력해주세요.");
                $("#birth").focus();
                return false;
			}
			
			else if(birthValidator($("#birth").val())==false) {
				alert("허용되지 않은 생년월일 양식입니다.")
				return false;
			}
			
			else if (!$("input:checked[id='gender']").is(":checked"))
			{ alert("성별을 입력해 주세요."); 
			  $("gender").focus(); return; }
			
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
                $("#sample6_address").focus();
                return false;
			}
			
			else if( $("#sample6_detailAddress").val()=="") {
                alert("상세 주소를 입력해주세요.");
                $("#sample6_detailAddress").focus();
                return false;
			}
			

			else if( $("#phn").val()=="") {
                alert("휴대폰 번호를 입력해주세요.");
                $("#phn").focus();
                return false;
			}
			
			else if(telValidator($("#phn").val())==false) {
				alert("허용되지 않은 휴대폰 번호 양식입니다. 예)010-xxxx-xxxx")
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
			
			
			else if(emailChkVal == "N")  {
				alert("이메일 중복확인을 해주세요!");
				return false;
			}
/* 			
			else if (!$("input:checked[id='size']").is(":checked"))
			{ alert("애견의 크기를 입력해 주세요."); 
			  $("size").focus(); return; }
			
			
			else if (!$("input:checked[id='fur']").is(":checked"))
			{ alert("애견의 털길이를 입력해 주세요"); 
			  $("fur").focus(); return; }

			else if (!$("input:checked[id='age']").is(":checked"))
			{ alert("애견의 나이를 입력해 주세요"); 
			  $("age").focus(); return; }

 */

			
				else if(idChkVal == "Y" && emailChkVal =="Y") 
			{	alert("가입완료.");
	        	console.log(document.regform);
	        	document.regform.submit(); 
			}
    	});

		function idchk(){
				$.ajax({
				url : "/idck",
				type : "post",
				dataType : "json",
				data : {"uid" : $("#uid").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					}else if(data == 0){
						$("#idck").attr("value", "Y");
						if( $("#uid").val()=="") {
			                alert("아이디를 입력해주세요.");
			                $("#uid").focus();
			                return false;
						}
						alert("사용 가능한 아이디입니다.");
						
					}
				}
			}) 
		}
		
		function emailchk(){
			$.ajax({
			url : "/emailck",
			type : "post",
			dataType : "json",
			data : {"email" : $("#email").val()},
			success : function(data){
				if(data == 1){
					alert("중복된 이메일입니다.");
				}else if(data == 0){
					$("#emailck").attr("value", "Y");
					if( $("#email").val()=="") {
		                alert("이메일을 입력해주세요.");
		                $("#email").focus();
		                return false;
					}
					alert("사용 가능한 이메일입니다.");
					
				}
			}
		}) 
	}
		
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

		    if (/^[0-9]{8,}$/.test(args)) {
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
			if(/^[ㄱ-ㅎ|가-힣|a-z|A-Z|]+$/.test(args)) {
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