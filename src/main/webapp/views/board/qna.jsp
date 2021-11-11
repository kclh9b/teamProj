<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<link rel="stylesheet" href="../css/style_header.css"></link>
<link rel="stylesheet" href="../css/style_footer.css"></link>
<link rel="stylesheet" href="../css/style_notice.css"></link>
<body>

	<jsp:include page="../header.jsp"/>

	<h2 id="h2">상품 문의</h2>
	
	<table id="table">		
	
		<tr>
			<td class="maintd">번호</td>
			<td class="maintd">문의 제목</td>
			<td class="maintd">작성자</td>
			<td class="maintd">상품코드</td>
			<td class="maintd">작성일</td>
			<td class="maintd">비밀글 여부</td>
		</tr>
	<c:forEach items="${mainData }" var="vo" varStatus="no">	
		<tr>
			<%-- <td class="subtd">${no.index +1}</td> --%>
			<td class="subtd">${pageInfoCHS.start+no.index+1 }</td>
			
			<c:choose>	
					
				<c:when test="${uid!=null }">
					<c:if test="${vo.open=='n' }">						
						<c:if test="${uid!=vo.uid && uid!='admin'}">
							<td class="subtd">
							<div class="ovtd">
							${vo.title }
							</div>
							</td>
						</c:if>
						
						<c:if test="${uid==vo.uid || uid=='admin' }">
							<td class="subtd">
							<div class="ovtd">
							<a href="qnaDet?qnano=${vo.qnano }" id="alink">${vo.title }</a>
							</div>
							</td>							
						</c:if>						
					</c:if>
					
					<c:if test="${vo.open=='y' }">
						<td class="subtd">
						<div class="ovtd">
						<a href="qnaDet?qnano=${vo.qnano }" id="alink">${vo.title }</a>
						</div>
						</td>
					</c:if>							
				</c:when>		
					
				<c:when test="${uid==null }">
					<c:if test="${vo.open=='y' }">					
						<td class="subtd">
						<div class="ovtd">
						<a href="qnaDet?qnano=${vo.qnano }" id="alink">${vo.title }</a>
						</div>
						</td>
					</c:if>
					
					<c:if test="${vo.open=='n' }">
						<td class="subtd">
						<div class="ovtd">
						${vo.title }
						</div>
						</td>
					</c:if>
				</c:when>			
						
			</c:choose>
			
			
			
			<td class="subtd">${vo.uid }</td>
			<td class="subtd">${vo.ino }</td>
			<td class="subtd">${vo.regdate }</td>
			<td class="subtd">
				<c:if test="${vo.open.equals('y') }">
					공개글
				</c:if>
				<c:if test="${vo.open.equals('n') }">
					비밀글
				</c:if>				
			</td>
		</tr>
	</c:forEach>						
		
	</table>	
	
		<form action="">
			<div id="sch">
			제목 : <input class="listSchInput" type="text" name="sch"/>
			<input class="listSchButton" type="submit" value="검색"/>
			
			<!-- 작성자 : <input type="text" name="schid"/>
			<input type="submit" value="검색"/> -->
			</div>
		</form>
		
		<div id="ws">
		<c:choose>
			<c:when test="${uid!=null }">					
					<!-- <a href="writeQna" id="wlink">문의</a> -->
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