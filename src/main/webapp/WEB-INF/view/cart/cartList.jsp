<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../inc/customer.jsp"></jsp:include>
	<jsp:include page="../inc/menu.jsp"></jsp:include>
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
			<form action="${pageContext.request.contextPath}/cart/modifyCart" method="post">
				<table>
				<c:forEach var = "customer" items = "${customerList}">
					<tr>
						<td><input type="hidden" name="goodsCode" value="${customer.goodsCode}"></td>
						<td><input type="checkbox" name="checkedGoodsCode" value="${customer.goodsCode}"></td>
						<td><input type="text" name="goodsName" value="${customer.goodsName}" readonly="readonly"></td>
						<td><input type="number" name="cartQuantity" value="${customer.cartQuantity}">개</td>
					</tr>
				</c:forEach>
				</table>
				<c:if test = "${loginCustomer != null}">
					<button type = "submit">결제하기</button>
				</c:if>
			</form>
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