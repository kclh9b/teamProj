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
<link rel="stylesheet" href="../css/style_write.css"></link>
<body>

<jsp:include page="../header.jsp"/>

<%	
	String abc = (String)session.getAttribute("uid");	
	String black = (String)session.getAttribute("black");
	String rst = null;
	
	if(abc==rst) {
		out.println("<script>alert('로그인 하세요');</script>");
		out.println("<script>location.href='/'</script>");
	}
	
	if(black==rst) {
	} else if(black.equals("y")) {
		out.println("<script>alert('블랙리스트는 작성할수 없습니다');</script>");
		out.println("<script>location.href='/'</script>");
	}		
	
%>

<h2 id="h2">상품 후기 작성</h2>

<form action="writeRevReg" method="POST" enctype="multipart/form-data" name="abc">
	<table id="table">		
		
		<tr>
			<td class="maintd">작성자</td>	
			<td class="subtd"><input type="hidden" name="uid" value="${uid }">${uid }</td>	
		</tr>
		
		<tr>
			<td class="maintd">상품코드</td>
			<td class="subtd">
			
			<c:if test="${param.ino!= null}">			
			
	<c:set var="i" value="0" />
	<c:set var="x" value="10000" />
				<c:forEach items="${mainData }" var="vo" varStatus="no">
				<c:if test="${param.ino==vo.ino}">	
					<input type="radio" name="ino" value="${vo.ino }" class="cateval" checked="checked">${vo.ino }
				</c:if>
	<c:if test="${i%x == x-1 }">
	<br>
	</c:if>
	<c:set var="i" value="${i+1 }" />
				</c:forEach>
			
			</c:if>
			
			<%-- <c:if test="${param.ino == null}">	
				
	<c:set var="i" value="0" />
	<c:set var="x" value="7" />
				<c:forEach items="${mainData }" var="vo" varStatus="no">	
					<input type="radio" name="ino" value="${vo.ino }" class="cateval">${vo.ino }
	<c:if test="${i%x == x-1 }">
	<br>
	</c:if>
	<c:set var="i" value="${i+1 }" />
				</c:forEach>
				
			</c:if> --%>
			
			
			</td>
		</tr>
	
		<tr>
			<td class="maintd">후기</td>
			<td class="subtd"><textarea name="content" cols="30" rows="10" id="wcontent"></textarea></td>
		</tr>
		<tr>
			<td class="maintd">첨부파일</td>
			<td class="subtd"><input type="file" name="file_1" /></td>
		</tr>
		<tr>
			<td class="maintd">첨부파일</td>
			<td class="subtd"><input type="file" name="file_2" /></td>
		</tr>
		<tr>
			<td class="maintd">첨부파일</td>
			<td class="subtd"><input type="file" name="file_3" /></td>
		</tr>
		<tr>
			<td class="maintd">별점</td>
			<td class="subtd">
				<input type="radio" name="score" value="1" class="cateval"> 1
				<input type="radio" name="score" value="2" class="cateval"> 2
				<input type="radio" name="score" value="3" class="cateval"> 3
				<input type="radio" name="score" value="4" class="cateval"> 4
				<input type="radio" name="score" value="5" checked="checked" class="cateval"> 5
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<div id="btns">
				<input type="button" class="writeButton" onclick="chkwrite()" value="작성" />
				<input type="button" class="writeButton" onclick="history.back()" value="뒤로" />
			</div>
			</td>
		</tr>
	</table>
	
	<input type="hidden" value="${param.ino}" name="ino">
	
</form>

<jsp:include page="../footer.jsp"/>

</body>

<script>
	function chkwrite() {
		
		var form = document.abc;
		var blank = /^\s+|\s+$/g;
		
		var frm = document.all;
		var chk = document.all.ino.length;
		var chk_i = 0;		
		
		if(abc.content.value.length==0) {
			alert("내용을 입력해 주세요.");
			return false;
		}
		/* for(var i=0; i<chk; i++) {
			if(frm.ino[i].checked==true) {
				chk_i ++;
				break;
			}
		}
		if(chk_i<=0) {
			alert("상품번호를 선택해 주세요.");
			return;
		} */
		
		form.submit();
		
	}
</script>

</html>