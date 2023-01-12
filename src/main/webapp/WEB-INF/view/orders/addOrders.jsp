<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- Core JSTL 사용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../inc/customer.jsp"></jsp:include>
	<jsp:include page="../inc/menu.jsp"></jsp:include>
	<h1> add order</h1>
	<form action="${pageContext.request.contextPath}/cart/modifyCart" method="post">
		<c:forEach var="o" items="${orderList}">
			<input type="hidden" name="goodsCode" value="${o.goodsCode}">
			<table border="1">
				<tr>
					<th colspan="2">상품</th>
					<th>주문수량</th>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/upload/${o.filename}" width="100" height="100"></td>
					<td>${o.goodsName}</td>
					<td><input type="number" name="cartQuantity" value="${o.cartQuantity}"></td>
				</tr>
			</table>
			<table>
				<tr>
					<td>포인트 적립 5%</td>
					<td><input type="number" name="saveupPoint" value="${o.goodsPrice*o.cartQuantity/20}"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="number" name="orderPrice" value="${o.goodsPrice*o.cartQuantity}" readonly="readonly"></td>
				</tr>
			</table>
		</c:forEach>
		<div>					
			포인트 사용
			<input type="number" name="usePoint" value="0">/${loginCustomer.point}
		</div>
		<div>
			가격 
			<input type="number" name="price" value="${orderPrice}">
		</div>
		<div>
			<div>
				<select name="addressKind">
					<c:forEach var="a" items="${addressList}">
						<option value="${a.addressKind}">${a.addressKind} - ${a.address}</option>
					</c:forEach>
					<option value="기타">직접입력</option>
				</select>
			</div>
			<!-- 직접입력 선택시 textarea 생성 -->
			<textarea rows="5" cols="50" name="address"></textarea> 
		</div>
		<div>
			<button type="submit">주문하기</button>
		</div>
	</form>
</body>
</html>