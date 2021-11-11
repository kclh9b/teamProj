<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style_header.css"></link>
<link rel="stylesheet" href="../css/style_footer.css"></link>
<link rel="stylesheet" href="../css/style_notice.css"></link>

</head>
<style>
</style>
<body>

<jsp:include page="../header.jsp"/>

	<h2 id="h2">FAQ</h2>		
	
		<table id="table">
		
		<tr>
			<td class="maintd">번호</td>
			<td class="maintd">제목</td>
			<td class="maintd">작성자</td>
			<td class="maintd">작성일</td>
		</tr>
		
		<c:forEach items="${mainData }" var="vo" varStatus="no">		
				
		<tr>
			<td class="subtd">${pageInfoCHS.start+no.index+1 }</td>
			<td class="subtd">	
			<div class="ovtd123">			
				<a href="faqDetail?faqno=${vo.faqno }" id="alink">
				${vo.title }							
				</a>
			</div>
			</td>
			<td class="subtd">관리자</td>
			<td class="subtd">${vo.regdate }</td>
		
		</tr>
			
		</c:forEach>	
		
		</table>
		
	<form action="">
		<div id="sch">
			제목 : <input class="listSchInput" type="text" name="sch"/>
			<input class="listSchButton" type="submit" value="검색"/>
		</div>
	</form>				
		
	<div id="ws">
	<c:choose>
		<c:when test="${uid!=null }">
			<c:if test="${uid=='admin'}">
				<a href="faqForm" id="wlink">글쓰기</a>
			</c:if>
		</c:when>			
	</c:choose>
	</div>	
	
	
	<div class="pagingNum">						
						
						<c:if test="${pageInfoCHS.startPage>1 }">
							<a href="?nowPage=${pageInfoCHS.startPage-1 }"> ← </a>
						</c:if>
						
						<c:forEach begin="${pageInfoCHS.startPage }" end="${pageInfoCHS.endPage}" var="i">
						<c:choose>
						
							<c:when test="${pageInfoCHS.nowPage==i }">
								[${i }]
							</c:when>
							
							<c:otherwise>
								 <a href="?sch=${param.sch }&nowPage=${i }">${i }</a>
							</c:otherwise>
							
						</c:choose>
						</c:forEach>
						
						<c:if test="${pageInfoCHS.endPage<pageInfoCHS.totalpage }">
							<a href="?nowPage=${pageInfoCHS.endPage+1 }"> → </a>	
						</c:if>
						
	</div>

<jsp:include page="../footer.jsp"/>

</body>
</html>