<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/css/style_list.css"/>"></link>
<style>
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="../adminPage.jsp"/>
<div class="goods_list">
	<h2>상품 상세</h2>
		<table class="basic">
				<tr>
					<td id="title">상품코드</td><td class="contents">${pro.ino}</td>
				</tr><tr>	
					<td id="title">카테고리</td><td class="contents">${pro.cateid}</td>
				</tr><tr>	
					<td id="title">상품명</td><td class="contents">${pro.name}</td>
				</tr><tr>
					<td id="title">원가</td><td class="contents"><fmt:formatNumber type="number" maxFractionDigits="3" value="${pro.price}" /></td>
				</tr><tr>
					<td id="title">가격</td><td class="contents"><fmt:formatNumber type="number" maxFractionDigits="3" value="${pro.calprice}" /></td>
				</tr><tr>
					<td id="title">할인율</td><td class="contents">${pro.discount}</td>
				</tr><tr>
					<td id="title">원산지</td><td class="contents">${pro.origin}</td>
				</tr><tr>
					<td id="title">제조사</td><td class="contents">${pro.manufac}</td>
				</tr><tr>
					<td id="title">수량</td><td class="contents">${pro.quantity}</td>
				</tr><tr>
					<td id="title">메인이미지</td><td class="contents"><img src="<c:url value="/up/item/${pro.main_img }" />" alt="" width="300px"></td>
				</tr><tr>
					<td id="title">상세이미지</td><td class="contents"><img src="<c:url value="/up/item/${pro.detail_img }" />" alt="" ></td>
				</tr><tr>
					<td id="title">강아지사이즈</td><td id="size">${pro.size}</td>
				</tr><tr>
					<td id="title">강아지털길이</td><td id="fur">${pro.fur}</td>
				</tr><tr>
					<td id="title">강아지나이</td><td class="contents">${pro.age}</td>
				</tr><tr>
					<td id="title">등록날짜</td><td class="contents">${pro.regdate}</td>
				</tr>
		</table>
		
		<div class="orderlist">
			<a href="productlist">목록으로</a>	
		</div>
		<div class="orderlist">
			<a href="productdeleteReg?ino=${pro.ino }">삭제</a>	
		</div>
		<div class="orderlist">
			<a href="productmodifyForm?ino=${pro.ino}">수정</a>
		</div>
</div>
<jsp:include page="../footer.jsp"/>		
<script>
    $( document ).ready(function(){
        if($("#fur").text() == "l") {
            $("#fur").text("장모종");
        }
        if($("#fur").text() == "s") {
            $("#fur").text("단모종");
        }
        if($("#fatyn").text() == "y") {
            $("#fatyn").text("비만견");
        }
        if($("#fatyn").text() == "n") {
            $("#fatyn").text("일반견");
        }
        if($("#size").text() == "대") {
            $("#size").text("대형견");
        }
        if($("#size").text() == "중") {
            $("#size").text("중형견");
        }
        if($("#size").text() == "소") {
            $("#size").text("소형견");
    }
});
</script>
</body>
</html>