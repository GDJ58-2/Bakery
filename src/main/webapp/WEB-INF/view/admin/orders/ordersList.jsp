<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 포맷 설정 -->
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
	<style>
		input[type=radio] {
			margin-left: 0.5rem;
			margin-right: 0.25rem;
		}
	</style>
<script>
	$(document).ready(function(){
		
		// 오늘 버튼 선택시 
		$('#todayBtn').click(function(){
			// 오늘 날짜 구하기
			let today = new Date();
			let year = today.getFullYear();
			let month = ('0' + (today.getMonth() + 1)).slice(-2); // 월 두자리수 포맷설정
			let date = ('0' + today.getDate()).slice(-2); // 일 두자리수 포맷설정
			let todayStr = year + '-' + month + '-' + date;
			console.log(todayStr);
			
			$('input[type="date"]').val(todayStr);
			$('#searchForm').submit();
		});
		
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
		console.log($('#searchKind').val());
		console.log($('select[name="searchKind"]').val());
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
		$('.searchBtn').click(function(){
			$('#searchForm').submit();
		});
		
		// 배송상태 변경
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
<title>주문 관리 | 구디쥬르</title>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
	
	<div class="wrap">
	
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
								
										<!-- 상태별 목록보기 -->
										<ul class="nav tablist justify-content-center">
											<c:if test="${orderState == null || orderState == '' }">
												<li class="nav-item">
											    	<a class="tab-link active" id="전체주문" href="${pageContext.request.contextPath}/admin/orders/ordersList">전체주문</a>
											 	</li>
											</c:if>
											<c:if test="${orderState != null && orderState != '' }">
												<li class="nav-item">
											    	<a class="tab-link" id="전체주문" href="${pageContext.request.contextPath}/admin/orders/ordersList">전체주문</a>
											 	</li>
											</c:if>
											
											<c:forEach var="oc" items="${ordersCount}">
												<c:if test="${orderState eq oc.orderState}">
													<li class="nav-item">
										    			<a class="tab-link active" href="${pageContext.request.contextPath}/admin/orders/ordersList?orderState=${oc.orderState}">
										    				${oc.orderState}
										    				(${oc.count})
										    			</a>
										 			</li>
												</c:if>
												<c:if test="${orderState ne oc.orderState}">
													<li class="nav-item">
										    			<a class="tab-link" href="${pageContext.request.contextPath}/admin/orders/ordersList?orderState=${oc.orderState}">
										    				${oc.orderState}
										    				(${oc.count})
										    			</a>
										 			</li>
												</c:if>
											</c:forEach>
										</ul>						
									</div>
									
									<!-- 검색기능 form -->
									<div class="d-flex justify-content-center">
										<div class="col-lg-7">
											<div class="search2">
												<div class="msg"> * 한 달 기준 </div>
												<form action="${pageContext.request.contextPath}/admin/orders/ordersList" id="searchForm">
													<input type="hidden" name="orderState" value="${orderState}">
													<table>
														<tr>
															<th>기간</th>
															<td>
																<input type="date" name="startDate" value="${startDate}"> ~ <input type="date" name="endDate" value="${endDate}">
															</td>
															<td>
																<div class="a-btn">
																	<a type="button" id="todayBtn">오늘</a>
																</div>
															</td>
														</tr>
														<tr>
															<th>검색</th>
															<td colspan="2">
																<input type="hidden" id="searchKind" value="${searchKind}">
																<select name="searchKind">
																	<option value="o.order_code">주문 번호</option>
																	<option value="c.customer_name">주문자 명</option>
																	<option value="c.customer_phone">연락처</option>
																</select>
																<input type="text" name="search" value="${search}" placeholder="검색어를 입력해주세요.">
																<button type="button" class="searchBtn">검색</button>
															</td>
														</tr>
													</table>
												</form>	
											</div>
										</div>
									</div>
									<!-- /검색기능 form -->
								</div>
							</div>
							
							<div class="card-body">
								<!-- 배송상태 변경 기능 form -->
								<form action="${pageContext.request.contextPath}/admin/orders/ordersList" method="post" id="modifyOrderStateForm">
									<input type="hidden" name="startDate" value="${startDate}">
									<input type="hidden" name="endDate" value="${endDate}">
									<input type="hidden" name="search" value="${search}">
									<input type="hidden" name="searchKind" value="${searchKind}">
									<table class="mb-1-4">
										<tr>
											<th>배송상태 변경</th>
											<td>
												<input type="radio" name="orderState" value="결제">결제
												<input type="radio" name="orderState" value="취소">취소
												<input type="radio" name="orderState" value="배송중">배송중
												<input type="radio" name="orderState" value="배송완료">배송완료
												<input type="radio" name="orderState" value="구매확정">구매확정
											</td>
											<td>
												<div class="a-btn">
													<a type="button" id="submitBtn" class="ml-2">변경</a>
												</div>
											</td>
										</tr>
									</table>
									<!-- ordersList -->
									<table class="table table-bordered table-sm text-center">
										<thead class="table-primary">
											<tr>
												<th>
													주문 번호
													<br> 주문자
													<br> 연락처
												</th>
												<th style="width: 10%"><input type="checkbox" id="allcheck"></th> <!-- 전체선택 -->
												<th>상품 번호</th>
												<th style="width: 20%">주문일</th>
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
														<c:if test="${map.orderState eq '구매확정' || map.orderState eq '취소'}">
															&nbsp;
														</c:if>
														<c:if test="${map.orderState ne '구매확정' && map.orderState ne '취소'}">
															<input type="checkbox" name="orderCode" value="${map.orderCode}" class="checkOrderCode">
														</c:if>
													</td>
													<td>${map.goodsCode}</td>
													<td>${map.createdate}</td>
													<td>${map.goodsName}</td>
													<td class="text-right">
														${map.orderQuantity}개
														<br><fmt:formatNumber value="${map.orderPrice}" pattern="#,###원" />
													</td>
													<td>${map.orderState}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</form>
								
								<!-- 페이징 -->
								<div class="shop__last__option">
									<div class="row justify-content-center">
										<div class="shop__pagination">
											<a href="${pageContext.request.contextPath}/admin/orders/ordersList?currentPage=${startPage-1}&orderState=${orderState}&searchKind=${searchKind}&search=${search}&startDate=${startDate}&endDate=${endDate}"><span class="arrow_carrot-left"></span></a>
											<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
												<c:if test="${currentPage eq i}">
													<a class="active" href="#">${i}</a>
												</c:if>
												<c:if test="${currentPage ne i}">
													<a href="${pageContext.request.contextPath}/admin/orders/ordersList?currentPage=${i}&orderState=${orderState}&searchKind=${searchKind}&search=${search}&startDate=${startDate}&endDate=${endDate}">${i}</a>
												</c:if>
											</c:forEach>
											<a href="${pageContext.request.contextPath}/admin/orders/ordersList?currentPage=${endPage+1}&orderState=${orderState}&searchKind=${searchKind}&search=${search}&startDate=${startDate}&endDate=${endDate}"><span class="arrow_carrot-right"></span></a>
										</div>
									</div>
								</div>
								<!-- /페이징 -->
							</div>
						</div>
						<!-- /card -->
						
					</div>
				</div>
			
			</div>
		</section>
		
	</div>
	
	<!-- footer -->
	<div>
		<c:import url="/WEB-INF/view/inc/footer.jsp"></c:import>
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