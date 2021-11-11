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
<link rel="stylesheet" href="../css/style_detail.css"></link>
<link rel="stylesheet" href="../css/style_123.css"></link>

<body>

<jsp:include page="../header.jsp"/>

<%	
	String abc = (String)session.getAttribute("uid");

	String black = (String)session.getAttribute("black");
%>

	<h2 id="h2">문의 사항 페이지</h2>
	
	<table id="table">
	
		<tr>
			<td class="maintd">문의번호</td> <td class="subtd">${mainData.qnano }</td>
		</tr>
		
		<tr>
			<td class="maintd">상품번호</td> <td class="subtd">${mainData.ino }</td>
		</tr>
		
		<tr>
			<td class="maintd">작성자</td> <td class="subtd">${mainData.uid }</td>
		</tr>
		
		<tr>
			<td class="maintd">제목</td> <td class="subtd">${mainData.title }</td>
		</tr>
		
		<tr>
			<td class="maintd">내용</td> <td class="subtd">${mainData.content }</td>
		</tr>
		
		<tr>	
			<td class="maintd">작성일</td> <td class="subtd">${mainData.regdate }</td>
		</tr>		
		
	</table>	
	
	<div id="btns">	
	<input class="detailToList" type="button" onclick="location.href='qna'" value="목록으로" />
	<c:choose>
		<c:when test="${uid!=null }">
			<c:if test="${uid=='admin'}">
				
			</c:if>
			<c:if test="${uid==mainData.uid || uid=='admin' }">
				<%-- <input type="button" onclick="location.href='qnaModi?qnano=${mainData.qnano }'" value="수정" /> --%>
				<input type="button" class="detailToList" onclick="del()" value="삭제">
			</c:if>
		</c:when>			
	</c:choose>
	</div>
	
	<c:if test="${uid!=null && uid=='admin'}">	
	
	<form action="commentReg">
	
	<table id="table1">
		
		<tr>
			<td class="maintd">상품후기번호</td>
			<td class="maintd">작성자</td>			
		</tr>
		
		<tr>
			<td><input type="hidden" name="qnano" value="${mainData.qnano }">${mainData.qnano }</td>
				
			<td><input type="hidden" name="uid" value="${uid }">${uid }</td>
		</tr>
		<tr>
			<td colspan="3"><textarea name="content" cols="30" rows="10" id="wr"></textarea></td>
		</tr>	
			
		<tr>
			<td colspan="5" align="right">
			<div id="wb">
			<input type="submit" class="writeButton" value="작성">
			</div>
		</tr>
		
	</table>	

	</form>
	
	</c:if>
	
		<h4 class="h4">코멘트</h4>
	
	<jsp:include page="qnaDet123.jsp"/>
	
	<jsp:include page="../footer.jsp"/>	
	
</body>
<script>
	function del() {
		 if (confirm("삭제하시겠습니까 ?")) {
		        // (예) 버튼 클릭 시 이벤트
			 location.href="qnaDel?qnano=${mainData.qnano }"
		    } else {
		        // (아니오) 버튼 클릭 시 이벤트
		      return;
		    }		
	}
</script>
</html>