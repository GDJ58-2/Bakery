<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goodsOneByAdmin.jsp</title>
</head>
<body>
	<h1>${map.goodsName}</h1>
	<br>
	<div style="color:red;">
	${msg}
	</div>
	<table border="1">
		<tr>
			<td rowspan="7">
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
			<td colspan="3">
				<div>상품 설명 : </div>
				<div>${map.goodsContent}</div>
			</td>
		</tr>
	</table>
	<div>
		<a href="${pageContext.request.contextPath}/admin/goods/modifyGoods?goodsCode=${map.goodsCode}">수정</a>
		<a href="${pageContext.request.contextPath}/admin/goods/removeGoods?goodsCode=${map.goodsCode}">삭제</a>
	</div>
	
	<!-- 리뷰목록 -->
	<div>
		<c:forEach var = "m" items = "${list}" varStatus = "i">
		<tr>
			<td>${m.customerId}</td>
			<td>${m.reviewMemo}</td>
		</tr>
		</c:forEach>
	</div>
</body>
</html>