<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addCustomerAddress.jsp</title>
</head>
<body>
	<h1>주소 추가</h1>
	<br>
	<div style="color:red;">
	${msg}
	</div>
	<form action="${pageContext.request.contextPath}/customerAddress/addCustomerAddress" method="post">
		<input type="hidden" name="customerId" value="${customerId}">
		<table border="1">
			<tr>
				<th>주소 종류 : </th>
				<td>
					<select name="addressKind">
						<option value="집">집</option>
						<option value="회사">회사</option>
						<option value="기타">기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>주소 : </th>
				<td>
					<input type="text" name="address">
				</td>
			</tr>
		</table>
		<button type="submit">추가</button>
	</form>
</body>
</html>