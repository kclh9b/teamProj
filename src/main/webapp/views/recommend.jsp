<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="css/style_recommend.css"></link>
<style>
</style>
</head>
<body>
<jsp:include page="header.jsp"/>
<jsp:include page="adminPage.jsp"/>
<div class="recWrapper">
	<h2 style="margin-bottom:60px;">추천상품 선정</h2>
	<form action="/recItemAction" name="recItemFrm">
			<c:forEach var="i" begin="0" end="4" step="1">
				<c:choose>
					<c:when test="${recList.get(i).ino!=null }">
						<div class="itemWrapper">상품 ${i +1 }
						<select class="inoSel" name="arr[${i }].ino">
							<option value="0">선택</option>
							<c:forEach items="${inos }" var="list" varStatus="no">
								<option value="${list.ino }" <c:if test="${list.ino.equals(recList.get(i).ino) }">selected</c:if>>${list.ino }</option>
							</c:forEach>
						</select>
						<ul class="itemList">
						    <li>
								<div class="thum">
									<a href="/item/${recList.get(i).ino }"><img src="<c:url value="up/item/${recList.get(i).main_img }"/>"alt="메인이미지"></a>
								</div>
								<div class="itemInfo">
									<div class="itemName">
										<a href="/item/${recList.get(i).ino }">${recList.get(i).name }</a> 
									</div>
									<strong><fmt:formatNumber type="number" maxFractionDigits="3" value="${recList.get(i).calprice }" />원</strong> <c:if test="${recList.get(i).discount !=0}">${recList.get(i).discount }%</c:if> 
								</div> 
							</li>
						</ul>
						<input type="hidden" name="arr[${i }].recno" value="${i +1}">
						</div>
					</c:when>
					<c:otherwise>
						<div class="itemWrapper">상품 ${i +1 }
							<input type="hidden" name="arr[${i }].recno" value="${i +1}">
							<select class="inoSel" name="arr[${i }].ino">
							<option value="0">선택</option>
							<c:forEach items="${inos }" var="list" varStatus="no">
								<option value="${list.ino }">${list.ino }</option>
							</c:forEach>
							</select>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		<div class="actionButtonBox">
			<input class="actionButton" type="button" value="등록" onclick="updateRecItem()">
		</div>
	</form>
</div>
<jsp:include page="footer.jsp"/>
<script>
	function updateRecItem() {
		var values = document.getElementsByTagName("select");
		var value = [5];
		for(var i=0; i<values.length; i++) {
			value[i] = values[i].value;
		}
		
		
		for(let i = 0; i < value.length; i++) {
			const currElem = value[i];
			  
			for(let j = i+1; j < value.length; j++) {
				if(currElem === value[j]) {
					if(value[j]=="0") {
						
					}else {
						alert("같은 상품이 중복되어 선택됐습니다").
						return;
					}
				}
			}
		}
		
		document.recItemFrm.submit();
		/*
		const set = new Set(value);
		
		if(value.length !== set.size) {
		  alert("중복된 상품을 선택하셨습니다.")
		  return;
		}*/
	}
</script>
</body>
</html>