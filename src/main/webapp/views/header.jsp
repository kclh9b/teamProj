<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>dog과함께</title>
<link rel="stylesheet" href="<c:url value="/css/style_header.css"/>"></link>
<div class="outerWrapper">
	<div class="innerWrapper">
		<h1 class=""><a href="<c:url value="/"/>">dog과함께</a></h1>
		<form action="/item" name="frm">
			<div class="sch">
				<input type="hidden" name="custom" value="n">
				<input type="hidden" name="onNav" value="n">
				<input type="hidden" name="cate" value="">
				<input type="hidden" name="schkind" value="name">
				<input class="sch" type="text" name="keyword" value="" id="keyword" placeholder="상품명을 입력해주세요">
				<input class="schButton" type="button" value="검색" onclick="goSearch()">
			</div>
		</form>
		
		<div class="smenu">
			<ul class="slist">
				<%
					if(session.getAttribute("uid") == null) {
				%>
					<li><a href="<c:url value="/member/MemberLogin"/>">로그인</a></li>
					<li><a href="<c:url value="/member/MemberReg"/>">회원가입</a></li>
				<%	}else {
				%>
					<li><a href="<c:url value="/member/MemberLogout"/>">로그아웃</a></li>
					<li><a href="<c:url value="/member/Mypage"/>">마이페이지</a></li>
					<li><a href="<c:url value="/cart"/>">내 장바구니</a></li>
				<%} %>
					<li id="comu"><a href="<c:url value="/board/list"/>">커뮤니티</a>
						<ul class="clist">
							<li><a href="<c:url value="/board/list"/>">Notice</a></li>
							<li><a href="<c:url value="/board/faq"/>">FAQ</a></li>
							<li><a href="<c:url value="/board/cblist"/>">Comunity</a></li>
							<li><a href="<c:url value="/board/review"/>">Review</a></li>
							<li><a href="<c:url value="/board/qna"/>">Q&A</a></li>
						</ul>
					</li>		
			</ul>
		</div>
		
		<div class="nav">
			<ul class="cate">
				<li><a href="<c:url value="/item?custom=y&onNav=n&cate=" />">맞춤상품</a></li>
				<li class="cate"><a href="<c:url value="/item?custom=n&onNav=y&cate=101" />">사료</a>
					<div class="navInner">
						<div class="innerTitle">사료</div>
						<table class="cateInner">
							<colgroup>
								<col width="20%"><col width="20%"><col width="20%"><col width="20%"><col width="20%">
							</colgroup>
							<tr>
								<td><a href="<c:url value="/item?custom=n&onNav=y&cate=101" />">퍼피용</a></td>
								<td><a href="<c:url value="/item?custom=n&onNav=y&cate=102" />">성견용</a></td>
								<td><a href="<c:url value="/item?custom=n&onNav=y&cate=103" />">노견용</a></td>
								<td><a href="<c:url value="/item?custom=n&onNav=y&cate=104" />">소형견용</a></td>
								<td><a href="<c:url value="/item?custom=n&onNav=y&cate=105" />">중형견용</a></td>
							</tr>
							<tr>
								<td><a href="<c:url value="/item?custom=n&onNav=y&cate=106" />">대형견용</a></td>
								<td><a href="<c:url value="/item?custom=n&onNav=y&cate=107" />">비만견용</a></td>
								<td><a href="<c:url value="/item?custom=n&onNav=y&cate=108" />">간식</a></td>
							</tr>
						</table>
					</div>
				</li>
				<li class="cate"><a href="<c:url value="/item?custom=n&onNav=y&cate=201" />">관리용품</a>
					<div class="navInner">
						<div class="innerTitle">관리용품</div>
						<table class="cateInner">
							<colgroup>
								<col width="20%"><col width="20%"><col width="20%"><col width="20%"><col width="20%">
							</colgroup>
							<tr>
								<td><a href="<c:url value="/item?custom=n&onNav=y&cate=201" />">배변판/패드</a></td>
								<td><a href="<c:url value="/item?custom=n&onNav=y&cate=202" />">기저귀</a></td>
								<td><a href="<c:url value="/item?custom=n&onNav=y&cate=203" />">돌돌이</a></td>
								<td><a href="<c:url value="/item?custom=n&onNav=y&cate=204" />">이발기구</a></td>
							</tr>
						</table>
					</div>
				</li>
				<li class="cate"><a href="<c:url value="/item?custom=n&onNav=y&cate=301" />">장난감</a>
					<div class="navInner">
						<div class="innerTitle">장난감</div>
						<table class="cateInner">
							<colgroup>
								<col width="20%"><col width="20%"><col width="20%"><col width="20%"><col width="20%">
							</colgroup>
							<tr>
								<td><a href="<c:url value="/item?custom=n&onNav=y&cate=301" />">봉제장난감</a></td>
								<td><a href="<c:url value="/item?custom=n&onNav=y&cate=302" />">고무</a></td>
								<td><a href="<c:url value="/item?custom=n&onNav=y&cate=303" />">공</a></td>
								<td><a href="<c:url value="/item?custom=n&onNav=y&cate=304" />">원반</a></td>
								<td><a href="<c:url value="/item?custom=n&onNav=y&cate=305" />">중대형견용</a></td>
							</tr>
						</table>
					</div>
				</li>
				<li class="cate"><a href="<c:url value="/item?custom=n&onNav=y&cate=401" />">산책용품</a>
					<div class="navInner">
						<div class="innerTitle">산책용품</div>
						<table class="cateInner">
							<colgroup>
								<col width="20%"><col width="20%"><col width="20%"><col width="20%"><col width="20%">
							</colgroup>
							<tr>
								<td><a href="<c:url value="/item?custom=n&onNav=y&cate=401" />">자동줄</a></td>
								<td><a href="<c:url value="/item?custom=n&onNav=y&cate=402" />">목줄</a></td>
								<td><a href="<c:url value="/item?custom=n&onNav=y&cate=403" />">하네스</a></td>
								<td><a href="<c:url value="/item?custom=n&onNav=y&cate=404" />">이동가방</a></td>
								<td><a href="<c:url value="/item?custom=n&onNav=y&cate=405" />">유모차</a></td>
							</tr>
						</table>
					</div>
				</li>		
			</ul>
		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){
	$("li#comu").hover(
		function(){ 
			$('ul:not(:animated)',this).stop().show();
		},
		function(){ 
			$('ul',this).stop().hide();
		}
	);
});
$(document).ready(function(){
	$("li.cate").hover(
		function(){ 
			$('div:not(:animated)',this).stop().show();
		},
		function(){ 
			$('div',this).stop().hide();
		}
	);
});
function goSearch() {
	var keyword = document.getElementById("keyword").value;
	/*
	if(keyword=="") {
		alert("검색어를 입력해주세요");
		return;
	}*/
	
	document.frm.submit()
}
</script>