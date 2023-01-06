<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action = "${pageContext.request.contextPath}/customer/removeCustomer" method = "post" id = "removeForm">
		<div>탈퇴를 위해 비밀번호를 입력하세요</div>
		<div>
			<input type = "password" id = "pw" name = "pw">
		</div>
		<button type = "submit" id = "removeBtn">회원탈퇴</button>
	</form>
</body>
</html>