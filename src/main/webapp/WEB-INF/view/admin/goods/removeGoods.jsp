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
	<!-- ????????????????????? ????????? ?????? -->
	<script>
		$(document).ready(function(){ // ???????????? ???????????? ?????? ??????
			$('#removeBtn').focus();
			
			$('#removeBtn').click(function(){
				if(!confirm("????????? ??????????????? ?????? ???????????? ?????? ???????????????.\n????????? ?????????????????????????")){
					$('#removeBtn').focus();
					return false;
				} else {
					$('#removeForm').submit();
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
                        <h2>?????? ??????</h2>
						<br>
						<div style="color:red;" id="msg">
						${msg}
						</div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__links">
                        <a href="./index.html">Home</a>
                        <span>Shop</span>                      
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Shop Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
            	<form action="${pageContext.request.contextPath}/admin/goods/removeGoods" method="post" id="removeForm">              
	                <div class="col-lg-12">
	                    <div class="product__details__text">
	                        <table class="table table-bordered">
								<tr>
									<td rowspan="8">
										<img class="big_img" src="${pageContext.request.contextPath}/upload/${map.originName}" width="400" height="400">
									</td>
									<th>?????? ?????? : </th>
									<td>
										${map.goodsCode}
										<input type="hidden" name="goodsCode" value="${map.goodsCode}">
									</td>
								</tr>
								<tr>
									<th>?????? ?????? : </th>
									<td>${map.categoryKind} ${map.categoryName}</td>
								</tr>
								<tr>
									<th>?????? ?????? : </th>
									<td>${map.goodsName}</td>
								</tr>
								<tr>
									<th>?????? ?????? : </th>
									<td>${map.goodsPrice}</td>
								</tr>
								<tr>
									<th>?????? ?????? : </th>
									<td>${map.goodsStock}???</td>
								</tr>
								<tr>
									<th>?????? ?????? : </th>
									<td>${map.empId}</td>
								</tr>
								<tr>
									<th>?????? ?????? : </th>
									<td>${map.hit}???</td>
								</tr>
								<tr>
									<th>?????? ?????? : </th>
									<td>${map.createdate}</td>
								</tr>
								<tr>
									<td colspan="3">
										<div>?????? ?????? : </div>
										<div>${map.goodsContent}</div>
									</td>
								</tr>
							</table>
	                        <div class="product__details__option">                           
			                	<button type="submit" class="btn primary-btn" id="removeBtn">????????????</button>
			                </div>
	                    </div>
	                </div>
                </form>                                                                                  
            </div>
        </div>
    </section>
    <!-- Shop Details Section End -->   
	<br><br><br><br>
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