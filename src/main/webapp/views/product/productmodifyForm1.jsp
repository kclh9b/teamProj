<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.inputArea { margin:10px 0; }
select { width:100px; }
label { display:inline-block; width:70px; padding:5px; }
label[for='itemInfo'] { display:block; }
input { width:150px; }
textarea#itemInfo { width:400px; height:180px; }
</style>
</head>
<body>
<form action=productmodifyReg >
	<div class="inputArea">
		<label for="ino">상품코드</label>
		<input type="text" id="ino" name="ino" value="${pro.ino }">
	</div>
	
	<div class="inputArea">
		<label>카테고리</label>
		<select class="cateid" id="cateid" name="cateid">
			<option value="101" <c:if test="${pro.cateid == 101 }">selected</c:if>>101</option>
			<option value="102" <c:if test="${pro.cateid == 102 }">selected</c:if>>102</option>
			<option value="103" <c:if test="${pro.cateid == 103 }">selected</c:if>>103</option>
			<option value="104" <c:if test="${pro.cateid == 104 }">selected</c:if>>104</option>
			<option value="105" <c:if test="${pro.cateid == 105 }">selected</c:if>>105</option>
			<option value="106" <c:if test="${pro.cateid == 106 }">selected</c:if>>106</option>
			<option value="107" <c:if test="${pro.cateid == 107 }">selected</c:if>>107</option>
			<option value="201" <c:if test="${pro.cateid == 201 }">selected</c:if>>201</option>
			<option value="202" <c:if test="${pro.cateid == 202 }">selected</c:if>>202</option>
			<option value="203" <c:if test="${pro.cateid == 203 }">selected</c:if>>203</option>
			<option value="204" <c:if test="${pro.cateid == 204 }">selected</c:if>>204</option>
			<option value="301" <c:if test="${pro.cateid == 301 }">selected</c:if>>301</option>
			<option value="302" <c:if test="${pro.cateid == 302 }">selected</c:if>>302</option>
			<option value="303" <c:if test="${pro.cateid == 303 }">selected</c:if>>303</option>
			<option value="304" <c:if test="${pro.cateid == 304 }">selected</c:if>>304</option>
			<option value="305" <c:if test="${pro.cateid == 305 }">selected</c:if>>305</option>
			<option value="401" <c:if test="${pro.cateid == 401 }">selected</c:if>>401</option>
			<option value="402" <c:if test="${pro.cateid == 402 }">selected</c:if>>402</option>
			<option value="403" <c:if test="${pro.cateid == 403 }">selected</c:if>>403</option>
			<option value="404" <c:if test="${pro.cateid == 404 }">selected</c:if>>404</option>
			<option value="405" <c:if test="${pro.cateid == 405 }">selected</c:if>>405</option>
		</select>
	</div>
	
	<div>
		<p>101/사료/퍼피용</p>
		<p>102/사료/성견용</p>
		<p>103/사료/노견용</p>
		<p>104/사료/소형견용</p>
		<p>105/사료/대형견용</p>
		<p>106/사료/분비만견용</p>
		<p>107/사료/간식</p>
		<p>201/관리용품/배변판/패드</p>
		<p>202/관리용품/기저귀</p>
		<p>203/관리용품/털제거용품</p>
		<p>204/관리용품/이발기구</p>
		<p>301/장난감/봉제장난감</p>
		<p>302/장난감/고무</p>
		<p>303/장난감/공</p>
		<p>304/장난감/원반</p>
		<p>305/장난감/중대형견용</p>
		<p>401/산책용품/자동줄</p>
		<p>402/산책용품/목줄</p>
		<p>403/산책용품/하네스</p>
		<p>404/산책용품/이동가방</p>
		<p>405/산책용품/유모차</p>
	</div>
			
	<div class="inputArea">
		<label for="name">상품명</label>
		<input type="text" id="name" name="name" value="${pro.name }">
	</div>
	
	<div class="inputArea">
		<label for="price">가격</label>
		<input type="text" id="price" name="price" value="${pro.price }">
	</div>	
	
	<div class="inputArea">
		<label for="discount">할인율</label>
		<input type="text" id="discount" name="discount" value="${pro.discount }">
	</div>
	
	<div class="inputArea">
		<label for="origin">원산지</label>
		<input type="text" id="origin" name="origin" value="${pro.origin }">
	</div>
	
	<div class="inputArea">
		<label for="manufac">제조사</label>
		<input type="text" id="manufac" name="manufac" value="${pro.manufac }">
	</div>
	
	<div class="inputArea">
		<label for="quantity">수량</label>
		<input type="text" id="quantity" name="quantity" value="${pro.quantity }">
	</div>
	
 	<div class="inputArea">
		<label for="size">사이즈</label>
		<input type="radio" id="size" name="size" value="소" <c:if test="${pro.size == '소' }">checked</c:if>>소
		<input type="radio" id="size" name="size" value="중" <c:if test="${pro.size == '중' }">checked</c:if>>중
		<input type="radio" id="size" name="size" value="대" <c:if test="${pro.size == '대' }">checked</c:if>>대
	</div>
	
	<div class="inputArea">
		<label for="fur">털길이</label>
		<input type="radio" id="fur" name="fur" value="l" <c:if test="${pro.fur == 'l' }">checked</c:if>>l
		<input type="radio" id="fur" name="fur" value="s" <c:if test="${pro.fur == 's' }">checked</c:if>>s
	</div>
	
	<div class="inputArea">
		<label for="age">나이</label>
		<input type="radio" id="age" name="age" value="자견" <c:if test="${pro.age == '자견' }">checked</c:if>>자견
		<input type="radio" id="age" name="age" value="성견" <c:if test="${pro.age == '성견' }">checked</c:if>>성견
		<input type="radio" id="age" name="age" value="노견" <c:if test="${pro.age == '노견' }">checked</c:if>>노견
	</div>
	
	<div class="inputArea">
		<label for="fatyn">비만</label>
		<input type="radio" id="fatyn" name="fatyn" value="y" <c:if test="${pro.fatyn == 'y' }">checked</c:if>>y
		<input type="radio" id="fatyn" name="fatyn" value="n" <c:if test="${pro.fatyn == 'n' }">checked</c:if>>n
	</div>
	
	
	<div class="inputArea">
		<input type="submit" value="수정" />
		<a href="productdetail?ino=${pro.ino }">뒤로</a>
	</div>
</form>
</body>
</html>