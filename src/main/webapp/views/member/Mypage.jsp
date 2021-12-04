<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<c:url value="/css/style_mypage.css"/>">

</head>
<body>
<jsp:include page="../header.jsp" />
<%-- <%
if(session.getAttribute("uid").equals("admin")) {
%>
<jsp:include page="../adminPage.jsp" />
<% } else { %>
<jsp:include page="../userPage.jsp" />
<%  } %>  --%>
<div class="content">
<div class="member_tit">
	<h2>마이페이지</h2>
	</div> 
<table class="myp">
<tr><td class="memberCols1" colspan="2" align="center"><%= session.getAttribute("name") %>님 어서오세요.</td>
</tr>
<tr>
<td class="memberCols1">회원 아이디</td>
<td class="memberCols2">${memberData2.uid }</td>
</tr>
<tr>
<td class="memberCols1">회원 이메일</td>
<td class="memberCols2">${memberData2.email }</td>
</tr>
<tr>
<td class="memberCols1">회원 휴대전화</td>
<td class="memberCols2">${memberData2.phn }</td>
</tr>

<tr>
<td colspan="3" align="center">
<a class="btn2" href="<c:url value="/member/MemberListOne"/>">회원 상세정보</a>
<a class="btn2" href="<c:url value="/member/MyWriteList"/>">내가 쓴 글</a>
<a class="btn2" href="<c:url value="/user/UserOrderlist"/>">주문내역</a>
</td></tr>
<tr>
<td></td>
</tr>
<%
	if(session.getAttribute("uid").equals("admin")) {
		
%>
<tr>
<td colspan="3" align="center">
<a class="btn3" href="<c:url value="/member/MemberList"/>">회원관리</a>
<a class="btn3" href="<c:url value="/admin/item"/>">상품목록</a>
<a class="btn3" href="<c:url value="/admin/item/save"/>">상품등록</a>
<a class="btn3" href="<c:url value="/order/orderlist"/>">주문목록</a>
</td>
</tr>
<tr>
<td colspan="3" align="center">
<a class="btn3" href="<c:url value="/order/orderCancellist"/>">취소목록</a>
<a class="btn3" href="<c:url value="/order/orderRefundlist"/>">반품목록</a>
<a class="btn3" href="<c:url value="/adminRecommend"/>">추천상품</a>
<a class="btn3" href="<c:url value="/adminSettle"/>">정산</a>
</td>
</tr>
<%
	}
%>
</table>
<%-- <%
	if(session.getAttribute("uid").equals("admin")) {
		
%>
<a href="<c:url value="/member/MemberList"/>">회원관리(관리자)</a>
<a href="<c:url value="/product/productlist"/>">상품목록(관리자)</a>
<a href="<c:url value="/order/orderlist"/>">주문목록(관리자)</a>
<a href="<c:url value="/order/orderCancellist"/>">취소목록(관리자)</a>
<a href="<c:url value="/order/orderRefundlist"/>">반품목록(관리자)</a>
<a href="<c:url value="/adminSettle"/>">정산(관리자)</a>
<a href="<c:url value="/adminRecommend"/>">추천상품(관리자)</a>
<%
	}
%> --%>


<%-- <a href="<c:url value="/member/MemberListOne"/>">회원정보</a>
<a href="<c:url value="/member/MyWriteList"/>">내가 쓴 글</a>
<a href="<c:url value="/user/UserOrderlist"/>">주문내역</a>
 --%>
 </div>
</body>
<jsp:include page="../footer.jsp" />
</html>