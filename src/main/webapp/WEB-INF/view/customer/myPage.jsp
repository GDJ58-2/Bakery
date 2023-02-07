<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Cake Template">
    <meta name="keywords" content="Cake, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>회원정보 | 구디쥬르</title>

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

	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<style>
		.box {
			border:1px solid #dfdfe0; 
			padding-top:30px;
			padding-right:70px;
			padding-left:70px;
			padding-bottom:30px;
		}
	</style>
	<script>
		let customerUrl = '${pageContext.request.contextPath}/customer/logout';
		function logoutAction(customerUrl) {
			let out = confirm('로그아웃하시겠습니까?'); 
		 	if(out) {
	 			location.replace(customerUrl); 
	     		alert('로그아웃되었습니다');
	      	} else {
	         	alert('로그아웃 취소');
	         	return false;
	      	}
		 }  
			
		$(document).ready(function() {
			// 로그아웃
			$('#logoutBtn').click(function() {
	   			logoutAction(customerUrl);
	   		});
			
			// 비밀번호 변경 완료 메시지알림
			if($('#checkPw').val() == "Y" && $('#checkPw').val() != '') {
				alert('비밀번호가 변경되었습니다');
			} 
			
			// 회원정보 변경 완료 메시지
			if($('#checkInfo').val() == "Y" && $('#checkInfo').val() != '') {
				alert('회원정보가 수정되었습니다');
			}
		});
	
	</script>

</head>

<body>
    <!-- Header Section Begin -->
   	<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
	<!-- Header Section End -->

	<div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__text">
                        <h2>회원정보</h2>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__links">
                        <a href="${pageContext.request.contextPath}/customer/myHome">My Page</a>
                        <span>회원정보</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
    <!-- Contact Section Begin -->
    <section class="contact spad">
        <div class="container">
            		
            <div class="contact__address">
                <div class="container">
                	<div class="row">
                        <div class="col-lg-11 col-md-5 col-sm-4">
	              			<div class = "d-flex justify-content-center">
								<div class="mb-5">
									<div class="box">
										<div>
											<table>
												<tr>
													<td style="width: 100px">ID</td>
													<td>${selectOneCustomer.customerId}</td>
												</tr>
												<tr>
													<td style="width: 100px">Name</td>
													<td>${selectOneCustomer.customerName}</td>
												</tr>
												<tr>
													<td style="width: 100px">Phone</td>
													<td>${selectOneCustomer.customerPhone}</td> 
												</tr>
												<tr>
													<td>가입일</td>
													<td>	
														<c:set var = "date" value = "${selectOneCustomer.createdate}" />${fn:substring(date,0,10)}
													</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>

                        	<div class="contact__address__item">
         						<div class = "d-flex justify-content-center">
									<div>
										<span>
											<input type="hidden" id="checkInfo" value="${checkInfo}">
											<a href = "${pageContext.request.contextPath}/customer/modifyCustomer">
												<button type = "button" class= "btn mypage-btn">회원정보수정</button>
											</a>
										</span>
										<span>
											<input type="hidden" id="checkPw" value="${checkPw}">
											<a href = "${pageContext.request.contextPath}/customer/modifyCustomerPw">
												<button type = "button" class= "btn mypage-btn">비밀번호변경</button>
											</a>
										</span>
										<span>
											<a href = "${pageContext.request.contextPath}/customer/removeCustomer">
												<button type = "button" class= "btn mypage-btn">회원탈퇴</button>
											</a>
										</span>
									</div>
								</div>
                        	</div>
                    	</div>
            		</div>
            	</div>
           	</div>
        </div>
    </section>
    <!-- Contact Section End -->

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