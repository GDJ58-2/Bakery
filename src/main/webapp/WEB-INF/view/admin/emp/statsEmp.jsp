<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- core JSTL 사용 -->
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

<script>
	$(document).ready(function(){
		$('#selectYear').change(function() {
			$('#monthForm').submit();
		});
		
		$('#selectProductYear').change(function() {
			if($('#selectProductMonth').val() != 0) {
				$('#productMonthForm').submit();
			}
		});
		
		$('#selectProductMonth').change(function() {
			if($('#selectProductYear').val() != 0) {
				$('#productMonthForm').submit();
			}
		});
		
		$('#selectProductCate').change(function() {
			if($('#selectProductCateYear').val() != 0) {
				$('#productCategoryForm').submit();
			}
		});
		
		$('#selectProductCateYear').change(function() {
			if($('#selectProductCate').val() != 0) {
				$('#productCategoryForm').submit();
			}
		});
		
	});
</script>
<title>통계 | 구디쥬르</title>
</head>
<body>

	<!-- header -->
	<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
	
	<div class="wrap">
		<!-- breadcrumb -->
		<div class="breadcrumb-option">
			<div class="container">
				<div class="row">
					
				</div>
			</div>
		</div>
		<!-- /breadcrumb -->
		
		<!-- emp section -->
		<section class="shop spad">
       	 <div class="container">         
            <div class="row">          		
                <div class="col-lg-12">
	            	<div class="product__details__text">   
					
					<!-- 통계 집어넣기 -->
								<div>
									<h4>연도별 매출</h4>
									<br>
									<div>*최근 5개년</div>
									<table class="table table-bordered">
										<tr>
											<th>연도</th>
											<th>매출</th>
										</tr>
										<c:forEach var="y" items="${yearList}">
											<tr>
												<td>${y.year}년</td>
												<td>${y.price}원</td>
											</tr>
										</c:forEach>
									</table>
								</div>
								<br>
								<br>
								<div>
									<h4>월별매출</h4>
									<div>
									<span>${year}년</span>
									<form action="${pageContext.request.contextPath}/admin/emp/stats" method="get" id="monthForm">
										<select	id="selectYear" name="year">
											<option value="0">==</option>
											<option value="2023">2023</option>
											<option value="2022">2022</option>
											<option value="2021">2021</option>
											<option value="2020">2020</option>
											<option value="2019">2019</option>
										</select>
									</form>
									</div>
									<table class="table table-bordered">
										<tr>
											<th>월</th>
											<th>매출</th>
										</tr>
										<c:forEach var="m" items="${monthList}">
											<tr>
												<td>${m.month}월</td>
												<td>${m.price}</td>
											</tr>
										</c:forEach>
									</table>
								</div>
								<br>
								<br>
								<div>
									<h4>월 판매량 순위</h4>
									<div>
									<span>${year}년 ${month}월</span>
									<form action="${pageContext.request.contextPath}/admin/emp/stats" method="get" id="productMonthForm">
										<span style="display: inline-block">
											<select id="selectProductYear" name="year">
												<option value="0">==</option>
												<option value="2023">2023년</option>
												<option value="2022">2022년</option>
												<option value="2021">2021년</option>
												<option value="2020">2020년</option>
												<option value="2019">2019년</option>
											</select>
										</span>
										<span style="display: inline-block">
											<select id="selectProductMonth" name="month">
												<option value="0">==</option>
												<option value="1">1월</option>
												<option value="2">2월</option>
												<option value="3">3월</option>
												<option value="4">4월</option>
												<option value="5">5월</option>
												<option value="6">6월</option>
												<option value="7">7월</option>
												<option value="8">8월</option>
												<option value="9">9월</option>
												<option value="10">10월</option>
												<option value="11">11월</option>
												<option value="12">12월</option>
											</select>
										</span>
									</form>
									</div>
									<table class="table table-bordered">
										<tr>
											<th>상품명</th>
											<th>판매량</th>
											<th>매출</th>
										</tr>
										<c:forEach var="p" items="${productRankingList}">
											<tr>
												<td>${p.goodsName}</td>
												<td>${p.goodsCount}</td>
												<td>${p.price}</td>
											</tr>
										</c:forEach>
									</table>
								</div>
								<br>
								<br>
								<div>
									<h4>카테고리별 판매량 순위</h4>
									<form action="${pageContext.request.contextPath}/admin/emp/stats" method="get" id="productCategoryForm">
										<span style="display: inline-block">
											<select id="selectProductCate" name="categoryNo">
												<option value="0">==</option>
												<c:forEach var="ct" items="${goodsCategoryList}">
													<option value="${ct.categoryNo}">${ct.categoryName}</option>
												</c:forEach>
											</select>
											
										</span>
										<span style="display: inline-block">
											<select id="selectProductCateYear" name="year">
													<option value="0">==</option>
													<option value="2023">2023년</option>
													<option value="2022">2022년</option>
													<option value="2021">2021년</option>
													<option value="2020">2020년</option>
													<option value="2019">2019년</option>
											</select>
										</span>
									</form>
									<c:forEach var="c" items="${productCategoryList}">
										${p.categoryName}
									</c:forEach>
									<table class="table table-bordered">
										<tr>
											<th>상품명</th>
											<th>판매량</th>
											<th>매출</th>
										</tr>
										<c:forEach var="c" items="${productCategoryList}">
											<tr>
												<td>${c.goodsName}</td>
												<td>${p.goodsCount}</td>
												<td>${p.price}</td>
											</tr>
										</c:forEach>
									</table>
								
								</div>
								
						</div>
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