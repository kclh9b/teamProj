<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="<c:url value="/css/style_mycart.css"/>"></link>
</head>
<body>
<c:set var="totalPrice" value=""/>
<c:forEach items="${cl }" var="list">
	<c:set var="totalPrice" value="${totalPrice + list.totalPrice}"/>
</c:forEach>
<jsp:include page="header.jsp"/>
<div class="cartWrapper">
	<h2>장바구니</h2>
	<form name="cartfrm" action="/checkout">
		
		<table class="cartTable" >
			<colgroup>
				<col width="5%">
				<col width="5%">
				<col width="45%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
			</colgroup>
			<tr class="title">
				<td><input type="checkbox" id="checkall" onclick="checks(this,${totalPrice},1)" checked/>전체</td><td colspan="2">상품정보</td><td>판매가</td><td>수량</td><td>합계</td>
			</tr>
			<c:if test="${fn:length(cl)==0 }">
				<tr class="noItem">
					<td colspan="6">담긴 상품이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach items="${cl }" var="list" varStatus="no">
				<tr class="cartRow">
					<td class="textCenter"><input type="checkbox" name="arr[${no.index }].ino" id="check" value="${list.ino }" onclick="checks(this,${list.totalPrice })" checked/></td>
					<td><a href="/item/${list.ino }"><img src="<c:url value="/up/item/${list.main_img }"/>" width="60px" height="60px"></a></td>
					<td><a href="/item/${list.ino }">${list.name }</a></td>
					<td class="textCenter"><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.calprice }" />원</td>
					<td class="textCenter">
						<input class="addButton" type="button" value="-" onclick="otherSubmit(3, '${list.ino}', -1)">
						<span class="quantity" id="${list.ino}">${list.quantity }</span> 
						<input class="addButton" type="button" value="+" onclick="otherSubmit(3, '${list.ino}', 1)">
					</td>
					<td class="textCenter price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.totalPrice }" />원</td>
				</tr>
			</c:forEach>
		</table>
		<div class="resultBox">
			<table class="result">
				<colgroup><col width="120px;"><col width="30px;"><col width="100px;"><col width="30px;"><col width="120px;"></colgroup>
				<tr>
					<td>상품 합계금액</td><td></td><td>배송료</td><td></td><td>총 결제금액</td>
				</tr>
				<tr>
					<td id="itemPrice"></td><td>+</td><td id="delifee"></td><td>=</td><td id="endPrice"></td>
				</tr>
			</table>
		</div>
		<div class="cartButtonBox">
			<input class="action1" type="hidden" name="state" value="2">
			<input class="action1" type="button" value="선택 상품 삭제" onclick="otherSubmit(1)">
			<input class="action1" type="button" value="전체 상품 삭제" onclick="otherSubmit(2)">
			<button class="action1" type="button" onclick="location.href='<c:url value="/"/>'">쇼핑 계속하기</button>
			<input class="action2" type="button" value="구매하기" onclick="otherSubmit(0, '${black}')"> 
		</div>
	</form>
</div>
<jsp:include page="footer.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script>
function checks(checked, price, way) {
	var itemPrice = document.getElementById("itemPrice");
	var itemCalPrice = document.getElementById("itemPrice").innerHTML;
	var delifee = document.getElementById("delifee");
	var endPrice = document.getElementById("endPrice");
	
	var delifeeCal = 2500;
	var endCalPrcie = 0;
	strItemCalPrice = String(itemCalPrice).replace(/,/gi, "").replace("원","");
	if($(checked).prop("checked")){
		itemCalPrice = Number(strItemCalPrice) + price;
		if(way==1) {
			itemCalPrice = price;
		}
	}else{ 
		itemCalPrice = Number(strItemCalPrice) - price;
		if(way==1) {
			itemCalPrice = 0;
		}
	}
	if(itemCalPrice>=20000 || itemCalPrice==0) {
		delifeeCal = 0;
	}
	endCalPrice = itemCalPrice + delifeeCal;
	
	strItemCalPrice = String(itemCalPrice);
	strDelifeeCal = String(delifeeCal);
	strEndCalPrice = String(endCalPrice);
	
	itemPrice.innerHTML = strItemCalPrice.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원";
	delifee.innerHTML = strDelifeeCal.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원";
	endPrice.innerHTML = strEndCalPrice.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원";

}

