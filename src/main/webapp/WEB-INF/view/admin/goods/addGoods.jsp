<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addGoods.jsp</title>
</head>
<body>
	<h1>상품 등록</h1>
	<form action="${pageContext.request.contextPath}/admin/goods/addGoods" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th>상품 이름 : </th>
				<td>
					<input type="text" name="goodsName">
				</td>
			</tr>
			<tr>
				<th>상품 가격 : </th>
				<td>
					<input type="number" name="goodsPrice">
				</td>
			</tr>
			<tr>
				<th>상품 재고 : </th>
				<td>
					<input type="number" name="goodsStock">
				</td>
			</tr>
			<tr>
				<th>직원 아이디 : </th>
				<td>
					<input type="text" name="empId">
				</td>
			</tr>
			<tr>
				<th>히트 : </th>
				<td>
					<input type="number" name="hit">
				</td>
			</tr>
			<tr>
				<th>상품 이미지 : </th>
				<td>
					<input type="file" name="goodsImg">
				</td>
			</tr>
		</table>
		<button type="submit">상품등록</button>
	</form>
</body>
</html>