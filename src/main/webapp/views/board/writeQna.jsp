<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style_header.css"></link>
<link rel="stylesheet" href="../css/style_footer.css"></link>
<link rel="stylesheet" href="../css/style_write.css"></link>
</head>
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

<h2 id="h2">상품 문의 작성</h2>

<form action="writeQnaReg" method="POST" enctype="multipart/form-data" name="abc">
	<table id="table">	
		
		<tr>
			<td class="maintd">작성자</td>
			<td class="subtd"><input type=hidden name="uid" value="${uid }"/>${uid }</td>
		</tr>
				
		<tr>
			<td class="maintd">제목</td>
			<td class="subtd"><input type="text" name="title" value="" id="wtitle"></td>
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
				<input type="radio" id="radioino" name="ino" value="${vo.ino }" class="cateval">${vo.ino }
	<c:if test="${i%x == x-1 }">
	<br>
	</c:if>
	<c:set var="i" value="${i+1 }" />
			</c:forEach>
			
			</c:if> --%>
			
			</td>
		</tr>
		<tr>
			<td class="maintd">공개처리</td>
			<td class="subtd">
				<input type="radio" name="open" value="y" checked="checked">공개
				<input type="radio" name="open" value="n">비공개
			</td>
		</tr>	
		<tr>
			<td class="maintd">내용</td>
			<td class="subtd"><textarea name="content" cols="30" rows="10" id="wcontent"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<div id="btns">
				<input type="button" onclick="chkwrite()" class="writeButton" value="작성" />
				<input type="button" class="writeButton" onclick="history.back()" value="뒤로">
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
		
		if(abc.title.value=="" || abc.title.value==null || abc.title.value.replace(blank,'')=="") {
			alert("제목을 올바르게 입력해 주세요.");
			return false;
		}
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
			return false;
		} */
		
		form.submit();
		
	}
</script>

</html>