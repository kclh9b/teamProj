<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="css/style_itemList.css"></link>
<link rel="stylesheet" href="css/style_itemListCate.css"></link>
<link rel="stylesheet" href="css/style_footer.css"></link>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="itemWrapper">
	<form action="" name="detailFrm">
		<input type="hidden" name="custom" value="${custom }">
		<c:choose>
			<c:when test="${onNav.equals('n') }">
				<div class="schBox">
					<c:if test="${custom.equals('y') }">
						<jsp:include page="sub_custom.jsp"/>
					</c:if>
					<jsp:include page="sub_search.jsp"/>
				</div>
			</c:when>
			<c:otherwise>
				<jsp:include page="${url2 }"/>
			</c:otherwise>
		</c:choose>
	</form>
	<div class="itemCntOrderBox">
		<span class="itemCnt">총 ${pageInfo.total }개 상품</span>
		<span class="orderButton">
			<input class="<c:if test="${schCondition.order.equals('new') || schCondition.order==null}">active</c:if>" type="button" value="신상품" onclick="order('new')">
			<input class="<c:if test="${schCondition.order.equals('sellcnt') }">active</c:if>" type="button" value="판매량" onclick="order('sellcnt')">
			<input class="<c:if test="${schCondition.order.equals('high') }">active</c:if>" type="button" value="높은가격" onclick="order('high')">
			<input class="<c:if test="${schCondition.order.equals('row') }">active</c:if>" type="button" value="낮은가격" onclick="order('row')">
		</span>
	</div>
	<ul class="itemList">
	<c:forEach items="${itemList }" var="il" varStatus="no">
		<li>
			<div class="thum">
				<a href="/item/${il.ino }"><img src="<c:url value="up/item/${il.main_img }"/>"alt="메인이미지"></a>
			</div>
			<div>
				<div class="itemName">
					<a href="/item/${il.ino }">${il.name }</a> 
				</div>
				<strong><fmt:formatNumber type="number" maxFractionDigits="3" value="${il.calprice }" />원</strong> <c:if test="${il.discount !=0}">${il.discount }%</c:if> 
			</div> 
		</li>
	</c:forEach>
	</ul>
	
	<div class="pageBox">
		<c:if test="${pageInfo.totalPage!=0 }">
			<c:if test="${pageInfo.startPage>1  }">
				<input type="button" value="<" onclick="goPage(${pageInfo.startPage-1})">
			</c:if>
			<c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1">
				<input class="pageButton <c:if test="${i==pageInfo.page }">active</c:if><c:if test="${i==1 &&pageInfo.page==null}">active</c:if>" type="button" value="${i }" onclick="goPage(${i})">
			</c:forEach>
			<c:if test="${pageInfo.endPage<pageInfo.totalPage  }">
				<input type="button" value=">" onclick="goPage(${pageInfo.endPage+1})">
			</c:if>
		</c:if>
	</div>
</div>
<jsp:include page="../footer.jsp"/>
</body>
<script>

//cate, schKind, keyword, min, max, order
	function sch(url) {
		var frm = document.getElementsByTagName("form");
		var select = document.getElementsByTagName("select");
		var input = document.getElementsByTagName("input");
		url = url + "cate="+select[0].value;
		
		if(input[0].value!="") {
			url = url+"&schKind="+select[1].value+"&keyword="+input[0].value;
		}
		if(input[1].value!="") {
			url = url+"&min="+input[1].value;
		}
		if(input[2].value!="") {
			url = url+"&max="+input[2].value;	
		}
		location.href = url;
		
	}
	
	function order(order) {
		
		var url =  decodeURI(window.location.search);
		if(url.indexOf("order")!=-1){
			if(url.indexOf("new")!=-1) {
				url = url.replace("new", order);
			}else if(url.indexOf("sellcnt")!=-1) {
				url = url.replace("sellcnt", order);
			}else if(url.indexOf("high")!=-1){
				url = url.replace("high", order);
			}else if(url.indexOf("row")!=-1){
				url = url.replace("row", order);
			}
		}else {
			if(url!="") {
				url = url + "&order="+order
			}else {
				url = url + "?order="+order
			}
		}
		location.href = url;
	}
	
	
	function goPage(pageNum) {
		var url =  decodeURI(window.location.search);
		if(url.indexOf("page")==-1) {
			url = url + "&page="+pageNum
		}else {
			var pageIndex = url.indexOf("page")-1;
			var lastParaIndex = url.lastIndexOf("&");
			if(pageIndex==lastParaIndex) {
				url = url.slice(0,pageIndex)+"&page="+pageNum;
			}else {
				url = url.slice(0,pageIndex)+"&page="+pageNum + url.slice(lastParaIndex)
			}
		}
		location.href = url;
	}
	
	function goDetailSearch() {
		var keyword = document.getElementById("detailKeyword").value;
		var min = document.getElementById("min").value;
		var max = document.getElementById("max").value;
		var num_check=/^[0-9]*$/;
		if(document.getElementById("weight")!= null) {
			var weight = document.getElementById("weight").value;			
			if(weight!="") {
				if(num_check.test(weight)){
					if( weight.length < 1 || weight.length > 2 ){
					alert("1~2글자만 입력할수 있습니다.");
					detailFrm.weight.value="";
					detailFrm.weight.focus();
					return false;
					}
				}else {
					alert ( "숫자만 입력할 수 있습니다." );
					detailFrm.weight.value=""
					detailFrm.weight.focus();
					
					return;
				}
			}
		}

		if(min!="") {
			if(num_check.test(min)){
			}else {
				alert ( "숫자만 입력할 수 있습니다." );
				detailFrm.min.value=""
				detailFrm.min.focus();
				return;
			}
		}
		if(max!="") {
			if(num_check.test(max)){
			}else {
				alert ( "숫자만 입력할 수 있습니다." );
				detailFrm.max.value=""
				detailFrm.max.focus();
				return;
			}
		}
		document.detailFrm.submit();
	}
</script>
</html>