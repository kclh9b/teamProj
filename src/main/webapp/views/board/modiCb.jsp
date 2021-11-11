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

<h2 id="h2">글수정</h2>


<%	
	String abc = (String)session.getAttribute("uid");
	String rst = null;
	if(abc==rst) {
		out.println("<script>alert('로그인 하세요');</script>");
		out.println("<script>location.href='/'</script>");
	} 
	
%>

	<c:if test="${!mainData.uid.equals(uid) && uid!='admin'}">
		<script>
			alert("남의 글은 수정할수 없습니다.");
			location.href="/"
		</script>
	</c:if>

<form action="modiCBreg" name="abc">
	<input type="hidden" name="comuno" value="${mainData.comuno }"/>
	<table id="table">		
		<tr>
			<td class="maintd">제목</td>
			<td class="subtd"><input type="text" name="title" value="${mainData.title }" id="wtitle"/></td>
		</tr>
		<tr>
			<td class="maintd">내용</td>
			<td class="subtd"><textarea name="content" cols="30" rows="10" id="wcontent">${mainData.content }</textarea></td>
		</tr>
		<tr>
			<!-- <td>첨부파일</td>	파일 있으면 이름가져오기 , 삭제버튼 추가 / 없으면 파일버튼
			<td><input type="file" name="file1" /></td> -->
		</tr>
		<tr>
			<td colspan="2" align="center">
			<div id="btns">
				<input type="button" class="writeButton" onclick="chkwrite()" value="수정" />
				<input type="button" class="writeButton" onclick="location.href='cbdetail?comuno=${mainData.comuno }" value="뒤로" />
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