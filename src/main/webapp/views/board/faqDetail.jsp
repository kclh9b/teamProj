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

<body>

<jsp:include page="../header.jsp"/>

	<h2 id="h2">FAQ</h2>
	
	
	<input type="hidden" name="faqno" value="${mainData.faqno }">
	
	
	<table id="table">
		
		<tr>
			<td class="maintd">제목</td> <td class="subtd">${mainData.title }</td>
		</tr>
		
		<tr>
			<td class="maintd">작성자</td> <td class="subtd">관리자</td>
		</tr>
		
		<tr>
			<td class="maintd">내용</td> <td class="subtd">${mainData.content }</td>
		</tr>			
		
		<tr>	
			<td class="maintd">작성일</td> <td class="subtd">${mainData.regdate }</td>
		</tr>
		
		<tr>
			<td colspan="2" align="right">
		<div id="btns">
		<input class="writeButton" type="button" onclick="location.href='faq'" value="목록으로" />
				
		<c:choose>
			<c:when test="${uid!=null }">
				<c:if test="${uid=='admin'}">
					<input type="button" class="writeButton" onclick="del()" value="삭제">
					<input type="button" class="writeButton" onclick="location.href='modiFaq?faqno=${mainData.faqno }'" value="수정" />
				</c:if>
			</c:when>			
		</c:choose>	
		</div>		
				
			</td>
		</tr>
		
	</table>	

<jsp:include page="../footer.jsp"/>	
	
</body>
<script>
	function del() {
		 if (confirm("삭제하시겠습니까 ?")) {
		        // (예) 버튼 클릭 시 이벤트
			 location.href="faqDel?faqno=${mainData.faqno }"
		    } else {
		        // (아니오) 버튼 클릭 시 이벤트
		      return;
		    }		
	}
</script>
</html>