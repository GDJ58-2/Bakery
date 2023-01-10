<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원정보수정</h2>
	<form action = "${pageContext.request.contextPath}/customer/modifyCustomer" method = "post" id = "modifyForm">
		<table>
			<tr>
				<td>ID</td>
				<td>
					<input type = "text" id = "id" name = "id" value = "${selectCustomer.customerId}" readonly = "readonly">
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
					<input type = "text" id = "name" name = "name" value = "${selectCustomer.customerName}">
				</td>
			</tr>
			<tr>
				<td>Phone Number</td>
				<td>
					<input type = "text" id = "phone" name = "phone" value = "${selectCustomer.customerPhone}">
				</td> 
			</tr>
		</table>
		<button type = "submit" id = "modifyBtn">정보수정</button>
	</form>
	
	<div>
		<a href = "${pageContext.request.contextPath}/customer/home">
			home
		</a>
	</div>
</body>
</html>