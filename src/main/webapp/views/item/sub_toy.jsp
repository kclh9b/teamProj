<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>장난감</h3>
<div class="topNav">
	<table class="topNavTable">
		<colgroup><col width="20%"><col width="20%"><col width="20%"><col width="20%"><col width="20%"></colgroup>
		<tr>
			<td><a href="<c:url value="/itemlist?custom=n&onNav=y&cate=301" />" class="<c:if test="${schCondition.cate.equals('301')}">active</c:if>">봉제장난감</a></td>
			<td><a href="<c:url value="/itemlist?custom=n&onNav=y&cate=302" />" class="<c:if test="${schCondition.cate.equals('302')}">active</c:if>">고무</a></td>
			<td><a href="<c:url value="/itemlist?custom=n&onNav=y&cate=303" />" class="<c:if test="${schCondition.cate.equals('303')}">active</c:if>">공</a></td>
			<td><a href="<c:url value="/itemlist?custom=n&onNav=y&cate=304" />" class="<c:if test="${schCondition.cate.equals('304')}">active</c:if>">원반</a></td>
			<td><a href="<c:url value="/itemlist?custom=n&onNav=y&cate=305" />" class="<c:if test="${schCondition.cate.equals('305')}">active</c:if>">중대형견용</a></td>
		</tr>
	</table>
</div>