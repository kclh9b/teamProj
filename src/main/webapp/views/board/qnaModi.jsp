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
<link rel="stylesheet" href="../css/style_modi.css"></link>
<body>

<jsp:include page="../header.jsp"/>

<h2 id="h2">상품문의 수정</h2>

<%	
	String abc = (String)session.getAttribute("uid");
	String rst = null;
	if(abc==rst) {
		out.println("<script>alert('로그인 하세요');</script>");
		out.println("<script>location.href='/'</script>");
	}
%>

<form action="qnaModiReg">
	<input type="hidden" name="qnano" value="${mainData.qnano }"/>
	<table id="table">
	
		<tr>
			<td class="maintd">작성자</td>	
			<td class="subtd"><input type="hidden" name="uid" value="${mainData.uid }">${mainData.uid }</td>	
		</tr>
					
		<tr>
			<td class="maintd">상품코드</td>
			<td class="subtd">
	<c:set var="i" value="0" />
	<c:set var="x" value="7" />
				<c:forEach items="${item }" var="vo" varStatus="no">	
					<input type="radio" name="ino" value="${vo.ino }" class="cateval">${vo.ino }
	<c:if test="${i%x == x-1 }">
	<br>
	</c:if>
	<c:set var="i" value="${i+1 }" />
				</c:forEach>
			</td>
		</tr>			
			
		<tr>
			<td class="maintd">제목</td>
			<td class="subtd"><input type="text" name="title" value="${mainData.title }" id="wtitle"></td>
		</tr>
		
		<tr>
			<td class="maintd">내용</td>
			<td class="subtd"><textarea name="content" cols="30" rows="10" id="wcontent">${mainData.content }</textarea></td>
		</tr>		
		
		<tr>
			<td colspan="2" align="center">
			<div id="btns">
				<input type="submit" value="작성" />
				<a href="qnaDet?qnano=${mainData.qnano }">뒤로</a>
			</div>	
			</td>
		</tr>
	</table>
</form>

<jsp:include page="../footer.jsp"/>

</body>
</html>