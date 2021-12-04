<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style_list.css"></link>
<style>
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="../adminPage.jsp"/>
<div class="goods_list">
	<h2>상품 목록</h2>
	<div class="search">
		<form action="">
			<select name="searchType">
				<option value="n">상품명</option>
				<option value="i">상품코드</option>
				<option value="g">대분류</option>
			</select>
			<input type="text" name="sch" id="sch">
			<input type="submit" value="검색" id="search">
		</form>
	</div>
	<table class="basic">
		<thead>
			<tr>
				<th>번호</th>
				<th>상품코드</th>
				<th>대분류</th>
				<th>소분류</th>
				<th width="230">상품명</th>
				<th>원가</th>
				<th>가격</th>
				<th>할인율</th>
				<th>수량</th>
				<th>등록날짜</th>
				<th>삭제</th>
				<th>판매량</th>
				<th>평점</th>
				<th>리뷰갯수</th>
			</tr>
		</thead>
		
		<tbody>
	<c:forEach items="${pro }" var="pr" varStatus="no">		
			<tr>
				<td>${pageInfo.start+no.index+1 }</td>
				<td>${pr.ino}</td>
				<td>${pr.gname}</td>
				<td>${pr.sname}</td>
				<td><a href="item/${pr.ino }" id="click">${pr.name }</a></td>
				<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${pr.price }" /></td>
				<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${pr.calprice }" /></td>
				<td>${pr.discount }%</td>
				<td>${pr.quantity }</td>
				<td>${pr.regdate }</td>
				<c:choose>
				<c:when test="${pr.available eq 'n'}">
					<td>○</td>
				</c:when>
				<c:otherwise>
					<td></td>
				</c:otherwise>
				</c:choose>
				<td>${pr.sellcnt }</td>
				<td><fmt:formatNumber value="${pr.r_avg }" pattern="0.0"/></td>
				<td>${pr.r_cnt }</td>
			</tr>
	</c:forEach>
		</tbody>
	</table>
		<div id="paging">
			<c:if test="${pageInfo.startPage>1 }">
				<a href="?page=${pageInfo.startPage -1 }"><</a>
			</c:if>
			<c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }" var="i">
				<c:choose>
					<c:when test="${pageInfo.page == i }">
						[${i }]
					</c:when>
					<c:otherwise>
						<a href="?page=${i }&searchType=${itemVO.searchType }&day=${itemVO.day }&sch=${itemVO.sch }">${i }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pageInfo.endPage<pageInfo.totalPage}">
				<a href="?page=${pageInfo.endPage +1 }">></a>
			</c:if>		
		</div>	
</div>
	<script>
		$("#search").click(function(){
			if($("#sch").val() == '') {
				alert("검색어를 입력해주세요");
			}
		});
		
		function goPage(pageNum) {
			var url =  decodeURI(window.location.search);
			if(url.indexOf("page")==-1) {
				url = url + "&page="+pageNum
			}else {
				var pageIndex = url.indexOf("page")-1;
				var lastParaIndex = url.lastIndexOf("&");
				if(pageIndex==lastParaIndex) {
					url = url.slice(0,pageIndex)+"&page="+pageNum;
				}else {
					url = url.slice(0,pageIndex)+"&page="+pageNum + url.slice(lastParaIndex)
				}
			}
			location.href = url;
		}
	</script>
<jsp:include page="../footer.jsp"/>	
</body>
</html>
