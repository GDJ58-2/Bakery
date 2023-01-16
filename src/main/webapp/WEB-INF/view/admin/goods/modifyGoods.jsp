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
					<select name= "categoryNo" id="categoryNo">
						<option value="${map.categoryNo}">
							${map.categoryKind} ${map.categoryName}
						</option>
						<c:forEach var="gc" items="${list}">
							<c:if test="${gc.categoryNo != map.categoryNo}">
								<option value="${gc.categoryNo}">
									${gc.categoryKind} ${gc.categoryName}
								</option>
							</c:if>
						</c:forEach>
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