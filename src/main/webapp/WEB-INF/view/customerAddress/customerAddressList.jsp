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
	<table border="1">
		<tr>
			<th>주소 번호</th>
			<th>주소</th>
			<th>생성 날짜</th>
			<th>수정/삭제</th>
		</tr>
		<c:forEach var="ca" items="${list}">
			<tr>
				<td>
					${ca.addressCode}
				</td>
				<td>
					${ca.address}
				</td>
				<td>
					${ca.createdate}
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/customerAddress/modifyCustomerAddress">수정</a>
					<a href="${pageContext.request.contextPath}/customerAddress/removeCustomerAddress">삭제</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<a href="${pageContext.request.contextPath}/customerAddress/addCustomerAddress">추가</a>
</body>
</html>