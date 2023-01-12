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
	<h3>ModifyReview</h3>
	<form action = "${pageContext.request.contextPath}/review/modifyReview" method = "post" id = "modifyForm">
		<input type = "hidden" name = "orderCode" value = "${map.orderCode}">
		<table border = "1">
			<tr>
				<td>${map.orderCode} / ${map.goodsName}</td>
			</tr>
			<tr>
				<td>review</td>
				<td>
					<input type = "text" id = "reviewMemo" name = "reviewMemo" value = "${map.reviewMemo}">
				</td>
			</tr>
		</table>
		<button type = "submit" id = "modifyBtn">리뷰수정</button>
	</form>
	
	<div>
		<a href = "${pageContext.request.contextPath}/customer/home">
			home
		</a>
	</div>
</body>
</html>