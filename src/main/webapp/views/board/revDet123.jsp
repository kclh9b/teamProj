<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:forEach items="${abc }" var="vo" varStatus="no">
<table id="table2">
	<tr>
		<td class="mt">작성자</td>
		<td class="st">${vo.uid }</td>
	</tr>
	<tr>
		<td class="mt">내용</td>
		<td class="st">${vo.content }</td>
	</tr>
	<tr>
		<td class="mt">작성일</td>
		<td class="st">${vo.regdate }</td>
	</tr>					
		
</table>
	<br>
	<div id="btns2">
	<c:choose>
		<c:when test="${uid!=null }">				
			<c:if test="${uid==vo.uid || uid=='admin' }">
			<td>
					<input type="button" class="writeButton" onclick='delrr(${vo.repno })' value="삭제">	
			</td>			
			</c:if>					
		</c:when>			
	</c:choose>	
	</div>
</c:forEach>

<script>
	function delrr(delNo) {		
		
		 if (confirm("삭제하시겠습니까 ?")) {
		        // (예) 버튼 클릭 시 이벤트
			 location.href="delRreply?revno=${mainData.revno}&repno="+delNo			 
		    } else {
		        // (아니오) 버튼 클릭 시 이벤트
		      return;
		    }		
	}
</script>