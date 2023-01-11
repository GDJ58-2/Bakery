<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- Core JSTL 사용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> add order</h1>
	<c:forEach var="o" items="${list}">
		<form action="${pageContext.request.contextPath}/orders/addOrders" method="post">
			<input type="hidden" name="goodsCode" value="${o.goodsCode}">
			<table border="1">
				<tr>
					<th colspan="2">상품</th>
					<th>주문수량</th>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/upload/${o.filename}" width="100" height="100"></td>
					<td>${o.goodsName}</td>
					<td><input type="number" name="orderQuantity" value="${o.cartQuantity}"></td>
				</tr>
			</table>
			<table>
				<tr>
					<td>포인트 사용</td>
					<td><input type="number" name="usePoint" value="0">/${loginCustomer.point}</td>
				</tr>
				<tr>
					<td>포인트 적립 5%</td>
					<td><input type="number" name="saveupPoint" value="${o.goodsPrice*o.cartQuantity/20}" id="point"></td>
				</tr>
				<tr>
					<td>총 가격</td>
					<td><input type="number" name="orderPrice" value="${o.goodsPrice*o.cartQuantity}"></td>
				</tr>
			</table>
			<table>
				<tr>
					<td>주소 입력</td>
					<td><textarea cols="50" rows="5" name="address"></textarea></td>
				</tr>
			</table>
			
			<div>
				<button type="submit">주문하기</button>
			</div>
		</form>
	</c:forEach>
</body>
</html>