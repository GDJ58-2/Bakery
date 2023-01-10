<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action = "${pageContext.request.contextPath}/customer/modifyCustomerPw" method = "post" id = "removeForm">
		<div>현재 비밀번호</div>
		<div>
			<input type = "password" id = "pw" name = "pw">
		</div>
		
		<div>새 비밀번호</div>
		<div>
			<input type = "password" id = "newPw" name = "newPw">
		</div>
		<button type = "submit" id = "modifyPwBtn">비밀번호변경</button>
	</form>
	
	<div>
		<a href = "${pageContext.request.contextPath}/customer/home">
			home
		</a>
	</div>
</body>
</html>