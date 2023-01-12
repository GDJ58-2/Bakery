<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ordersList.jsp</title>
</head>
<body>
<h1>나의 주문 내역</h1>
	<table border="1">
		<tr>
			<th>주문 번호</th>
			<th>상품</th>
			<th>상품 이름</th>
			<th>주문 수량</th>
			<th>주문 가격</th>
			<th>주문 날짜</th>
			<th>주문 상태</th>
		</tr>
		<c:forEach var="m" items="${list}">
			<tr>
				<td>
					<a href="${pageContext.request.contextPath}/orders/ordersOne?orderCode=${m.orderCode}&createdate=${m.createdate}">
						${m.orderCode}
					</a>
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/orders/ordersOne?orderCode=${m.orderCode}&createdate=${m.createdate}">
						<img src="${pageContext.request.contextPath}/upload/${m.filename}" width="200" height="200">
					</a>
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/orders/ordersOne?orderCode=${m.orderCode}&createdate=${m.createdate}">
						${m.goodsName}
					</a>
				</td>
				<td>
					${m.orderQuantity}개
				</td>
				<td>
					${m.orderPrice}원
				</td>
				<td>
					${m.createdate}
				</td>
				<td>
					${m.orderState}
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>