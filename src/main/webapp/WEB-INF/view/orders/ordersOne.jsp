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
	<title>주문 상세정보 | 구디쥬르</title>
	
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
</head>
<body>
    <!-- Header Section Begin -->
   	<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
	<!-- Header Section End -->

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__text">
                        <h2>주문 상세 내역</h2>                    
                        <br>
						<div style="color:red;" id="msg">
						${msg}
						</div>											
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__links">
                        <a href="./index.html">Home</a>
                        <span>주문 상세 내역</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
	
    <!-- Question Section Begin -->
    <section class="shop spad">
        <div class="container">         
            <div class="row">          		
                <div class="col-lg-12">
	            	<div class="product__details__text">  
                        <h3>주문 일자 : ${orderdate}</h3>  
                        <br>                   
                    	<c:forEach var="map" items="${list}">                	
							<table class="table table-bordered">
								<tr>
									<td rowspan="9">
										<img src="${pageContext.request.contextPath}/upload/${map.originName}" width="400" height="400">
									</td>
									<th>상품 이름 : </th>
									<td>${map.goodsName}</td>
								</tr>
								<tr>
									<th>상품 수량 : </th>
									<td>${map.orderQuantity}개</td>
								</tr>
								<tr>
									<th>상품 가격 : </th>
									<td>${map.goodsPrice}원</td>
								</tr>
								<tr>
									<th>상품 배송상태 : </th>
									<td>${map.orderState}</td>
								</tr>
								<tr>
									<th>주문 날짜 : </th>
									<td>${map.createdate}</td>
								</tr>
								<tr>
									<th>주문 가격 : </th>
									<td>${map.orderPrice}원</td>
								</tr>
								<tr>
									<th>리뷰 작성 : </th> <!-- orderState이 구매확정일 때만 -->
									<td>
										<a class="primary-btn" href="${pageContext.request.contextPath}/review/addReview?orderCode=${map.orderCode}">리뷰 작성</a>
									</td>
								</tr>
								<tr>
									<th>배송 문의 : </th> <!-- orderState이 구매확정이 아닐때만 -->
									<td>
										<a class="primary-btn" href="${pageContext.request.contextPath}/question/addQuestion?orderCode=${map.orderCode}">문의 작성</a>
									</td>
								</tr>
								<tr>
									<th>구매 확정 : </th> <!-- orderState이 배송완료일 때만 -->
									<td>
										<c:if test="${map.orderState eq '배송완료'}">
											<a class="primary-btn" href="${pageContext.request.contextPath}/orders/modifyOrders?orderCode=${map.orderCode}&orderState=구매확정">구매확정 하기</a>
										</c:if>
									</td>
								</tr>
							</table>
							<br>
						</c:forEach>
						
						<h3>받는 사람 정보</h3>
						<br>
						<table class="table table-bordered">
							<tr>
								<th>고객 아이디 : </th>
								<td>${map.customerId}</td>
							</tr>
							<tr>
								<th>고객 이름 : </th>
								<td>${map.customerName}</td>
							</tr>
							<tr>
								<th>고객 전화번호 : </th>
								<td>${map.customerPhone}</td>
							</tr>
							<tr>
								<th>주소 종류 : </th>
								<td>${map.addressKind}</td>
							</tr>
							<tr>
								<th>받는 주소 : </th>
								<td>${map.address}</td>
							</tr>
						</table>
						
						<div>
							<a class="primary-btn" href="${pageContext.request.contextPath}/orders/removeOrders?orderCode=${map.orderCode}&createdate=${map.createdate}">주문 내역 삭제</a>
						</div>
                    </div>             
                </div>          
            </div>            
        </div>
    </section>
    <!-- Question Section End -->

	<!-- Footer Section Begin -->
    <c:import url="/WEB-INF/view/inc/footer.jsp"></c:import>
	<!-- Footer Section End -->
	
	<!-- Search Begin -->
	<div class="search-model">
	    <div class="h-100 d-flex align-items-center justify-content-center">
	        <div class="search-close-switch">+</div>
	        <form class="search-model-form">
	            <input type="text" id="search-input" placeholder="Search here.....">
	        </form>
	    </div>
	</div>
	<!-- Search End -->
	
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