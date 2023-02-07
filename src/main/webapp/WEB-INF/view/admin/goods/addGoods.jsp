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
	<title>상품 추가 | 구디쥬르</title>
	
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
			let allCk = false;
			${'#categoryNo'}.focus();
			
			// 상품 종류 유효성 검사
			$('#categoryNo').blur(function(){
				if($('#categoryNo').val() == ''){
					$('#msg').text('상품 종류를 선택해주세요.');
					$('#categoryNo').focus();
				} else {
					$('#msg').text('');
					$('#goodsName').focus();
				}
			});
			
			// 상품 이름 유효성 검사
			$('#goodsName').blur(function(){
				if($('#goodsName').val() == ''){
					$('#msg').text('상품 이름을 입력해주세요.');
					$('#goodsName').focus();
				} else {
					$('#msg').text('');
					$('#goodsPrice').focus();
				}
			});
			
			// 상품 가격 유효성 검사
			$('#goodsPrice').blur(function(){
				if($('#goodsPrice').val() == ''){
					$('#msg').text('상품 가격을 입력해주세요.');
					$('#goodsPrice').focus();
				} else {
					$('#msg').text('');
					$('#goodsContent').focus();
				}
			});
			
			// 상품 설명 유효성 검사
			$('#goodsContent').blur(function(){
				if($('#goodsContent').val() == ''){
					$('#msg').text('상품 설명을 입력해주세요.');
					$('#goodsContent').focus();
				} else {
					$('#msg').text('');
					$('#goodsStock').focus();
				}
			});
			
			// 상품 재고 유효성 검사
			$('#goodsStock').blur(function(){
				if($('#goodsStock').val() == ''){
					$('#msg').text('상품 재고를 입력해주세요.');
					$('#goodsStock').focus();
				} else {
					$('#msg').text('');
					$('#empId').focus();
				}
			});
			
			// 직원 아이디 유효성 검사
			$('#empId').blur(function(){
				if($('#empId').val() == ''){
					$('#msg').text('직원 아이디를 입력해주세요.');
					$('#empId').focus();
				} else {
					$('#msg').text('');
					$('#hit').focus();
				}
			});
			
			// 상품 순위 유효성 검사
			$('#hit').blur(function(){
				if($('#hit').val() == ''){
					$('#msg').text('상품 순위를 입력해주세요.');
					$('#hit').focus();
				} else {
					$('#msg').text('');
					$('#goodsImg').focus();
				}
			});
			
			// 상품 이미지 파일 유효성 검사
			$('#goodsImg').blur(function(){
				if($('#goodsImg').val() == ''){
					$('#msg').text('상품 이미지 파일을 불러오세요.');
					$('#goodsImg').focus();
				} else {
					$('#msg').text('');
					$('#addBtn').focus();
					allCk = true;
				}
			});
			
			$('#addBtn').click(function(){
				if(allCk == false){
					$('#categoryNo').focus();
					return false;
				}
				$('#addForm').submit();
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
                        <h2>상품 등록</h2>    
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
            	<form action="${pageContext.request.contextPath}/admin/goods/addGoods" method="post" enctype="multipart/form-data" id="addForm">	               
	                <div class="col-lg-12">
	                    <div class="product__details__text">	                    	                                                                                             	                                                
	                        <table class="table table-bordered">
								<tr>
									<th>상품 종류 : </th>
									<td>
										<select name= "categoryNo" id="categoryNo">
											<c:forEach var="gc" items="${list}">
												<option value="${gc.categoryNo}">
													${gc.categoryKind} ${gc.categoryName}
												</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th>상품 이름 : </th>
									<td>
										<input type="text" name="goodsName" id="goodsName">
									</td>
								</tr>
								<tr>
									<th>상품 가격 : </th>
									<td>
										<input type="number" name="goodsPrice" id="goodsPrice">원
									</td>
								</tr>
								<tr>
									<th>상품 설명 : </th>
									<td>
										<textarea name="goodsContent" id="goodsContent" rows="10" cols="50"></textarea>
									</td>
								</tr>
								<tr>
									<th>상품 재고 : </th>
									<td>
										<input type="number" name="goodsStock" id="goodsStock">개
									</td>
								</tr>
								<tr>
									<th>직원 아이디 : </th>
									<td>
										<input type="text" name="empId" id="empId">
									</td>
								</tr>
								<tr>
									<th>상품 순위 : </th>
									<td>
										<input type="number" name="hit" id="hit">위
									</td>
								</tr>
								<tr>
									<th>상품 이미지 : </th>
									<td>
										<input type="file" name="goodsImg" id="goodsImg">
									</td>
								</tr>
							</table>
							<div class="product__details__option">                        
	                            <button type="submit" class="btn primary-btn" id="addBtn">상품등록</button>
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