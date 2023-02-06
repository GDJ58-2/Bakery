<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- Core JSTL 사용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/style.css" type="text/css">
	<!-- custom css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/custom/customStyle.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		// 주소 입력
		$('input[name="addressKind"]').change(function(){
			console.log($('input[name="addressKind"]:checked').val());
			if($('input[name="addressKind"]:checked').val()=='직접입력') {
				$('input[name="address"]').attr("readonly", false);
			} else {
				$('input[name="address"]').attr("readonly", true);
			}
		});
		
		// 포인트
		$('#usePoint').blur(function(){
			let orderPrice = $('#orderPrice').val();
			let usePoint = $('#usePoint').val();
			let total = orderPrice - usePoint;
			
			// 보유포인트보다 사용포인트가 많을 경우
			console.log(parseInt(usePoint) > parseInt($('input[name="point"]').val()));
			
			if(parseInt(usePoint) > parseInt($('input[name="point"]').val())){
				$('#usePoint').val($('input[name="point"]').val());
			}
			
			// 총 결제 금액에 사용 포인트 적용
			if(usePoint!=0) {
				$('#point').html('포인트 사용 <span>'+$('#usePoint').val()+'</span>');
				$('#total').html('&#8361;'+Number(total).toLocaleString('us')+'원');
			} else {
				$('#point').html('');
				$('#total').html('&#8361;'+Number(orderPrice).toLocaleString('us')+'원');
			}
		});
		
		// 
		$('#submitBtn').click(function(){
			if($('input:radio[name="addressKind"]:checked').length==0){
				alert('주소를 입력해주세요.');
				return;
			}
			if($('#usePoint').val().length==0) {
				$('#usePoint').val('0');
			}
			$('#addOrdersForm').submit();
		});
	});
</script>
<title>주문 | 구디쥬르</title>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
	
	<!-- breadcrumb -->
	<div class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="breadcrumb__text">
						<h2>주문/결제</h2>
					</div>
				</div>	
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="breadcrumb__links">
						<a href="">Home</a>
						<span>주문/결제</span>
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
				<form action="${pageContext.request.contextPath}/orders/addOrders" method="post" id="addOrdersForm">
					<div class="row">
						<div class="col-lg-8 col-md-6">
							<h6 class="checkout__title">배송지 정보</h6>
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
								<c:forEach var="a" items="${addressList}" varStatus="status">
									<div class="row" style="margin-right:0px;">
									   	<input type="radio" name="addressKind" value="${a.addressKind}" id="a${status.count}">
									   	<label for="a${status.count}"><span>${a.addressKind}</span> ${a.address}</label>
									</div>
								</c:forEach>
								<div class="row" style="margin-right:0px;">
									<input type="radio" name="addressKind" value="직접입력" id="direct">
									<label for="direct"><span>직접입력</span></label>
									<input type="text" name="address" readonly="readonly" style="margin-left:8%">
								</div>
							</div>
							<h6 class="checkout__title">포인트</h6>
							<div class="checkout__input">
								<p>
									보유포인트
								</p>
								<input type="number" name="point" readonly="readonly" value="${loginCustomer.point}"> 원
							</div>
							<div class="checkout__input">
								<p>
									사용
								</p>
								<input type="number" name="usePoint" id="usePoint" value="0"> 원
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
										<input type="hidden" name="cartQuantity" value="${o.cartQuantity}">
										<li>
											${o.goodsName}
											<span>&#8361;<fmt:formatNumber value="${o.goodsPrice * o.cartQuantity}" pattern="#,###원" /></span>
										</li>
									</c:forEach>
								</ul>
								<ul class="checkout__total__all">
									<li>
										SubTotal
										<span>&#8361;<fmt:formatNumber value="${orderPrice}" pattern="#,###원" /></span>										
									</li>
									<li>
										적립 예정 포인트
										<span>${saveupPoint}</span>										
									</li>
									<li>	
										<div id="point"></div>			
									</li>
									<li>
										Total
										<input type="hidden" id="orderPrice" value="${orderPrice}">
										<span id="total">&#8361;<fmt:formatNumber value="${orderPrice}" pattern="#,###원" /></span>										
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
	
	
	<!-- footer -->
	<div>
		<c:import url="/WEB-INF/view/inc/footer.jsp"></c:import>
	</div>
	
<!-- Js Plugins -->
<script src="${pageContext.request.contextPath}/resources/static/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/jquery.barfiller.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/jquery.nice-select.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/jquery.slicknav.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/jquery.nicescroll.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/main.js"></script>
</body>
</html>