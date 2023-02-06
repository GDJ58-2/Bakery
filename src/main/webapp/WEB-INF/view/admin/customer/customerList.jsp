<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- Core JSTL 사용 -->
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
		$('#submitBtn').click(function(){
			$('#searchForm').submit();
		});
		$('.removeCustomer').click(function(){
			let customerName = $(this).attr('data-value');
			let result = confirm(customerName+'님을 삭제하시겠습니까?');
			if(result) {
				return true;
			} else {
				return false;
			}
		});
	});
</script>
<title>고객 관리 | 구디쥬르</title>
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
							<h2>고객관리</h2>
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
	
		<!-- customer admin section -->
		<section class="blog-details spad">
			<div class="content">
			
				<div class="row d-flex justify-content-center">
					<div class="col-lg-12">
					
						<div class="card">
						
							<div class="card-header">
								<div class="p-4">
									<div class="row">
										<div class="searchForm">
											<!-- 검색창 -->
											<form action="${pageContext.request.contextPath}/admin/customer/customerList" id="searchForm">
												<input type="text" name="search" value="${search}" id="search" placeholder="이름 검색">
												<button type="button" id="submitBtn" class="searchBtn">검색</button>
											</form>
										</div>
									</div>
								</div>
							</div>
							
							<div class="card-body">
								<!-- customerList 출력 -->
								<table class="table text-center">
									<thead class="table-primary">
										<tr>
											<th>번호</th>
											<th>아이디</th>
											<th>이름</th>
											<th>전화번호</th>
											<th style="width: 15%">가입일</th>
											<th>&nbsp;</th>
										</tr>
									</thead>
									<c:forEach var="c" items="${customerList}">
										<tr>
											<td>${c.customerCode}</td>
											<td>${c.customerId}</td>
											<td>${c.customerName}</td>
											<td>${c.customerPhone}</td>
											<td>${c.createdate}</td>
											<td>
												<div class="a-btn">
													<a href="${pageContext.request.contextPath}/admin/customer/removeCustomer?customerId=${c.customerId}" class="removeCustomer" data-value="${c.customerName}" >탈퇴</a>
												</div>
											</td>
										</tr>
									</c:forEach>
								</table>
							
								<!-- 페이징 -->
								<div class="shop__last__option">
									<div class="row justify-content-center">
										<div class="shop__pagination">
											<a href="${pageContext.request.contextPath}/admin/customer/customerList?currentPage=${currentPage-1}&rowPerPage=${rowPerPage}&search=${search}"><span class="arrow_carrot-left"></span></a>
											<a class="active" href="#">${currentPage}</a>
											<a href="${pageContext.request.contextPath}/admin/customer/customerList?currentPage=${currentPage+1}&rowPerPage=${rowPerPage}&search=${search}"><span class="arrow_carrot-right"></span></a>
										</div>
									</div>
								</div>
							
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