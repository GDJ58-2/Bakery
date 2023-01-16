<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyCustomerAddress.jsp</title>
</head>
<body>
	<h1>주소 수정</h1>
	<br>
	<div style="color:red;">
	${msg}
	</div>
	<form action="${pageContext.request.contextPath}/customerAddress/modifyCustomerAddress" method="post">
		<input type="hidden" name="addressCode" value="${ca.addressCode}">
		<table border="1">
			<tr>
				<th>주소 이름 : </th>
				<td>
					<input type="text" name="addressKind" value="${ca.addressKind}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>주소 : </th>
				<td>
					<input type="text" name="address" value="${ca.address}">
				</td>
			</tr>
			<tr>
				<th>생성 날짜 : </th>
				<td>${ca.createdate}</td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>