<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>login</h2>
	<form action = "${pageContext.request.contextPath}/customer/login" method = "post" id = "loginForm">
		<table>
			<tr>
				<td>ID</td>
				<td>
					<input type = "text" id = "id" name = "id">
				</td>
			</tr>
			<tr>
				<td>PW</td>
				<td>
					<input type = "password" id = "pw" name = "pw">
				</td>
			</tr>
		</table>
		<button type = "submit" id = "loginBtn">login</button>
	</form>
	<a href = "${pageContext.request.contextPath}/customer/addCustomer">
		<button type = "button" id = "createBtn">create account</button>
	</a>
</body>
</html>