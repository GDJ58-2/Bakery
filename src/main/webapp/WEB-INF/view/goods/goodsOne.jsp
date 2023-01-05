<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goodsList.jsp</title>
</head>
<body>
	<h1>${map.goodsName}</h1>
	<br>
	<div style="color:red;">
	${msg}
	</div>
	<table border="1">
		<tr>
			<td rowspan="6">
				<img src="${pageContext.request.contextPath}/upload/${map.filename}" width="400" height="400">
			</td>
			<th>상품 이름 : </th>
			<td>${map.goodsName}</td>
		</tr>
		<tr>
			<th>상품 가격 : </th>
			<td>${map.goodsPrice}</td>
		</tr>
		<tr>
			<th>상품 재고 : </th>
			<td>${map.goodsStock}개</td>
		</tr>
		<tr>
			<th>작성 직원 : </th>
			<td>${map.empId}</td>
		</tr>
		<tr>
			<th>상품 순위 : </th>
			<td>${map.hit}위</td>
		</tr>
		<tr>
			<th>출시 일자 : </th>
			<td>${map.createdate}</td>
		</tr>
	</table>
	<div>
		<a href="${pageContext.request.contextPath}/ModifyGoodsController">수정</a>
		<a href="${pageContext.request.contextPath}/RemoveGoodsController">삭제</a>
	</div>
</body>
</html>