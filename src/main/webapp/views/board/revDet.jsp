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
	<%	
		String user = (String)session.getAttribute("uid");	

		String black = (String)session.getAttribute("black");
	%>	 
<body>

<jsp:include page="../header.jsp"/>

	<h2 id="h2">상품 후기</h2>
	<table id="table">
		
		<tr>
			<td class="maintd">상품후기번호</td> <td class="subtd">${mainData.revno}</td>
		</tr>
		
		<tr>
			<td class="maintd">작성자</td> <td class="subtd">${mainData.uid }</td>
		</tr>
		
		<tr>
			<td class="maintd">상품코드</td> <td class="subtd">${mainData.ino }</td>
		</tr>
		
		<tr>
			<td class="maintd">내용</td> <td class="subtd">${mainData.content }</td>
		</tr>
		
		<tr>	
			<td class="maintd">작성일</td> <td class="subtd">${mainData.regdate }</td>
		</tr>	
		
		<tr>
			<td class="maintd">조회수</td> <td class="subtd">${mainData.views }</td>
		</tr>
		
		<tr>
			<td class="maintd">별점</td> <td class="subtd">${mainData.score }</td>
		</tr>
		
		<c:if test="${mainData.file1 ne null || mainData.file2 ne null || mainData.file3 ne null }">
		<tr>
		<td class="maintd">첨부파일</td>
		<td class="subtd"><img src="<c:url value="/up/${mainData.file1 }" />" alt="" >
		<img src="<c:url value="/up/${mainData.file2 }" />" alt="" >
		<img src="<c:url value="/up/${mainData.file3 }" />" alt="" ></td>
		</tr>
		</c:if>
		
		<tr>
			<td colspan="2" align="right">
		<div id="btns">	
				<input class="detailToList" type="button" onclick="location.href='review'" value="목록으로" />
				<c:choose>
				<c:when test="${uid!=null }">				
					<c:if test="${uid=='admin' }">
						<%-- <input type="button" onclick="location.href='revModi?revno=${mainData.revno }'" value="수정" /> --%>										
					</c:if>
					
					<c:if test="${uid==mainData.uid || uid=='admin' }">
						<input type="button" onclick="del()" class="writeButton" value="삭제">
					</c:if>			
				</c:when>			
				</c:choose>
		</div>			
			</td>
		</tr>			
		
	</table>		
		
	<c:if test="${uid!=null && black.equals('n') || uid=='admin'}">	
	
	<form action="revRepReg">
	
	<table id="table1">
		
		<tr>
			<td class="maintd">상품후기번호</td>
			<td class="maintd">작성자</td>			
		</tr>
		
		<tr>
			<td><input type="hidden" name="revno" value="${mainData.revno }">${mainData.revno }</td>
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
	
		<h4 class="h4">댓글 목록</h4>
	
	<jsp:include page="revDet123.jsp"/>	
	
	<jsp:include page="../footer.jsp"/>	
	
		
</body>
<script>
	function del() {
		 if (confirm("삭제하시겠습니까 ?")) {
		        // (예) 버튼 클릭 시 이벤트
			 location.href="deleteRev?revno=${mainData.revno }"
		    } else {
		        // (아니오) 버튼 클릭 시 이벤트
		      return;
		    }		
	}
</script>
</html>