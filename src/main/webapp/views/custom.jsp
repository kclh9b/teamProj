<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="customWrapper">
	<table class="customCdt">
		<colgroup>
			<col width="100px">
			<col width="190px">
			<col width="100px">
		</colgroup>
		<tr>
			<td>
				<span class="schTitle">사이즈</span>
			</td>
			<td>
				<select name="size">
					<option value="n">선택</option>
					<option value="소" <c:if test="${sizeData.equals('소')}">selected</c:if>>소형견</option>
					<option value="중" <c:if test="${sizeData.equals('중')}">selected</c:if>>중형견</option>
					<option value="대" <c:if test="${sizeData.equals('대')}">selected</c:if>>대형견</option>
				</select>
			</td>
			<td>
				<span class="schTitle">털 길이</span>		
			</td>
			<td>
				<select name="fur">
					<option value="n">선택</option>
					<option value="s" <c:if test="${furData.equals('s')}">selected</c:if>>단모종</option>
					<option value="l" <c:if test="${furData.equals('l')}">selected</c:if>>장모종</option>
				</select>		
			</td>
		</tr>
		
		<tr>
			<td>
				<span class="schTitle">나이</span>
			</td>
			<td>
				<select name="age">
					<option value="n">선택</option>
					<option value="자견" <c:if test="${ageData.equals('자견')}">selected</c:if>>1살 미만(자견)</option>
					<option value="성견" <c:if test="${ageData.equals('성견')}">selected</c:if>>1살 ~ 6살(성견)</option>
					<option value="노견" <c:if test="${ageData.equals('노견')}">selected</c:if>>7살 이상(노견)</option>
				</select>		
			</td>
			<!-- 
			<td>
				<span class="schTitle">몸무게</span>
			</td>
			<td>
				<input type="text" name="weight" value="${weightData }" placeholder="몸무게" size="3" id="weight">kg<br>
			</td>-->
		</tr>
	</table>
</div>
	




	
	


