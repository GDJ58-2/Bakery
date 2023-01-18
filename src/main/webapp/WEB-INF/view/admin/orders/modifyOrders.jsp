<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyOrders</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('.submitBtn').click(function(){
			//console.log($(this).attr('value'));
			$('#orderState').val($(this).attr('value'));
			if($('.checkOrderCode:checked').length==0) {
				let orderState = $('#orderState').val();
				let date = $('#date option:selected').val();
				location.href='/bakery/admin/orders/modifyOrders?orderState='+orderState+'&year='+$('#year').val()+'&month='+$('#month').val()+'&date='+date;
				return;
			}
			$('#modifyForm').submit();
		});
		$('#date').change(function(){
			console.log($('#date option:selected').val());
			let orderState = $('#orderState').val();
			let date = $('#date option:selected').val();
			console.log(orderState);
			console.log(date);
			location.href='/bakery/admin/orders/modifyOrders?orderState='+orderState+'&year='+$('#year').val()+'&month='+$('#month').val()+'&date='+date;
			return;
		});
	});
</script>
</head>
<body>
	<!-- 뷰 수정 -- 폼버튼만들기 -->
	<jsp:include page="../../inc/empMenu.jsp"></jsp:include>
	<jsp:include page="../../inc/customer.jsp"></jsp:include>
	<jsp:include page="../../inc/menu.jsp"></jsp:include>
	<h1>관리자-주문관리</h1>
	<h2>${year}-${month}</h2>
	<!-- 달력 페이징 -->
	<a href="${pageContext.request.contextPath}/admin/orders/modifyOrders?orderState=${orderState}&year=${year}&month=${month-1}&date=${maxDate}">이전 달</a>
	<a href="${pageContext.request.contextPath}/admin/orders/modifyOrders?year=${year}&month=${month+1}&date=${maxDate}">다음 달</a>
	<br>
	<form action="${pageContext.request.contextPath}/admin/orders/modifyOrders" method="post" id="modifyForm">
		<!-- javascript ; button click시 button의 value를 hidden value에 추가 -> 폼넘기기 -->
		<div>
			<input type="hidden" name="orderState" id="orderState">
			<button type="button" class="submitBtn" value="결제">결제</button>
			<button type="button" class="submitBtn" value="취소">취소</button>
			<button type="button" class="submitBtn" value="배송중">배송중</button>
			<button type="button" class="submitBtn" value="배송완료">배송완료</button>
			<button type="button" class="submitBtn" value="구매확정">구매확정</button>
		</div>
		<div>
			<input type="hidden" name="year" value="${year}" id="year">
			<input type="hidden" name="month" value="${month}" id="month">
			<select name="date" id="date">
				<c:forEach var="d" begin="${minDate}" end="${maxDate}" step="1">
					<c:if test="${date eq maxDate-d+1}">
						<option value="${maxDate-d+1}" selected="selected">${year}-${month}-${maxDate-d+1}</option>
					</c:if>
					<c:if test="${date ne maxDate-d+1}">
						<option value="${maxDate-d+1}">${year}-${month}-${maxDate-d+1}</option>
					</c:if>
				</c:forEach>
			</select>
		</div>
		<table border="1">
			<thead>
				<tr>
					<th>#</th>
					<th>주문 번호</th>
					<th>고객 아이디</th>
					<th>상품 번호</th>
					<th>상품 이미지 </th>
					<th>상품 이름 </th>
					<th>상품 수량 </th>
					<th>총 가격 </th>
					<th>상품 배송상태 </th>
					<th>주문 날짜 </th>
					<th>리뷰 작성 </th>
					<th>문의 </th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="map" items="${ordersList}">
					<tr>
						<td>
							<c:if test="${map.orderState eq '구매확정'}">
								&nbsp;
							</c:if>
							<c:if test="${map.orderState ne '구매확정'}">
								<input type="checkbox" name="orderCode" value="${map.orderCode}" class="checkOrderCode">
							</c:if>
						</td>
						<td>${map.orderCode}</td>
						<td>${map.customerId}</td>
						<td>${map.goodsCode}</td>
						<td>
							<img src="${pageContext.request.contextPath}/upload/${map.filename}" width="100" height="100">
						</td>
						<td>${map.goodsName}</td>
						<td>${map.orderQuantity}개</td>
						<td>${map.orderPrice}원</td>
						<td>${map.orderState}</td>
						<td>${map.createdate}</td>
						<!-- 작성된 리뷰 보기 -->
						<td><a href="${pageContext.request.contextPath}/orders/modifyOrders?orderCode=${map.orderCode}">주문 수정</a></td>
						<!-- 문의 보기  -->
						<td><a href="${pageContext.request.contextPath}/question/addQuestion?orderCode=${map.orderCode}">주문 수정</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
</body>
</html>