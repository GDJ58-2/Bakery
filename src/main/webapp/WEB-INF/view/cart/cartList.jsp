<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
		<c:when test = "${fn:length(userList) ne 0 || fn:length(customerList) ne 0}">
			<c:choose>
				<c:when test = "${userList ne null}">
						<table>
						<c:forEach var = "user" items = "${userList}">
							<tr>
								<td><input type="hidden" name="goodsCode" value="${user.goodsCode}"></td>
								<td><input type="checkbox" name="checkedGoodsCode" id = "checkGoodsCode" value="${user.goodsCode}"></td>
								<td><img src = "${pageContext.request.contextPath}/upload/${user.filename}" width = "50" height = "50"></td>
								<td><input type="text" name="goodsName" value="${user.goodsName}" readonly="readonly"></td>
								<td>
									<input type="number" name="cartQuantity" value = "${user.cartQuantity}" readonly ="readonly">개
									<a href = "${pageContext.request.contextPath}/cart/modifyCart"><button type = "button">수량변경</button></a>	
									<a href = "${pageContext.request.contextPath}/cart/removeCartList?goodsCode=${user.goodsCode}">
									 	<button type = "button">x</button>
									</a>
								</td>
							</tr>
						</c:forEach>
						</table>
				</c:when>
				<c:when test = "${customerList ne null && loginCustomer ne null}">
					<form action="${pageContext.request.contextPath}/orders/addOrdersList" method="post">
						<table>
						<c:forEach var = "customer" items = "${customerList}">
							<tr>
								<td><input type="hidden" name="goodsCode" value="${customer.goodsCode}"></td>
								<td><input type="checkbox" name="checkedGoodsCode" value="${customer.goodsCode}"></td>
								<td><img src = "${pageContext.request.contextPath}/upload/${customer.filename}" width = "50" height = "50"></td>
								<td><input type="text" name="goodsName" value="${customer.goodsName}" readonly="readonly"></td>
								<td>
									<input type="number" name="cartQuantity" value="${customer.cartQuantity}">개
									<a href = "${pageContext.request.contextPath}/cart/modifyCart"><button type = "button">수량변경</button></a>
									<a href = "${pageContext.request.contextPath}/cart/removeCartList?goodsCode=${customer.goodsCode}">
								 		<button type = "button">x</button>
									</a>
								</td>
							</tr>
						</c:forEach>
						</table>
						<button type = "submit">결제하기</button>
					</form>
				</c:when>
			</c:choose>
		</c:when>
		<c:when test = "${fn:length(userList) eq 0 || fn:length(customerList) eq 0}">
			<div>장바구니가 비어있습니다.</div>
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