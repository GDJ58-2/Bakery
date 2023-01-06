<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>My Page</h2>
	<table>
		<tr>
			<td>ID</td>
			<td>${selectOneCustomer.customerId}</td>
		</tr>
		<tr>
			<td>Name</td>
			<td>${selectOneCustomer.customerName}</td>
		</tr>
		<tr>
			<td>Phone Number</td>
			<td>${selectOneCustomer.customerPhone}</td>
		</tr>
	</table>
	<a href = "${pageContext.request.contextPath}/customer/modifyCustomer">
		<button type = "button" id = modifyBtn>회원정보수정</button> 
	</a>
	<a href = "${pageContext.request.contextPath}/customer/modifyCustomerPw">
		<button type = "button" id = modifyPwBtn>비밀번호수정</button> 
	</a>
	<a href = "${pageContext.request.contextPath}/customer/removeCustomer">
		<button type = "button" id = removeBtn>회원탈퇴</button> 
	</a>
</body>
</html>