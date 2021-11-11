<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style_header.css"></link>
<link rel="stylesheet" href="../css/style_footer.css"></link>
</head>
<body>
<h1>상품 삭제</h1>

<form action="itemdeleteReg">
	<input type="hidden" name="ino" value="${itemVo.ino }">
	<table border="">
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="삭제" />
				<a href="itemdetail?ino=${itemVo.ino }">뒤로</a>
			</td>
		</tr>
	</table>
</form>
</body>
</html>