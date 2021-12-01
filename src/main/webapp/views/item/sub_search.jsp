<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
	<span class="schTitle">상품분류</span>
	<select name="cate">
		<option value="" >전체</option>
		<option value="1__" <c:if test="${schCondition.cate.equals('1__')}">selected</c:if>>사료</option>
		<option value="2__" <c:if test="${schCondition.cate.equals('2__')}">selected</c:if>>관리용품</option>
		<option value="3__" <c:if test="${schCondition.cate.equals('3__')}">selected</c:if>>장난감</option>
		<option value="4__" <c:if test="${schCondition.cate.equals('4__')}">selected</c:if>>산책용품</option>
	</select>
</div>
<div>
	<span class="schTitle">검색조건</span>
	<select name="schKind">
		<option value="name" >상품명</option>
		<%-- <option value="ino" <c:if test="${sc.schKind.equals('ino')}">selected</c:if>>상품코드</option>--%>
		<option value="manufac" <c:if test="${schCondition.schKind.equals('manufac')}">selected</c:if>>제조사</option>
	</select>
	&nbsp;<input type="text" name="keyword" value="${schCondition.keyword}" placeholder="검색어" id="detailKeyword">
</div>
<div>
	<span class="schTitle">판매가격대</span>
	<input type="text" name="min" value="${schCondition.min}" placeholder="최소가격" id="min"> ~ <input type="text" name="max" value="${schCondition.max}"  placeholder="최대가격" id="max">
	<input type="hidden" name="onNav" value="n">
	<div style="width:100px; margin:0 auto; margin-top:25px;">
		<input type="button" value="검색" class="schSubmit" onclick="goDetailSearch()">
	</div>
</div>
<script>
</script>