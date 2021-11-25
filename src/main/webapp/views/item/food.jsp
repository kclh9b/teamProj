<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>사료</h3>
<div class="topNav">
	<table class="topNavTable">
		<colgroup><col width="20%"><col width="20%"><col width="20%"><col width="20%"><col width="20%"></colgroup>
		<tr>
			<td><a href="<c:url value="/itemlist?custom=n&onNav=y&cate=101" />" class="<c:if test="${schCondition.cate.equals('101')}">active</c:if>">퍼피용</a></td>
			<td><a href="<c:url value="/itemlist?custom=n&onNav=y&cate=102" />" class="<c:if test="${schCondition.cate.equals('102')}">active</c:if>">성견용</a></td>
			<td><a href="<c:url value="/itemlist?custom=n&onNav=y&cate=103" />" class="<c:if test="${schCondition.cate.equals('103')}">active</c:if>">노견용</a></td>
			<td><a href="<c:url value="/itemlist?custom=n&onNav=y&cate=104" />" class="<c:if test="${schCondition.cate.equals('104')}">active</c:if>">소형견용</a></td>
			<td><a href="<c:url value="/itemlist?custom=n&onNav=y&cate=105" />" class="<c:if test="${schCondition.cate.equals('105')}">active</c:if>">중형견용</a></td>
		</tr>
		<tr>
			<td><a href="<c:url value="/itemlist?custom=n&onNav=y&cate=106" />" class="<c:if test="${schCondition.cate.equals('106')}">active</c:if>">대형견용</a></td>
			<td><a href="<c:url value="/itemlist?custom=n&onNav=y&cate=107" />" class="<c:if test="${schCondition.cate.equals('107')}">active</c:if>">비만견용</a></td>
			<td><a href="<c:url value="/itemlist?custom=n&onNav=y&cate=108" />" class="<c:if test="${schCondition.cate.equals('108')}">active</c:if>">간식</a></td>
		</tr>
	</table>
</div>