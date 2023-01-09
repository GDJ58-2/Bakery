<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyGoods.jsp</title>
</head>
<body>
	<h1>상품 수정</h1>
	<br>
	<div style="color:red;">
	${msg}
	</div>
	<form action="${pageContext.request.contextPath}/admin/goods/modifyGoods" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<td rowspan="8">
					<img src="${pageContext.request.contextPath}/upload/${map.filename}" width="400" height="400">
				</td>
				<th>상품 코드 : </th>
				<td>
					<input type="number" name="goodsCode" value="${map.goodsCode}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>상품 종류 : </th>
				<td>
					<select name="categoryNo">
						<option value="${map.categoryNo}">${map.categoryName}</option>
						<!-- 카테고리 리스트 만들면 현재 값 외의 옵션이 나오게 수정 필요-->
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
					<input type="text" name="goodsName" value="${map.goodsName}">
				</td>
			</tr>
			<tr>
				<th>상품 가격 : </th>
				<td>
					<input type="number" name="goodsPrice" value="${map.goodsPrice}">
				</td>
			</tr>
			<tr>
				<th>상품 재고 : </th>
				<td>
					<input type="number" name="goodsStock" value="${map.goodsStock}">
				</td>
			</tr>
			<tr>
				<th>직원 아이디 : </th>
				<td>
					<input type="text" name="empId" value="${map.empId}">
				</td>
			</tr>
			<tr>
				<th>상품 순위 : </th>
				<td>
					<input type="number" name="hit" value="${map.hit}">
				</td>
			</tr>
			<tr>
				<th>상품 이미지 : </th>
				<td>
					<input type="file" name="goodsImg">
				</td>
			</tr>
			<tr>
			<td colspan="3">
				<div>상품 설명 : </div>
				<textarea name="goodsContent" rows="5" cols="100">${map.goodsContent}</textarea>
			</td>
		</tr>
		</table>
		<button type="submit">상품수정</button>
	</form>
</body>
</html>