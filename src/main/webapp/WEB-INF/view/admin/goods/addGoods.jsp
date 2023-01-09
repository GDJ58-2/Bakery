<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addGoods.jsp</title>
</head>
<body>
	<h1>상품 등록</h1>
	<br>
	<div style="color:red;">
	${msg}
	</div>
	<form action="${pageContext.request.contextPath}/admin/goods/addGoods" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<th>상품 종류 : </th>
				<td>
					<select name="categoryNo">
						<option value="1">식빵</option>
						<option value="2">간식빵</option>
						<option value="3">파이</option>
						<option value="4">도넛</option>
						<option value="5">생크림케이크</option>
						<option value="6">스페셜케이크</option>
						<option value="7">조각케이크</option>
						<option value="8">샌드위치</option>
						<option value="9">샐러드</option>
						<option value="10">디저트</option>
						<option value="11">티</option>
						<option value="12">에이드</option>
					</select>
				</td>
			</tr>
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
				<th>상품 설명 : </th>
				<td>
					<textarea name="goodsContent" rows="10" cols="50"></textarea>
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
				<th>상품 순위 : </th>
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