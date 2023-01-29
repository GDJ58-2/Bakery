<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="Cake Template">
    <meta name="keywords" content="Cake, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	
	<!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800;900&display=swap"
    rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/barfiller.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/style.css" type="text/css">
    <!-- custom css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/custom/customStyle.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<title>orders</title>
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
	<div class="wrap">
		<jsp:include page="../../inc/empMenu.jsp"></jsp:include>
		<jsp:include page="../../inc/menu.jsp"></jsp:include>
		
		<!-- breadcrumb -->
		<div class="breadcrumb-option">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="breadcrumb__text">
							<h2>주문관리</h2>
						</div>
					</div>	
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="breadcrumb__links">
							<a href="">Home</a>
							<span>목록</span>
						</div>
					</div> 	
				</div>
			</div>
		</div>
		<!-- /breadcrumb -->
		
		<!-- orders section -->
		<section class="blog-details spad">
			<div class="content">
				<div class="row d-flex justify-content-center">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-header">
								<div class="p-4">
									<div class="row">
										<!-- 달력 페이징 -->
										<h2>${year}-${month}</h2>
										<a href="${pageContext.request.contextPath}/admin/orders/modifyOrders?orderState=${orderState}&year=${year}&month=${month-1}&date=${maxDate}">이전 달</a>
										<a href="${pageContext.request.contextPath}/admin/orders/modifyOrders?year=${year}&month=${month+1}&date=${maxDate}">다음 달</a>
									</div>
								</div>
							</div>
							
							<div class="card-body">
								<!-- 날짜변경 form -->
								<form action="${pageContext.request.contextPath}/admin/orders/modifyOrders" method="post" id="modifyForm">
									<!-- javascript ; button click시 button의 value를 hidden value에 추가 -> 폼넘기기 -->
									<div>
										<input type="hidden" name="orderState" id="orderState">
										<button type="button" class="submitBtn" value="">전체주문</button>
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
									<!-- ordersList -->
									<table class="table table-bordered text-center">
										<thead class="table-primary">
											<tr>
												<th>
													주문 번호
													<br> 주문자
													<br> 연락처	
												</th>
												<th>&nbsp;</th>
												<th>상품 번호</th>
												<th>주문일</th>
												<th>상품 이름 </th>
												<th>
													총 수량 
													<br> 결제액
												</th>
												<th>상품 배송상태 </th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="map" items="${ordersList}">
												<tr>
													<td>
														${map.orderCode}
														<br> ${map.customerId}
														<br> 
													</td>
													<td>
														<c:if test="${map.orderState eq '구매확정'}">
															&nbsp;
														</c:if>
														<c:if test="${map.orderState ne '구매확정'}">
															<input type="checkbox" name="orderCode" value="${map.orderCode}" class="checkOrderCode">
														</c:if>
													</td>
													<td>${map.goodsCode}</td>
													<td>${map.createdate}</td>
													<td>${map.goodsName}</td>
													<td class="text-right">
														${map.orderQuantity}개
														<br>${map.orderPrice}원
													</td>
													<td>${map.orderState}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

<!-- Js Plugins -->
<script src="${pageContext.request.contextPath}/resources/static/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/jquery.nice-select.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/jquery.barfiller.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/jquery.slicknav.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/jquery.nicescroll.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/main.js"></script>
</body>
</html>