<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="<c:url value="/css/style_checkout.css"/>"></link>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="checkoutWrapper">
	<h2>결제</h2>
	<form action="/checkoutAction" method="post" name="checkoutFrm">
		<table class="itemTable" >
			<colgroup>
				<col width="2%">
				<col width="5%">
				<col width="45%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
			</colgroup>
			<tr class="title">
				<td colspan="3">상품정보</td><td>판매가</td><td>수량</td><td>합계</td>
			</tr>
			<c:forEach items="${list }" var="list" varStatus="no">
				<tr class="itemRow">
					<td></td>
					<td><a href="/item/${list.ino }"><img src="<c:url value="/up/item/${list.main_img }"/>" width="60px" height="60px"></a></td>
					<td><a href="/item/${list.ino }">${list.name }</a></td>
					<td class="textCenter"><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.calprice }" />원</td>
					<td class="textCenter">${list.quantity }</td>
					<td class="textCenter price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.totalPrice }" />원</td>
				</tr>
				<input type="hidden" name="arr[${no.index }].ino" value="${list.ino }">
				<input type="hidden" name="arr[${no.index }].name" value="${item.name }">
				<input type="hidden" name="arr[${no.index }].quantity" value="${list.quantity }">
				<input type="hidden" name="arr[${no.index }].main_img" value="${item.main_img }">
				<input type="hidden" name="arr[${no.index }].calprice" value="${item.calprice }">
				<input type="hidden" name="arr[${no.index }].total" value="${list.totalPrice }">
			</c:forEach>
		</table>
		<div class="resultBox">
			<table class="result">
				<colgroup><col width="120px;"><col width="30px;"><col width="100px;"><col width="30px;"><col width="120px;"></colgroup>
				<tr>
					<td>상품 합계금액</td><td></td><td>배송료</td><td></td><td>총 결제금액</td>
				</tr>
				<tr>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${allPrice }" />원</td>
					<td>+</td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${delifee }" />원</td>
						
					<td>=</td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${endPrice }" />원</td>
				</tr>
			</table>
			<input type="hidden" name="price" value="${endPrice }">
			<input type="hidden" name="delifee" value="${delifee }">
			<input type="hidden" name="state" value="${param.state }">
			<input type="hidden" name="uid" value="${mv.uid }">
		</div>
		<table class="infoTable">
			<colgroup>
				<col width="160px">
				<col>
			</colgroup>
			<tr>
				<td class="infoTitle">수령인</td><td class="infoContent"><input type="text" id="reciever" name="reciever" value="${mv.name }" size="8" placeholder="수령인 입력"></td>
			</tr>
			<tr>
				<td class="infoTitle">전화번호</td><td class="infoContent"><input type="text" id="phn" name="phn" value="${mv.phn }" size="12" placeholder="전화번호 입력"></td>
			</tr>
			<tr>
				<td class="infoTitle">우편번호</td>
				<td class="infoContent"><input type="text" id="zipcode" value="${mv.zipcode }" size="12" placeholder="우편번호 입력">
					&nbsp;<button type="button" id="zipsearch" class="btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">우편번호 찾기</button> 
				</td>
			</tr>
			<tr>
				<td class="infoTitle">주소</td><td class="infoContent"><input type="text" id="address1" name="address1" value="${mv.address1 }" size="30" placeholder="주소를 입력해주세요"></td>
			</tr>
			<tr>
				<td class="infoTitle">상세주소</td><td class="infoContent"><input type="text" id="address2" name="address2" value="${mv.address2 }" size="30" placeholder="상세주소를 입력해주세요"></td>
			</tr>
			<tr>
				<td class="infoTitle">요청사항</td><td class="infoContent"><input type="text" id="etc" name="etc" value="" size="30" placeholder="요청사항을 입력해주세요"></td>
			</tr>
			<tr>
				<td class="infoTitle">결제수단</td>
				<td class="infoContent">
					<input class="payway" type="radio" name="payway" value="신용카드" checked> 신용카드
				</td>
			</tr>
			<!-- 
			<tr>
				<td class="infoTitle">카드번호</td>
				<td class="infoContent">
					<input type="text" id="card1" size="3"> -
					<input type="text" id="card2" size="3"> -
					<input type="text" id="card3" size="3"> -
					<input type="text" id="card4" size="3">
				</td>
			</tr>
			 -->
			<input type="hidden" name="name" value="${mv.name }">
		</table>
		<input class="actionButton" type="button" value="결제" onclick="sbm()">
	</form>
</div>
<jsp:include page="footer.jsp"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.2.min.js" type="application/javascript"></script>
<script>

</script>
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
	                document.getElementById('zipcode').value = data.zonecode;
	                document.getElementById("address1").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("address2").value = "";
	                document.getElementById("address2").focus();
	            }
	        }).open();
	    }
	    
