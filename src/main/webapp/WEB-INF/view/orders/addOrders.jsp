<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- Core JSTL 사용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#addressKind').change(function(){
			console.log($('#addressKind option:selected').text());
			if($('#addressKind option:selected').text()=='직접입력') {
				$('#addressDiv').html('<textarea rows="5" cols="50" name="address"></textarea>');
			} else {
				$('#addressDiv').html('');
			}
		});
		$('#submitBtn').click(function(){
			if($('#usePoint').val().length==0) {
				$('#usePoint').val('0');
			}
			$('#addOrdersBtn').submit();
		});
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../inc/customer.jsp"></jsp:include>
	<jsp:include page="../inc/menu.jsp"></jsp:include>
	<h1> add order</h1>
	<form action="${pageContext.request.contextPath}/orders/addOrders" method="post" id="addOrdersBtn">
		<c:forEach var="o" items="${orderList}">
			<input type="hidden" name="goodsCode" value="${o.goodsCode}">
			<table border="1">
				<tr>
					<th colspan="2">상품</th>
					<th>주문수량</th>
				</tr>
				<tr>
					<td><img src="${pageContext.request.contextPath}/upload/${o.filename}" width="100" height="100"></td>
					<td>${o.goodsName}</td>
					<td><input type="number" name="cartQuantity" value="${o.cartQuantity}" readonly="readonly"></td>
				</tr>
			</table>
			<table>
				<tr>
					<td>구매확정 시 포인트 적립 5% 예정</td>
					<td><input type="number" name="saveupPoint" class="saveupPoint" value="${o.saveupPoint}" readonly="readonly"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="number" name="orderPrice" value="${o.goodsPrice*o.cartQuantity}" readonly="readonly"></td>
				</tr>
			</table>
		</c:forEach>
		<div>					
			포인트 사용
			<input type="number" name="usePoint" id="usePoint" value="0"> /${loginCustomer.point}
		</div>
		<div>
			가격 
			<input type="number" name="price" value="${orderPrice}" readonly="readonly">
		</div>
		<div>
			<!-- 직접입력 / 배송지 선택하기 -->
			<div>
				<select name="addressKind" id="addressKind">
					<c:forEach var="a" items="${addressList}">
						<option value="${a.addressKind}">${a.addressKind} - ${a.address}</option>
					</c:forEach>
					<option value="기타">직접입력</option>
				</select>
			</div>
			<div id="addressDiv"></div> 
		</div>
		<div>
			<button type="button" id="submitBtn">주문하기</button>
		</div>
	</form>
</body>
</html>