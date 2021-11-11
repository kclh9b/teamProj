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
	} else if(!abc.equals("admin")) {
		out.println("<script>alert('관리자가 아닙니다');</script>");
		out.println("<script>location.href='/'</script>");
	}
%>

<form action="modifyReg" name="abc">
	<input type="hidden" name="notno" value="${mainData.notno }"/>
	<table id="table">
		<tr>
			<td class="maintd">제목</td>
			<td class="subtd"><input type="text" name="title" value="${mainData.title }" id="wtitle"/></td>
		</tr>
		<tr>
			<td class="maintd">카테고리</td> <!-- if문으로 mainData.category 와 같으면 체크드 -->
			<td class="subtd"><input type="radio" name="category" value="dog" class="cateval"/>강아지
				<input type="radio" name="category" value="purchase" class="cateval"/>결제
				<input type="radio" name="category" value="send" class="cateval"/>배송
				<input type="radio" name="category" value="repurchase" class="cateval"/>환불
				<input type="radio" name="category" value="notice" class="cateval" checked="checked"/>공지
			</td>
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
				<input type="button" class="writeButton" onclick="location.href='detail?notno=${mainData.notno }'" value="뒤로" />
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