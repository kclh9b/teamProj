<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반품신청</title>
<link rel="stylesheet" href="../css/style_header.css"></link>
<link rel="stylesheet" href="../css/style_footer.css"></link>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<h1>반품신청</h1>
	<form action="refundReg" class="refundForm">
		<input type="hidden" name="ino" value="${orderitem.ino }">
		<input type="hidden" name="oino" value="${orderitem.oino }">  
		<input type="hidden" name="itemstate" class="itemstate" value="${orderitem.itemstate }">
		<input type="hidden" name="calprice" value="${orderitem.calprice }">
		
	<div class="inputArea">
		<label for="name">상품명</label>
		<p>${orderitem.name }</p>
	</div>
	
	<div class="inputArea">
		<label for="name">상품코드</label>
		<input type="radio" name="ino" id="ino" value="${orderitem.ino }">${orderitem.ino }
	</div>
	
	<div class="inputArea">
		<label for="name">상품불량갯수</label>
		<select id="quantity" name="refundcnt">
			<c:forEach begin="0" end="${orderitem.quantity }" step="1" varStatus="no">
				<option value="${no.index }" <c:if test="${orderitem.quantity == no.index }">selected</c:if>>${no.index }</option>
			</c:forEach>
		</select>
	</div>
	
	<div class="inputArea">
		<label for="name">반품사유</label>
		<input type="radio" name="refund" id="refund1" value="y">고객변심
		<input type="radio" name="refund" id="refund2" value="n">상품불량
	</div>
	
	<div class="inputArea">
		<label for="name">환불금액</label>
		<input type="hidden" name="totalPrice" value="${orderitem.totalPrice }">
		<p><span id="totalPrice">${orderitem.totalPrice }</span></p>
	</div>
	
	<button type="button" class="submit">확인</button>
	<button type="button" class="back">취소</button>
		
	<script>
		/* $("select#quantity").change(function(){
		  	var quantity = ($("select#quantity option:selected").val());
		  	/* alert(quantity); */
		  	/* $(document).ready(function() {
		        $('#totalPrice').text(quantity*${orderitem.calprice});
		    });
		});  */
		
		$(".back").click(function (){
			history.back();
		});
		
		$(".submit").click(function (){
			if($("#refund1").is(":checked") == false && $("#refund2").is(":checked") == false) {
				alert("반품사유를 체크해주세요");	
				/* alert(("#quantity").val()); */
			}else {
				if($(".itemstate").val() == "반품신청") {
					alert("이미 반품신청되었습니다.")
				}else {
					$(".itemstate").val("반품신청");
					$(".refundForm").submit();									
				}
			}
		});
		
	</script>
		
	</form>
</body>
</html>