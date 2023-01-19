<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- Core JSTL 사용 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="Cake Template">
    <meta name="keywords" content="Cake, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>goodsList.jsp</title>
	
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#addressKind').change(function(){
			console.log($('#addressKind option:checked').text());
			let checkedAddress = $('#addressKind option:checked').val();
			if($('#addressKind option:checked').text()=='직접입력') {
				$('#address').prop('readonly',false);
			} else {
				$('#address').prop('readonly',true);
				
				$('#address').val(address);
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
	
	<!-- breadcrumb -->
	<div class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="breadcrumb__text">
						<h2>주문하기</h2>
					</div>
				</div>	
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="breadcrumb__links">
						<a href="">Home</a>
						<span>주문하기</span>
					</div>
				</div> 	
			</div>
		</div>
	</div>
	<!-- /breadcrumb -->
	
	<!-- 주문하기 section -->
	<section class="checkout spad">
		<div class="container">
			<div class="checkout__form">
				<form action="${pageContext.request.contextPath}/orders/addOrders" method="post" id="addOrdersBtn">
					<div class="row">
						<div class="col-lg-8 col-md-6">
							<h6 class="checkout__title">주문자 정보</h6>
							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											이름
											<span>*</span>
										</p>
										<input type="text" value="${loginCustomer.customerName}" readonly="readonly">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											휴대전화
											<span>*</span>	
										</p>
										<input type="text" value="${loginCustomer.customerPhone}" readonly="readonly">
									</div>
								</div>
							</div>
							<div class="checkout__input">
								<p>
									주소
									<span>*</span>
								</p>
								<select name="addressKind" id="addressKind">
									<c:forEach var="a" items="${addressList}">
										<option value="${a.addressKind}">${a.addressKind}</option>
									</c:forEach>
									<option value="직접입력">직접입력</option>
								</select>
								<c:forEach var="a" items="${addressList}">
									<input type="hidden" id="${a.addressKind}" value="${a.address}">
								</c:forEach>
								<input type="text" name="address" id="address" readonly="readonly">
							</div>
						</div>
						
						<div class="col-lg-4 col-md-6">
							<div class="checkout__order">
								<h6 class="order__title">order</h6>
								<div class="checkout__order__products">
									상품 
									<span>Total</span>
								</div>
								<ul class="checkout__total__products">
									<c:forEach var="o" items="${orderList}">
										<input type="hidden" name="goodsCode" value="${o.goodsCode}">
										<li>
											${o.goodsName}
											<span>&#8361;${o.goodsPrice*o.cartQuantity}</span>
										</li>
									</c:forEach>
								</ul>
								<ul class="checkout__total__all">
									<li>
										적립 예정 포인트
										<span>${saveupPoint}</span>										
									</li>
									<li>
										Total
										<span>&#8361;${orderPrice}</span>										
									</li>
								</ul>
								<button type="button" id="submitBtn" class="site-btn">주문하기</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
	
<!-- Js Plugins -->
<script src="${pageContext.request.contextPath}/resources/static/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/jquery.barfiller.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/jquery.slicknav.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/jquery.nicescroll.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/main.js"></script>
</body>
</html>