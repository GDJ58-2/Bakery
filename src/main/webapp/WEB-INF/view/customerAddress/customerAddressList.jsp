<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>customerAddressList.jsp</title>
</head>
<body>
	<h1>나의 주소 목록</h1>
	<br>
	<div style="color:red;">
	${msg}
	</div>
	<table border="1">
		<tr>
			<th>주소 종류</th>
			<th>주소</th>
			<th>생성 날짜</th>
			<th>수정</th>
		</tr>
		<c:forEach var="ca" items="${list}">
			<tr>
				<td>
					${ca.addressKind}
				</td>
				<td>
					${ca.address}
				</td>
				<td>
					${ca.createdate}
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/customerAddress/modifyCustomerAddress?addressCode=${ca.addressCode}">수정</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<a href="${pageContext.request.contextPath}/customerAddress/addCustomerAddress">추가</a>
</body>
</html>