</script>
<script>
	function sbm() {
		var reciever = document.getElementById("reciever").value;
		var phn = document.getElementById("phn").value;
		var zipcode = document.getElementById("zipcode").value;
		var address1 = document.getElementById("address1").value;
		var address2 = document.getElementById("address2").value;
		var etc = document.getElementById("etc").value;
		
		var kor_check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|a-zA-Z]/; // 한글체크
		var phn_check = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/;
		var num_check=/^[0-9]*$/;
		
		if(reciever=='') {
			alert("수령인을 입력해주세요");
			return;
		}else if(!kor_check.test(reciever)) {
			alert("수령인은 한글 혹은 영어만 입력 가능합니다");
			return;
		}
		
		if(phn=='') {
			alert("전화번호를 입력해주세요 예) 010-1111-2222");
			return;
		}else if(!(phn_check.test(phn))) { //https://ju-note.tistory.com/19
			alert("전화번호를 확인해주세요 예) 010-1111-2222");
			return;
		}
		
		if(zipcode=='') {
			alert("우편번호 입력해주세요");
			return;
		}else if (!num_check.test(zipcode)) {
			alert("우편번호에 숫자만 입력하실 수 있습니다");
			return;
		}else if (zipcode.length != 5) {
			alert("우편번호 5자리를 확인해주세요");
			return;
		}
		
		if(address1=='') {
			alert("주소를 입력해주세요");
			return;
		}
		if(address2=='') {
			alert("상세주소를 입력해주세요");
			return;
		}

		/*
		var cardNum1 = document.getElementById("card1").value;
		var cardNum2 = document.getElementById("card2").value;
		var cardNum3 = document.getElementById("card3").value;
		var cardNum4 = document.getElementById("card4").value;
		
		var quantity = document.getElementById("quanValue");
		if(num_check.test(cardNum1) && num_check.test(cardNum2) && num_check.test(cardNum3) && num_check.test(cardNum4)){
			
		}else {
			alert ( "카드번호를 확인해주세요 - 숫자 16자리" );
			return;
		}
		
		if(cardNum1 == '' || cardNum1.length<4 || cardNum1.length>=5 || 
				cardNum2 == '' || cardNum2.length<4 || cardNum2.length>=5 || 
				cardNum3 == '' || cardNum3.length<4 || cardNum3.length>=5 || 
				cardNum4 == '' || cardNum4.length<4 || cardNum4.length>=5) {
			alert("카드번호를 확인해주세요 - 숫자 16자리");
			return;
		}
		
		var cardNum = cardNum1 + " " + cardNum2 + " " + cardNum3 + " " + cardNum4;
		var input = document.createElement("input");
		input.type = "hidden"; 
		input.name = "cardNum";
		input.value = cardNum;
		document.checkoutFrm.appendChild(input);
		*/
		if(confirm("결제하시겠습니까?")) {
			
			BootPay.request({
				price: ${endPrice}, //실제 결제되는 가격
				application_id: "6102e94f7b5ba400217bdd10",
				name: '${list.get(0).name}', //결제창에서 보여질 이름
				pg: 'kcp',
				method: 'card', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
				show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
				items: [
					{
						
						item_name: '나는 아이템', //상품명
						qty: 1, //수량
						unique: '123', //해당 상품을 구분짓는 primary key
						price: 1000, //상품 단가
						cat1: 'TOP', // 대표 상품의 카테고리 상, 50글자 이내
						cat2: '티셔츠', // 대표 상품의 카테고리 중, 50글자 이내
						cat3: '라운드 티', // 대표상품의 카테고리 하, 50글자 이내
						
					}
				],
				user_info: {
					username: '사용자 이름',
					email: '사용자 이메일',
					addr: '사용자 주소',
					phone: '010-1234-4567'
				},
				order_id: '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
				params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
				account_expire_at: '2020-10-25', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
				extra: {
				    start_at: '2019-05-10', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
					end_at: '2022-05-10', // 정기결제 만료일 -  기간 없음 - 무제한
			        vbank_result: 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
			        quota: '0,2,3', // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용,
					theme: 'purple', // [ red, purple(기본), custom ]
					custom_background: '#00a086', // [ theme가 custom 일 때 background 색상 지정 가능 ]
					custom_font_color: '#ffffff' // [ theme가 custom 일 때 font color 색상 지정 가능 ]
				}
			}).error(function (data) {
				//결제 진행시 에러가 발생하면 수행됩니다.
				console.log(data);
			}).cancel(function (data) {
				//결제가 취소되면 수행됩니다.
				console.log(data);
			}).ready(function (data) {
				// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
				console.log(data);
			}).confirm(function (data) {
				//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
				//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
				console.log(data);
				var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
				if (enable) {
					BootPay.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
				} else {
					BootPay.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
				}
			}).close(function (data) {
			    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
			    console.log(data);
			}).done(function (data) {
				//결제가 정상적으로 완료되면 수행됩니다
				//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
				console.log(data);
				var input = document.createElement("input");
				input.type = "hidden"; 
				input.name = "cardNum";
				input.value = data.card_no;
				document.checkoutFrm.appendChild(input);
				document.checkoutFrm.submit();
			});
			/*
			var input = document.createElement("input");
			input.type = "hidden"; 
			input.name = "cardNum";
			input.value = "카드번호";
			document.checkoutFrm.appendChild(input);
			document.checkoutFrm.submit();
			*/
		}
		
	}
</script>
</body>
</html>