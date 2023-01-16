<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goodsOne.jsp</title>
</head>
<body>
	<h1>${map.goodsName}</h1>
	<br>
	<div style="color:red;">
	${msg}
	</div>
	<form action="${pageContext.request.contextPath}/cart/addCart" method="get">
	<input type="hidden" name="goodsCode" value="${map.goodsCode}">
	<table border="1">
		<tr>
			<td rowspan="5">
				<img src="${pageContext.request.contextPath}/upload/${map.filename}" width="400" height="400">
			</td>
			<th>상품 이름 : </th>
			<td>${map.goodsName}</td>
		</tr>
		<tr>
			<th>상품 종류 : </th>
			<td>${map.categoryName}</td>
		</tr>
		<tr>
			<th>상품 가격 : </th>
			<td>${map.goodsPrice}원</td>
		</tr>
		<tr>
			<th>상품 개수 : </th>
			<td>
				<input type="number" name="cartQuantity">개
			</td>
		</tr>
		<tr>
			<th>상품 재고 : </th>
			<td>${map.goodsStock}개</td>
		</tr>
		<tr>
			<td colspan="3">
				<div>상품 설명 : </div>
				<div>${map.goodsContent}</div>
			</td>
		</tr>
	</table>
	<button type="submit">장바구니 추가</button>
	</form>
	<div>
		<a href = "${pageContext.request.contextPath}/cart/cartList">
			장바구니
		</a>
	</div>
	
	<!-- 리뷰목록 -->
	<div>
	<table>
		<c:forEach var = "m" items = "${list}" varStatus = "i">
			<tr>
				<td>${m.customerId}</td>
				<td>${m.reviewMemo}</td>
			</tr>
		</c:forEach>
	</table>
	</div>
</body>
</html>