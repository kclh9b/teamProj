<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dog과함께</title>
</head>
<body>


<script>
	alert("${msg }");
	location.href="<c:url value="${url }" />";
</script>
</body>
</html>