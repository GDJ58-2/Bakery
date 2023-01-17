<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goodsOne.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	function checkNumber(event) {
		if(!((e.keyCode > 95 && e.keyCode < 106)
		      || (e.keyCode > 47 && e.keyCode < 58) 
		      || e.keyCode == 8)) {
		        return false;
		}
	}
	
	$(document).ready(function() {
		$('#cartBtn').click(function() {
			if($('#cartQuantity').val() == 0 || $('#cartQuantity').val() == '') {
				alert('상품의 개수를 선택하세요');
				$('#cartQuantity').val(1);
				$('#cartQuantity').focus();
			} else {
				$('#addCartForm').submit();
				alert('상품을 담았습니다');
			}
		});
	});
</script>
</head>
<body>
	<h1>${map.goodsName}</h1>
	<br>
	<div style="color:red;">
	${msg}
	</div>
	<form action="${pageContext.request.contextPath}/cart/addCart" method="get" id = "addCartForm">
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
				<input type="number" name="cartQuantity" id = "cartQuantity" value = "1" min = "1" max = "50" onkeypress = 'return checkNumber(event)'>개
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
	<button type="button" id = "cartBtn">장바구니 추가</button>
	</form>
	<div>
		<a href = "${pageContext.request.contextPath}/cart/cartList">
			장바구니
		</a>
	</div>
	
	<!-- 리뷰목록 -->
	<div>리뷰</div>
	<div>
	<table>
		<c:forEach var = "m" items = "${list}" varStatus = "i">
			<tr>
				<td>${m.reviewMemo}</td>
				<td>${m.customerId}</td>
				<td>
					<c:set var = "date" value = "${m.createdate}" />${fn:substring(date,0,10)}
				</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	<!-- 리뷰페이징 -->
	<div>
		<c:if test = "${currentPage > 1}">
			<a href = "${pageContext.request.contextPath}/goods/goodsOne?goodsCode=${map.goodsCode}&currentPage=${currentPage - 1}"><</a>
		</c:if>
		<c:choose>
			<c:when test = "${!empty list}">
				${currentPage}
			</c:when>
			<c:otherwise>
				아직 작성된 리뷰가 없습니다
			</c:otherwise>
		</c:choose>
		<c:if test = "${currentPage < endPage}">
			<a href = "${pageContext.request.contextPath}/goods/goodsOne?goodsCode=${map.goodsCode}&currentPage=${currentPage + 1}">></a>
		</c:if>
	</div>
</body>
</html>