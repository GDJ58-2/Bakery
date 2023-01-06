<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../inc/empMenu.jsp"></jsp:include>
	<h1>관리자 등급 추가</h1>
	<form action="${pageContext.request.contextPath}/auth/addAuthInfo" method="post">
		<div>
			등급번호 : <input type="number" name="authCode">
		</div>
		<div>
			등급 : <input type="text" name="authMemo">
		</div>
		<div><button type="submit">추가</button></div>
	</form>
</body>
</html>