function otherSubmit(index, ino, add) {
	var checkcnt = $("input:checkbox[id=check]").length;
	var checkedcnt = $("input:checkbox[id=check]:checked").length;
	//document.frm.setAttribute("method", "Post");
	var input1 = document.createElement("input");
	input1.type = "hidden"; 
	input1.name = "action";
	if(index==0) {
		if(ino=='y') {
			alert("블랙리스트 회원입니다.");
			return;
		}
		if(checkedcnt==0) {
			alert("상품을 1개 이상 선택해주세요");
			return;
		}
		document.cartfrm.action='/checkout';
	}
	if(index==1) {
		if(checkedcnt==0) {
			alert("상품을 1개 이상 선택해주세요");
			return;
		}
		input1.value = "1";
		if(confirm('선택한 상품을 삭제하시겠습니까?')){
			document.cartfrm.action='/updateCart';			
		}else {
			return;
		}
	}
	if(index==2) {
		input1.value = "2";
		if(checkcnt==0) {
			alert("장바구니가 비어있습니다.")
			return;
		}
		if(confirm('장바구니를 비우시겠습니까?')){
			document.cartfrm.action='/updateCart';			
		}else {
			return;
		}
	}
	if(index==3) {
		var quantity = document.getElementById(ino).innerHTML;
		if(quantity==1 && add==-1) {
			return;
		}
		input1.value = "3";
		
		var input2 = document.createElement("input");
		input2.name  = "ino"; 
		input2.type = "hidden";
		input2.value  = ino;
		document.cartfrm.appendChild(input2);
		
		var input3 = document.createElement("input");
		input3.name  = "add";
		input3.type = "hidden";
		input3.value  = add;
		document.cartfrm.appendChild(input3);
		
		document.cartfrm.action='/updateCart';
	}
	document.cartfrm.appendChild(input1);
	document.cartfrm.submit();
}

$(document).ready(function(){ 
	//최상단 체크박스 클릭 
	$("#checkall").click(function(){
		//클릭되었으면 
		if($("#checkall").prop("checked")){ 
			//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
			$("input[id='check']").prop("checked",true); 
			//클릭이 안되있으면 
		}else{ 
			//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의 
			$("input[id='check']").prop("checked",false); 
		} 
	})
	
	/* 금액 계산 */
	var itemPrice = document.getElementById("itemPrice");
	var delifee = document.getElementById("delifee");
	var endPrice = document.getElementById("endPrice");
	var prices = document.getElementsByClassName("price");
	var fixPrices = [prices.length];
	var itemCalPrice = 0;
	var delifeeCal = 2500;
	var endCalPrice = 0;
	for(var i=0; i<prices.length; i++) {
		fixPrices[i] = Number(prices[i].innerHTML.replace(/,/gi, "").replace("원",""));
		itemCalPrice += fixPrices[i];
	}
	if(itemCalPrice>=20000 || itemCalPrice==0){
		delifeeCal=0;
	}
	endCalPrice = itemCalPrice + delifeeCal;
	var strItemCalPrice = String(itemCalPrice);
	var strDelifeeCal = String(delifeeCal);
	var strEndCalPrice = String(endCalPrice);
	itemPrice.innerHTML = strItemCalPrice.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원";
	delifee.innerHTML = strDelifeeCal.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원";
	endPrice.innerHTML = strEndCalPrice.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원";
	
})



/*
$(document).ready(function() {
	$("#checkBoxId").change(function(){
        if($("#checkBoxId").is(":checked")){
            alert("체크박스 체크했음!");
            var tr = event.target.parentNode.parentNode.nextSibling;
        }else{
            alert("체크박스 체크 해제!");
        }
    });
})
*/
/*
function check(event) {
	if(event.target.nextSibling.nextSibling.checked==true) {
		event.target.nextSibling.nextSibling.checked=false;
		event.target.nextSibling.nextSibling.nextSibling.nextSibling.checked=false;
		event.target.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.checked=false;
	}else {
		event.target.nextSibling.nextSibling.checked=true;		
		event.target.nextSibling.nextSibling.nextSibling.nextSibling.checked=true;
		event.target.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.checked=true;
	}
}
*/
</script>
</body>
</html>