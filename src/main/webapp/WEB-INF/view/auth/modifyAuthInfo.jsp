<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../inc/empMenu.jsp"></jsp:include>
	<h1>관리자 등급 수정</h1>
	<form action="${pageContext.request.contextPath}/auth/modifyAuthInfo" method="post">
		<div>
			등급번호 : <input type="number" name="authCode" readonly="readonly" value="${a.authCode}">
		</div>
		<div>
			등급 : <input type="text" name="authMemo" value="${a.authMemo}">
		</div>
		<div><button type="submit">수정</button></div>
	</form>
</body>
</html>