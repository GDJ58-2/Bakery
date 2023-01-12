<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원가입</h2>
	<form action = "${pageContext.request.contextPath}/customer/addCustomer" method = "post" id = "loginForm">
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
			<tr>
				<td>Name</td>
				<td>
					<input type = "text" id = "name" name = "name">
				</td>
			</tr>
			<tr>
				<td>Phone Number</td>
				<td>
					<input type = "text" id = "phone" name = "phone1">-<input type = "text" id = "phone" name = "phone2">-<input type = "text" id = "phone" name = "phone3">
				</td> 
			</tr>
			<tr>
				<td>Address</td>
				<td>
					<input type = "radio" id = "addressKind" name = "addressKind" value = "집">집
					<input type = "radio" id = "addressKind" name = "addressKind" value = "회사">회사
					<input type = "text" id = "address" name = "address">
				</td>
			</tr>
		</table>
		<button type = "submit" id = "createBtn">create</button>
	</form>
	<a href = "${pageContext.request.contextPath}/customer/login">
		<button type = "button" id = "loginBtn">login</button>
	</a>
</body>
</html>