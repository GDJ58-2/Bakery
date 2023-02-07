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
	<title>주문 삭제 | 구디쥬르</title>
	
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
	<!-- 자바스크립트로 유효성 확인 -->
	<script>
		$(document).ready(function(){ // 페이지가 로드되고 나면 실행
			$('#deleteBtn').focus();
			
			$('#deleteBtn').click(function(){
				
				if(!confirm("주문내역을 삭제하시면 관련 게시글도 전부 삭제됩니다.\n주문내역을 삭제하시겠습니까?")){
					$('#deleteBtn').focus();
					return false;
				} else {
					$('#deleteForm').submit();
				}
			});
		});
	</script>	
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
                        <h2>주문 삭제</h2>                    
                        <br>
						<div style="color:red;" id="msg">
						${msg}
						</div>																						
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__links">
                        <a href="./index.html">Home</a>
                        <span>주문 삭제</span>
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
                    	<c:forEach var="m" items="${list}">
							<table class="table table-bordered">
								<tr>
									<td rowspan="8">
										<img src="${pageContext.request.contextPath}/upload/${m.filename}" width="400" height="400">
									</td>
									<th>상품 번호 : </th>
									<td>${m.goodsCode}</td>
								</tr>
								<tr>
									<th>상품 이름 : </th>
									<td>${m.goodsName}</td>
								</tr>
								<tr>
									<th>상품 종류 : </th>
									<td>${m.categoryName}</td>
								</tr>
								<tr>
									<th>상품 수량 : </th>
									<td>${m.orderQuantity}개</td>
								</tr>
								<tr>
									<th>상품 가격 : </th>
									<td>${m.goodsPrice}원</td>
								</tr>
								<tr>
									<th>상품 배송상태 : </th>
									<td>${m.orderState}</td>
								</tr>
								<tr>
									<th>주문 날짜 : </th>
									<td>${m.createdate}</td>
								</tr>
								<tr>
									<th>주문 가격 : </th>
									<td>${m.orderPrice}원</td>
								</tr>								
							</table>
							<br>
						</c:forEach>
						
						<h3>받는 사람 정보</h3>
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
						<br>
						<form action="${pageContext.request.contextPath}/orders/removeOrders" method="post" id="deleteForm">
							<input type="hidden" name="orderCode" value="${map.orderCode}">
							<input type="hidden" name="createdate" value="${map.createdate}">
						<button class="btn primary-btn" type="submit" id="deleteBtn">주문 내역 삭제</button>
						</form>
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