<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ordersOne.jsp</title>
</head>
<body>
	<h1>주문상세</h1>
	<h3>주문 날짜 ${map.createdate} 주문 번호 ${map.orderCode}</h3>
	<br>
	<div style="color:red;">
	${msg}
	</div>
	<table border="1">
		<tr>
			<th>상품 번호 : </th>
			<td>${map.goodsCode}</td>
		</tr>
		<tr>
			<th>상품 이미지 : </th>
			<td>
				<img src="${pageContext.request.contextPath}/upload/${map.filename}" width="400" height="400">
			</td>
		</tr>
		<tr>
			<th>상품 이름 : </th>
			<td>${map.goodsName}</td>
		</tr>
		<tr>
			<th>상품 종류 : </th>
			<td>${map.categoryName}</td>
		</tr>
		<tr>
			<th>상품 수량 : </th>
			<td>${map.orderQuantity}개</td>
		</tr>
		<tr>
			<th>상품 가격 : </th>
			<td>${map.goodsPrice}</td>
		</tr>
		<tr>
			<th>상품 배송상태 : </th>
			<td>${map.orderState}</td>
		</tr>
		<tr>
			<th>주문 날짜 : </th>
			<td>${map.createdate}</td>
		</tr>
		<tr>
			<th>총 가격 : </th>
			<td>${map.orderPrice}</td>
		</tr>
		<tr>
			<th>리뷰 작성 : </th>
			<td>
				<a href="${pageContext.request.contextPath}/orders/modifyOrders?orderCode=${map.orderCode}">주문 수정</a>
			</td>
		</tr>
		<tr>
			<th>배송 문의 : </th>
			<td>
				<a href="${pageContext.request.contextPath}/question/addQuestion?orderCode=${map.orderCode}">주문 수정</a>
			</td>
		</tr>
		<tr>
			<th>구매 확정 : </th>
			<td>
				<a href="${pageContext.request.contextPath}/orders/modifyOrders?orderCode=${map.orderCode}">주문 수정</a>
			</td>
		</tr>
	</table>
	
	<h3>받는 사람 정보</h3>
	<table>
		<tr>
			<th>고객 아이디 : </th>
			<td>${map.customerId}</td>
		</tr>
		<tr>
			<th>고객 이름 : </th>
			<td>${map.customerName}</td>
		</tr>
		<tr>
			<th>고객 전화번호 : </th>
			<td>${map.customerPhone}</td>
		</tr>
		<tr>
			<th>받는 주소 : </th>
			<td>${map.address}</td>
		</tr>
	</table>
	
	<div>
		<a href="${pageContext.request.contextPath}/orders/modifyOrders?orderCode=${map.orderCode}">주문 수정</a>
		<a href="${pageContext.request.contextPath}/orders/removeOrders?orderCode=${map.orderCode}">주문 취소</a>
	</div>
</body>
</html>