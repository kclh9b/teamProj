<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>산책용품</h3>
<div class="topNav">
	<table class="topNavTable">
		<colgroup><col width="20%"><col width="20%"><col width="20%"><col width="20%"><col width="20%"></colgroup>
		<tr>
			<td><a href="<c:url value="/item?custom=n&onNav=y&cate=401" />" class="<c:if test="${schCondition.cate.equals('401')}">active</c:if>">자동줄</a></td>
			<td><a href="<c:url value="/item?custom=n&onNav=y&cate=402" />" class="<c:if test="${schCondition.cate.equals('402')}">active</c:if>">목줄</a></td>
			<td><a href="<c:url value="/item?custom=n&onNav=y&cate=403" />" class="<c:if test="${schCondition.cate.equals('403')}">active</c:if>">하네스</a></td>
			<td><a href="<c:url value="/item?custom=n&onNav=y&cate=404" />" class="<c:if test="${schCondition.cate.equals('404')}">active</c:if>">이동가방</a></td>
			<td><a href="<c:url value="/item?custom=n&onNav=y&cate=405" />" class="<c:if test="${schCondition.cate.equals('405')}">active</c:if>">유모차</a></td>
		</tr>
	</table>
</div>