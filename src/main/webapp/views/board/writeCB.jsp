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
<h2 id="h2">자유게시판 글쓰기</h2>

<form action="writeCBreg" method="POST" enctype="multipart/form-data" name="abc">
	<table id="table">
		<tr>
			<td class="maintd">제목</td>
			<td class="subtd"><input type="text" name="title" id="wtitle"/></td>
		</tr>
		<tr>
			<td class="maintd">작성자</td>
			<td class="subtd"><input type=hidden name="uid" value="<%= abc %>" id="wtitle"/><%= abc %></td>
		</tr>
		<tr>
			<td class="maintd">내용</td>
			<td class="subtd"><textarea name="content" cols="30" rows="10" id="wcontent"></textarea></td>
		</tr>
		<tr>
			<td class="maintd">첨부파일</td>
			<td class="subtd"><input type="file" name="file1" />
			<input type="file" name="file2" />
			<input type="file" name="file3" /></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<div id="btns">
				<input class="writeButton" type="button" onclick="chkwrite()" value="작성" />
				<input class="writeButton" type="button" onclick="location.href='cblist'" value="뒤로" />
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