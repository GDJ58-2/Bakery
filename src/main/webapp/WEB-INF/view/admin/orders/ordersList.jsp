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
		
		// nav 
		
		// 전체선택
		$('#allcheck').click(function(){
			if($('#allcheck').is(':checked')) { // .is(':checked') : 체크 여부 확인. checked -> true
				$('input[type="checkbox"]').prop('checked', true);	
			} else {
				$('input[type="checkbox"]').prop('checked', false);
			}
		});
		
		// 검색기능
		if($('#searchKind').val()!=''){
			$('select[name="searchKind"]').val($('#searchKind').val()).prop('selected', true);	
		}
		$('select[name="searchKind"]').change(function(){
			if($('select[name="searchKind"]').val()=='c.customer_phone'){
				$('input[name="search"]').attr('placeholder', '012-3456-7890');
			} else {
				$('input[name="search"]').attr('placeholder', '');
			}
		});
		if($('select[name="searchKind"]').val()=='c.customer_phone'){
			$('input[name="search"]').attr('placeholder', '012-3456-7890');
		}
		$('input[type="date"]').change(function(){
			$('#searchForm').submit();
		});
		$('#searchBtn').click(function(){
			$('#searchForm').submit();
		});
		
		// 배송상태 변경기능 
		$('#submitBtn').click(function(){
			if($('input[name="orderState"]:checked').length==0) {
				alert('배송상태를 선택해주세요.');
				return;
			}
			if($('input[name="orderCode"]:checked').length==0) {
				alert('변경할 주문을 선택해주세요.');
				return;
			}
			$('#modifyOrderStateForm').submit();
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
									<div class="row justify-content-center">
										<!-- 상태별 목록보기 -->
										<ul class="nav">
										  	<li class="nav-item">
										    	<a class="nav-link" id="전체주문" href="${pageContext.request.contextPath}/admin/orders/ordersList">전체주문</a>
										 	 </li>
										  	<li class="nav-item">
										    	<a class="nav-link" id="결제" href="${pageContext.request.contextPath}/admin/orders/ordersList?orderState=결제&searchKind=${searchKind}&search=${search}&startDate=${startDate}&endDate=${endDate}">결제</a>
										  	</li>
										  	<li class="nav-item">
										    	<a class="nav-link" id="배송중" href="${pageContext.request.contextPath}/admin/orders/ordersList?orderState=배송중&searchKind=${searchKind}&search=${search}&startDate=${startDate}&endDate=${endDate}">배송중</a>
										  	</li>
										  	<li class="nav-item">
										    	<a class="nav-link" id="구매확정" href="${pageContext.request.contextPath}/admin/orders/ordersList?orderState=구매확정&searchKind=${searchKind}&search=${search}&startDate=${startDate}&endDate=${endDate}">구매확정</a>										  	
										    </li>
										</ul>										
									</div>
									<!-- 검색기능 form -->
									<form action="${pageContext.request.contextPath}/admin/orders/ordersList" id="searchForm">
										<input type="hidden" name="orderState" value="${orderState}">
										<table>
											<tr>
												<th>기간</th>
												<td><input type="date" name="startDate" value="${startDate}"> ~ <input type="date" name="endDate" value="${endDate}"></td>
											</tr>
											<tr>
												<th>검색</th>
												<td>
													<input type="hidden" id="searchKind" value="${searchKind}">
													<select name="searchKind">
														<option value="o.order_code">주문 번호</option>
														<option value="c.customer_name">주문자 명</option>
														<option value="c.customer_phone">연락처</option>
													</select>
													<input type="text" name="search" value="${search}">
													<button type="button" id="searchBtn">검색</button>
												</td>
											</tr>
										</table>
									</form>
								</div>
							</div>
							
							<div class="card-body">
								<!-- 배송상태 변경 기능 form -->
								<form action="${pageContext.request.contextPath}/admin/orders/ordersList" method="post" id="modifyOrderStateForm">
									<input type="hidden" name="startDate" value="${startDate}">
									<input type="hidden" name="endDate" value="${endDate}">
									<input type="hidden" name="search" value="${search}">
									<table>
										<tr>
											<th>배송상태 변경</th>
											<td>
												<input type="radio" name="orderState" value="결제">결제
												<input type="radio" name="orderState" value="취소">취소
												<input type="radio" name="orderState" value="배송중">배송중
												<input type="radio" name="orderState" value="배송완료">배송완료
												<input type="radio" name="orderState" value="구매확정">구매확정
												<button type="button" id="submitBtn">변경</button>
											</td>
										</tr>
									</table>
									<!-- ordersList -->
									<table class="table table-bordered text-center">
										<thead class="table-primary">
											<tr>
												<th>
													주문 번호
													<br> 주문자
													<br> 연락처
												</th>
												<th><input type="checkbox" id="allcheck"></th> <!-- 전체선택 -->
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
														<br> ${map.customerName}
														<br> ${map.customerPhone}
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