<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../inc/customer.jsp"></jsp:include>
	<jsp:include page="../inc/menu.jsp"></jsp:include>
	<h2>addReview</h2>
	<form action = "${pageContext.request.contextPath}/review/addReview" method = "post" id = "addForm">
		<input type = "hidden" name = "orderCode" value = "${map.orderCode}">
		<table border = "1">
			<tr>
				<td>${map.orderCode} / ${map.goodsName}</td>
			</tr>
			<tr>
				<td>review</td>
				<td>
					<input type = "text" id = "reviewMemo" name = "reviewMemo">
				</td>
			</tr>
		</table>
		<button type = "submit" id = "addBtn">리뷰등록</button>
	</form>
	
	<div>
		<a href = "${pageContext.request.contextPath}/customer/home">
			home
		</a>
	</div>
</body>
</html>