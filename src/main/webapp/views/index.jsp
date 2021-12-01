<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="css/style_header.css"></link>
<link rel="stylesheet" href="css/style_footer.css"></link>
<link rel="stylesheet" href="css/style_main.css"></link>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="content">
	<div class="" style="width: 1200px; margin: 0 auto;">
		<div class="new">
			<h2>신상품</h2>
			<ul class="itemList">
				<c:forEach items="${newList}" var="nl" varStatus="no" begin="0" end="2" step="1">
				    <li>
						<div class="thum">
							<a href="/item/${nl.ino }"><img src="<c:url value="up/item/${nl.main_img }"/>"alt="메인이미지"></a>
						</div>
						<div>
							<div class="itemName">
								<a href="/item/${nl.ino }">${nl.name }</a> 
							</div>
							<strong><fmt:formatNumber type="number" maxFractionDigits="3" value="${nl.calprice }" />원</strong> <c:if test="${nl.discount !=0}">${nl.discount }%</c:if> 
						</div> 
					</li>
				</c:forEach>
			</ul>
		</div>
		<div class="notice">
			<h2>공지사항</h2>
			
			<table>
					<tr>
						<th class="th123">번호</th>
						<th class="th123">제목</th>
						<th class="th123">작성일</th>
					</tr>		
			<c:forEach items="${board}" var="bbb" varStatus="no">
					<tr>
						<td>
							<span class="spc3">${no.index+1 } 번</span>			
						</td>
						<td>
							<span class="spc1"><a href="/board/detail?notno=${bbb.notno }" id="ahover">${bbb.title }</a></span>
						</td>
						<td>
							<span class="spc2">${bbb.regdate }</span>
						</td>			
					</tr>
			</c:forEach>		
				</table>			
				<br>
		</div>
	</div>
	
	<div class="recommend">
		<h2>추천상품</h2>
		<ul class="itemList">
			<c:forEach items="${recList}" var="rl" varStatus="no">
			    <li>
					<div class="thum">
						<a href="/item/${rl.ino }"><img src="<c:url value="up/item/${rl.main_img }"/>"alt="메인이미지"></a>
					</div>
					<div>
						<div class="itemName">
							<a href="/item/${rl.ino }">${rl.name }</a> 
						</div>
						<strong><fmt:formatNumber type="number" maxFractionDigits="3" value="${rl.calprice }" />원</strong> <c:if test="${rl.discount !=0}">${rl.discount }%</c:if> 
					</div> 
				</li>
			</c:forEach>
		</ul>
	</div>
	
	<div class="hot">
		<h2>인기상품</h2>
		<ul class="itemList">
			<c:forEach items="${sellcntList}" var="sl" varStatus="no" begin="0" end="9" step="1">
			    <li>
					<div class="thum">
						<a href="/item/${sl.ino }"><img src="<c:url value="up/item/${sl.main_img }"/>"alt="메인이미지"></a>
					</div>
					<div>
						<div class="itemLabel rank${no.index+1 }">${no.index+1 }위</div>
						<div class="itemName">
							<a href="/item/${sl.ino }">${sl.name }</a> 
						</div>
						<strong><fmt:formatNumber type="number" maxFractionDigits="3" value="${sl.calprice }" />원</strong> <c:if test="${sl.discount !=0}">${sl.discount }%</c:if> 
					</div> 
				</li>
			</c:forEach>
		</ul>
	</div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>