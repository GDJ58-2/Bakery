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
	<title>주문 목록 | 구디쥬르</title>
	
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
                        <h2>나의 주문 내역</h2>
                        <br>
						<div style="color:red;" id="msg">
						${msg}
						</div>						
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__links">
                        <a href="./index.html">Home</a>
                        <span>나의 주문 내역</span>
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
                        <c:forEach var="m" items="${list}" varStatus="s">
						<c:set var="em" value="${s.index}"/>
						<c:choose>
							<c:when test="${list[em-1].createdate eq m.createdate}">
								<tr>
									<td>
										<a class="btn dark-btn" href="${pageContext.request.contextPath}/orders/ordersOne?orderCode=${m.orderCode}&createdate=${m.createdate}">
											${m.orderCode}
										</a>
									</td>
									<td>
										<a class="btn dark-btn" href="${pageContext.request.contextPath}/orders/ordersOne?orderCode=${m.orderCode}&createdate=${m.createdate}">
											<img src="${pageContext.request.contextPath}/upload/${m.originName}" width="200" height="200">
										</a>
									</td>
									<td>
										<a class="btn dark-btn" href="${pageContext.request.contextPath}/orders/ordersOne?orderCode=${m.orderCode}&createdate=${m.createdate}">
											${m.goodsName}
										</a>
									</td>
									<td>
										${m.orderQuantity}개
									</td>
									<td>
										${m.orderPrice}원
									</td>
									<td>
										${m.createdate}
									</td>
									<td>
										${m.orderState}
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								</table>
								<h3>주문 날짜 : ${m.createdate}</h3>
								<br>
								<table class="table table-bordered">
									<tr>
										<th>주문 번호</th>
										<th>상품</th>
										<th>상품 이름</th>
										<th>주문 수량</th>
										<th>주문 가격</th>
										<th>주문 날짜</th>
										<th>주문 상태</th>
									</tr>
									<tr>
										<td>
											<a class="btn dark-btn" href="${pageContext.request.contextPath}/orders/ordersOne?orderCode=${m.orderCode}&createdate=${m.createdate}">
												${m.orderCode}
											</a>
										</td>
										<td>
											<a class="btn dark-btn" href="${pageContext.request.contextPath}/orders/ordersOne?orderCode=${m.orderCode}&createdate=${m.createdate}">
												<img src="${pageContext.request.contextPath}/upload/${m.originName}" width="200" height="200">
											</a>
										</td>
										<td>
											<a class="btn dark-btn" href="${pageContext.request.contextPath}/orders/ordersOne?orderCode=${m.orderCode}&createdate=${m.createdate}">
												${m.goodsName}
											</a>
										</td>
										<td>
											${m.orderQuantity}개
										</td>
										<td>
											${m.orderPrice}원
										</td>
										<td>
											${m.createdate}
										</td>
										<td>
											${m.orderState}
										</td>
									</tr>
							</c:otherwise>
						</c:choose>
						</c:forEach>					
						</table>
                    </div>             
                </div>          
            </div>   
            <div class="shop__last__option">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                    	<!-- 페이징 -->
                        <div class="shop__pagination">
                        	<a type="button" href="${pageContext.request.contextPath}/orders/ordersList?currentPage=1"><span class="arrow_carrot-left"></span></a>
								<c:if test="${currentPage > 1}">
									<a type="button" href="${pageContext.request.contextPath}/orders/ordersList?currentPage=${currentPage-1}">이전</a>
								</c:if>
								<a type="button" href="${pageContext.request.contextPath}/orders/ordersList?currentPage=${currentPage}">${currentPage}</a>
								<c:if test="${currentPage < lastPage}">
									<a type="button" href="${pageContext.request.contextPath}/orders/ordersList?currentPage=${currentPage+1}">다음</a>
								</c:if>
							<a type="button" href="${pageContext.request.contextPath}/orders/ordersList?currentPage=${lastPage}"><span class="arrow_carrot-right"></span></a>                                                                   
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="shop__last__text">
                            <p>Showing 1-9 of 10 results</p>
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