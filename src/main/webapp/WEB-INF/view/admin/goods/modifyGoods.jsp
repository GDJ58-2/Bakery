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
	<title>modifyGoods.jsp</title>
	
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
			let allCk = false;
			${'#categoryNo'}.focus();
			
			// ?????? ?????? ????????? ??????
			$('#categoryNo').blur(function(){
				if($('#categoryNo').val() == ''){
					$('#msg').text('?????? ????????? ??????????????????.');
					$('#categoryNo').focus();
				} else {
					$('#msg').text('');
					$('#goodsName').focus();
				}
			});
			
			// ?????? ?????? ????????? ??????
			$('#goodsName').blur(function(){
				if($('#goodsName').val() == ''){
					$('#msg').text('?????? ????????? ??????????????????.');
					$('#goodsName').focus();
				} else {
					$('#msg').text('');
					$('#goodsPrice').focus();
				}
			});
			
			// ?????? ?????? ????????? ??????
			$('#goodsPrice').blur(function(){
				if($('#goodsPrice').val() == ''){
					$('#msg').text('?????? ????????? ??????????????????.');
					$('#goodsPrice').focus();
				} else {
					$('#msg').text('');
					$('#goodsStock').focus();
				}
			});
			
			// ?????? ?????? ????????? ??????
			$('#goodsStock').blur(function(){
				if($('#goodsStock').val() == ''){
					$('#msg').text('?????? ????????? ??????????????????.');
					$('#goodsStock').focus();
				} else {
					$('#msg').text('');
					$('#empId').focus();
				}
			});
			
			// ?????? ????????? ????????? ??????
			$('#empId').blur(function(){
				if($('#empId').val() == ''){
					$('#msg').text('?????? ???????????? ??????????????????.');
					$('#empId').focus();
				} else {
					$('#msg').text('');
					$('#hit').focus();
				}
			});
			
			// ?????? ?????? ????????? ??????
			$('#hit').blur(function(){
				if($('#hit').val() == ''){
					$('#msg').text('?????? ????????? ??????????????????.');
					$('#hit').focus();
				} else {
					$('#msg').text('');
					$('#goodsImg').focus();
				}
			});
			
			// ?????? ????????? ?????? ????????? ??????
			$('#goodsImg').blur(function(){
				if($('#goodsImg').val() == ''){
					$('#msg').text('?????? ????????? ????????? ???????????????.');
					$('#goodsImg').focus();
				} else {
					$('#msg').text('');
					$('#goodsContent').focus();
				}
			});
			
			// ?????? ?????? ????????? ??????
			$('#goodsContent').blur(function(){
				if($('#goodsContent').val() == ''){
					$('#msg').text('?????? ????????? ??????????????????.');
					$('#goodsContent').focus();
				} else {
					$('#msg').text('');
					$('#modifyBtn').focus();
					allCk = true;
				}
			});
			
			$('#modifyBtn').click(function(){
				if(allCk == false){
					$('#categoryNo').focus();
					return false;
				}
				$('#modifyForm').submit();
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
            	<form action="${pageContext.request.contextPath}/admin/goods/modifyGoods" method="post" enctype="multipart/form-data" id="modifyForm">              
	                <div class="col-lg-12">
	                    <div class="product__details__text">
	                        <table class="table table-bordered">
								<tr>
									<td rowspan="8">
										<img class="big_img" src="${pageContext.request.contextPath}/upload/${map.originName}" width="400" height="400">
									</td>
									<th>?????? ?????? : </th>
									<td>
										<input type="number" name="goodsCode" value="${map.goodsCode}" readonly="readonly">
									</td>
								</tr>
								<tr>
									<th>?????? ?????? : </th>
									<td>
										<select name= "categoryNo" id="categoryNo">
											<option value="${map.categoryNo}">
												${map.categoryKind} ${map.categoryName}
											</option>
											<c:forEach var="gc" items="${list}">
												<c:if test="${gc.categoryNo != map.categoryNo}">
													<option value="${gc.categoryNo}">
														${gc.categoryKind} ${gc.categoryName}
													</option>
												</c:if>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th>?????? ?????? : </th>
									<td>
										<input type="text" name="goodsName" value="${map.goodsName}" id="goodsName">
									</td>
								</tr>
								<tr>
									<th>?????? ?????? : </th>
									<td>
										<input type="number" name="goodsPrice" value="${map.goodsPrice}" id="goodsPrice">
									</td>
								</tr>
								<tr>
									<th>?????? ?????? : </th>
									<td>
										<input type="number" name="goodsStock" value="${map.goodsStock}" id="goodsStock">
									</td>
								</tr>
								<tr>
									<th>?????? ????????? : </th>
									<td>
										<input type="text" name="empId" value="${map.empId}" id="empId">
									</td>
								</tr>
								<tr>
									<th>?????? ?????? : </th>
									<td>
										<input type="number" name="hit" value="${map.hit}" id="hit">
									</td>
								</tr>
								<tr>
									<th>?????? ????????? : </th>
									<td>
										<input type="file" name="goodsImg" id="goodsImg">
									</td>
								</tr>
								<tr>
								<td colspan="3">
									<div>?????? ?????? : </div>
									<textarea name="goodsContent" rows="5" cols="80" id="goodsContent">${map.goodsContent}</textarea>
								</td>
							</tr>
							</table>
	                        <div class="product__details__option">                           
			                	<button type="submit" class="btn primary-btn" id="modifyBtn">????????????</button>
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