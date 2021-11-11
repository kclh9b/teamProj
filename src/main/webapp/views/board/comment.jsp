<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
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
<body>

	<h4>코멘트 달기</h4>
	
	<form action="commentReg">
	
	<table border="">
		
		<tr>
			<td>상품후기번호</td>
			<td>작성자</td>			
		</tr>
		
		<tr>
			<td><input type="hidden" name="qnano" value="${mainData.qnano }">${mainData.qnano }</td>
				
			<td><input type="hidden" name="uid" value="${uid }">${uid }</td>
		</tr>
		<tr>
			<td colspan="2" align="center">내용</td>
		</tr>
		<tr>
			<td colspan="3"><textarea name="content" cols="30" rows="10"></textarea></td>
		</tr>	
			
		<tr>
			<td colspan="5" align="right">
			<button>작성</button>
		</tr>
		
	</table>	

	</form>

</body>
</html>