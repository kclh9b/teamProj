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

	<h2 id="h2">자유게시판</h2>
	
	<table id="table">
		<tr>
			<td class="maintd">번호</td> <td class="subtd">${mainData.comuno }</td>
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
			<td class="maintd">내용</td> <td class="subtd">${mainData.content }</td>
		</tr>
		
		<c:if test="${mainData.file_1_str ne null || mainData.file_2_str ne null || mainData.file_3_str ne null }">
		<tr>
			<td class="maintd">첨부파일</td>
			<td class="subtd"><img src="<c:url value="/up/${mainData.file_1_str }" />" alt="" >
			<img src="<c:url value="/up/${mainData.file_2_str }" />" alt="" >
			<img src="<c:url value="/up/${mainData.file_3_str }" />" alt="" ></td>
		</tr>
		</c:if>
		
		<tr>
			<td colspan="2" align="right">
		<div id="btns">		
				<input class="detailToList" type="button" onclick="location.href='cblist'" value="목록으로" />				
			<c:choose>
				<c:when test="${uid!=null }">				
					<c:if test="${uid==mainData.uid || uid=='admin' }">
						<input type="button" class="detailToList" onclick="del()" value="삭제">
						<input type="button" class="detailToList" onclick="location.href='modiCb?comuno=${mainData.comuno }'" value="수정" />					
					</c:if>					
				</c:when>			
			</c:choose>
		</div>	
				
			</td>
		</tr>
		
	</table>	
	
	<c:if test="${uid!=null && black.equals('n') || uid=='admin'}">
			
			<form action="cbRepReg">
			
			<table id="table1">
				
				<tr>
					<td class="maintd">자유게시판번호</td>
					<td class="maintd">작성자</td>			
				</tr>
				
				<tr>
					<td><input type="hidden" name="comuno" value="${mainData.comuno }">${mainData.comuno }</td>
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
	
	<jsp:include page="cbDet123.jsp"/>
	
	<jsp:include page="../footer.jsp"/>
	
</body>
<script>
	function del() {
		 if (confirm("삭제하시겠습니까 ?")) {
		        // (예) 버튼 클릭 시 이벤트
			 location.href="delCb?comuno=${mainData.comuno }"
		    } else {
		        // (아니오) 버튼 클릭 시 이벤트
		      return;
		    }		
	}
</script>
</html>