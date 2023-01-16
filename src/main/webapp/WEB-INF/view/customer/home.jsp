<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$('#logoutBtn').click(function() {
			var out = confirm('로그아웃하시겠습니까?') 
			if(out == true) {
				alert('로그아웃되었습니다');
			} else {
				alert('로그아웃 취소');
				return false;
			}
		});
	});
</script>
</head>
<body>
	<div>
		${loginCustomer.customerName}님 반갑습니다
	</div>
	
	<!-- (임시)상품목록 -->
	<div>
		<a href = "${pageContext.request.contextPath}/goods/goodsList">
			<button type = "button" id = "goodsBtn">제품목록</button>
		</a>
	</div>
	
	<!-- 장바구니 조회 -->
	<div>
		<a href = "${pageContext.request.contextPath}/cart/cartList">
			<button type = "button" id = "cartBtn">장바구니</button>
		</a>
	</div>
	
	<!-- 주문 조회 -->
	<div>
		<a href = "${pageContext.request.contextPath}/orders/ordersList">
			<button type = "button" id = "cartBtn">주문목록</button>
		</a>
	</div>
	
	<!-- 회원정보조회 -->
	<div>
		<a href = "${pageContext.request.contextPath}/customer/selectOneCustomer">
			<button type = "button" id = "selectBtn">회원정보</button>
		</a>
	</div>
	<div>
		<a href = "${pageContext.request.contextPath}/question/questionList">
			<button type = "button" id = "selectBtn">내 문의내역</button>
		</a>
	</div>
	<!-- 로그아웃 -->
	<div>
		<a href = "${pageContext.request.contextPath}/customer/logout">
			<button type = "button" id = "logoutBtn">logout</button>
		</a>
	</div>
</body>
</html>