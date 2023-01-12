<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyOrders</title>
</head>
<body>
	<jsp:include page="../inc/empMenu.jsp"></jsp:include>
	<jsp:include page="../inc/customer.jsp"></jsp:include>
	<jsp:include page="../inc/menu.jsp"></jsp:include>
	<!-- 관리자페이지 -->
	<h1>주문상세</h1>
	<h3>주문 날짜 ${map.createdate} 주문 번호 ${map.orderCode}</h3>
	<br>
	<div style="color:red;">
	${msg}
	</div>
	<form action="${pageContext.request.contextPath}/orders/modifyOrders" method="post">
		<input type="hidden" name="orderCode" value="${map.orderCode}">
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
				<td><input type="number" name="orderQuantity" value="${map.orderQuantity}">개</td>
			</tr>
			<tr>
				<th>상품 가격 : </th>
				<td><input type="number" name="orderPrice" value="${map.orderPrice}"></td>
			</tr>
			<tr>
				<th>상품 배송상태 : </th>
				<td><input type="text" name="orderState" value="${map.orderState}"></td> <!-- 배송, 교환, 환불 -->
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
				<th>리뷰 작성 : </th> <!-- 작성된 리뷰 보기 -->
				<td>
					<a href="${pageContext.request.contextPath}/orders/modifyOrders?orderCode=${map.orderCode}">주문 수정</a>
				</td>
			</tr>
			<tr>
				<th>문의 : </th> <!-- 문의 보기  -->
				<td>
					<a href="${pageContext.request.contextPath}/question/addQuestion?orderCode=${map.orderCode}">주문 수정</a>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td> <!-- 구매확정 버튼 -->
				<td><button type="submit">수정</button></td>
			</tr>
		</table>
	</form>
	
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
</body>
</html>