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
	String rst = null;
	if(abc==rst) {
		out.println("<script>alert('로그인 하세요');</script>");
		out.println("<script>location.href='/'</script>");
	} else if(!abc.equals("admin")) {
		out.println("<script>alert('관리자가 아닙니다');</script>");
		out.println("<script>location.href='/'</script>");
	}
%>

<h2 id="h2">공지사항 글쓰기</h2>

<form action="writeReg" method="POST" enctype="multipart/form-data" name="abc">
	<table id="table">
		<tr>
			<td class="maintd">제목</td>
			<td class="subtd"><input type="text" name="title" id="wtitle"/></td>
		</tr>
		<tr>
			<td class="maintd">카테고리</td>
			<td class="subtd"><input type="radio" name="category" value="dog" class="cateval"/>강아지
				<input type="radio" name="category" value="purchase" class="cateval"/>결제
				<input type="radio" name="category" value="send" class="cateval"/>배송
				<input type="radio" name="category" value="repurchase" class="cateval"/>환불
				<input type="radio" name="category" value="notice" checked="checked" class="cateval"/>공지
			</td>
		</tr>
		<tr>
			<td class="maintd">내용</td>
			<td class="subtd"><textarea name="content" cols="30" rows="10" id="wcontent"></textarea></td>
		</tr>
		<tr>
			<td class="maintd">첨부파일</td>
			<td class="subtd"><input type="file" name="file1" /></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<div id="btns">
					<input type="button" class="writeButton" onclick="chkwrite()" value="작성" />
					<input type="button" class="writeButton" onclick="location.href='list'" value="뒤로" />
				</div>
			</td>
		</tr>
	</table>
</form>

<jsp:include page="../footer.jsp"/>

</body>
<script>

	function chkwrite() {
		
		var form = document.abc;
		var blank = /^\s+|\s+$/g;
		
		if(abc.title.value=="" || abc.title.value==null || abc.title.value.replace(blank,'')=="") {
			alert("제목을 올바르게 입력해 주세요.");
			return false;
		}
		if(abc.content.value.length==0) {
			alert("내용을 입력해 주세요.");
			return false;
		}
		
		form.submit();
		
	}
</script>

</html>