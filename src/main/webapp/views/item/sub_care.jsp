<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>관리용품</h3>
<div class="topNav">
	<table class="topNavTable">
		<colgroup><col width="20%"><col width="20%"><col width="20%"><col width="20%"><col width="20%"></colgroup>
		<tr>
			<td><a href="<c:url value="/item?custom=n&onNav=y&cate=201" />" class="<c:if test="${schCondition.cate.equals('201')}">active</c:if>">배변판/패드</a></td>
			<td><a href="<c:url value="/item?custom=n&onNav=y&cate=202" />" class="<c:if test="${schCondition.cate.equals('202')}">active</c:if>">기저귀</a></td>
			<td><a href="<c:url value="/item?custom=n&onNav=y&cate=203" />" class="<c:if test="${schCondition.cate.equals('203')}">active</c:if>">돌돌이</a></td>
			<td><a href="<c:url value="/item?custom=n&onNav=y&cate=204" />" class="<c:if test="${schCondition.cate.equals('204')}">active</c:if>">이발기구</a></td>
		</tr>
	</table>
</div>