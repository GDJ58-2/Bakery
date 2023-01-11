<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test = "${userList != null}">
			<table>
			<c:forEach var = "user" items = "${userList}">
				<tr>
					<td>${user.goodsCode}</td>
					<td>${user.goodsName}</td>
					<td>${user.goodsQuantity}</td>
				</tr>
			</c:forEach>
			</table>
		</c:when>
		<c:when test = "${customerList != null}">
			<table>
			<c:forEach var = "customer" items = "${customerList}">
				<tr>
					<td>${customer.goodsCode}</td>
					<td>${customer.goodsName}</td>
					<td>${customer.goodsQuantity}</td>
					<td>
						<c:if test = "${loginCustomer != null}">
							<a href = "${pageContext.request.contextPath}/orders/addOrders?goodsCode=${customer.goodsCode}&goodsName=${customer.goodsName}&goodsQuantity=${customer.goodsQuantity}">
								<button type = "button">결제하기</button>
							</a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
			</table>
		</c:when>
	</c:choose>
	
	<div>
		<c:if test = "${loginCustomer == null}">
			<a href ="${pageContext.request.contextPath}/customer/login">
				로그인
			</a>
		</c:if>
	</div>
</body>
</html>