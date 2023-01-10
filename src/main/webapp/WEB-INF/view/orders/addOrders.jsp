<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> add order</h1>
	<form action="${pageContext.request.contextPath}/orders/addOrders" method="post">
		<input type="hidden" name="goodsCode" value="${g.goodsCode}">
		<table border="1">
			<tr>
				<th colspan="2">상품</th>
				<th>주문수량</th>
			</tr>
			<tr>
				<td><img src="${pageContext.request.contextPath}/upload/${g.filename}" width="100" height="100"></td>
				<td>${g.goodsName}</td>
				<td><input type="number" name="orderQuantity" value="${g.cartQuantity}"></td>
			</tr>
		</table>
		<table>
			<tr>
				<td>포인트 사용</td>
				<td><input type="number" name="usePoint" value="0">/${loginCustomer.point}</td>
			</tr>
			<tr>
				<td>포인트 적립 5%</td>
				<td><input type="text" name="saveupPoint" value="100"></td>
			</tr>
			<tr>
				<td>총 가격</td>
				<td><input type="number" name="orderPrice" value="${g.goodsPrice*g.cartQuantity}"></td>
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
</body>
</html>