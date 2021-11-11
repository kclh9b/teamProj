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

	<h2 id="h2">Notice</h2>
	
	<table id="table">
		<tr>
			<td class="maintd">번호</td> <td class="subtd">${mainData.notno }</td>
		</tr>
		
		<tr>
			<td class="maintd">카테고리</td> <td class="subtd">${mainData.category }</td>
		</tr>
		
		<tr>
			<td class="maintd">제목</td> <td class="subtd">${mainData.title }</td>
		</tr>
		
		<tr>
			<td class="maintd">작성자</td> <td class="subtd">${mainData.uid }</td>
		</tr>
		
		<tr>	
			<td class="maintd">작성일</td> <td class="subtd">${mainData.regdate }</td>
		</tr>	
		
		<tr>
			<td class="maintd">조회수</td> <td class="subtd">${mainData.views }</td>
		</tr>
		
		<tr>
			<td class="maintd">내용</td> <td class="subtd" id="subtd1">${mainData.content }</td>
		</tr>
		
		<c:if test="${mainData.file_1_str ne null }">
		<tr>
			<td class="maintd">첨부파일</td> <td class="subtd" id="subtd2"><img src="<c:url value="/up/${mainData.file_1_str }" />" alt="" ></td>
		</tr>
		</c:if>
		
		<tr>
			<td colspan="2" align="right">
	<div id="btns">
				<input class="detailToList" type="button" onclick="location.href='list'" value="목록으로" />
								
		<c:choose>
			<c:when test="${uid!=null }">
				<c:if test="${uid=='admin'}">
				
					<input type="button" onclick="del()" class="detailToList" value="삭제">
					<input type="button" class="writeButton" onclick="location.href='modifyForm?notno=${mainData.notno }'" value="수정" />
				
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
			 location.href="delete?notno=${mainData.notno }"
		    } else {
		        // (아니오) 버튼 클릭 시 이벤트
		      return;
		    }		
	}
</script>
</html>