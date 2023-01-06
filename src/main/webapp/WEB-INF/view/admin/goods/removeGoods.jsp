<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goodsList.jsp</title>
</head>
<body>
	<h1>상품 삭제</h1>
	<br>
	<div style="color:red;">
	${msg}
	</div>
	<form action="${pageContext.request.contextPath}/admin/goods/removeGoods" method="post">
		<table border="1">
			<tr>
				<td rowspan="9">
					<img src="${pageContext.request.contextPath}/upload/${map.filename}" width="400" height="400">
				</td>
				<th>상품 코드 : </th>
				<td>
					${map.goodsCode}
					<input type="hidden" name="goodsCode" value="${map.goodsCode}">
				</td>
			</tr>
			<tr>
				<th>상품 종류 : </th>
				<td>${map.categoryKind} ${map.categoryName}</td>
			</tr>
			<tr>
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
			<tr>
				<th>비밀 번호 입력 : </th>
				<td>
					<input type="password" name="empPw">
				</td>
			</tr>
			<tr>
			<td colspan="3">
				<div>상품 설명 : </div>
				<div>${map.goodsContent}</div>
			</td>
		</tr>
		</table>
		<button type="submit">상품삭제</button>
	</form>
</body>
</html>