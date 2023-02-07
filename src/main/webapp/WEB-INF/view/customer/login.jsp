<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Cake Template">
    <meta name="keywords" content="Cake, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>로그인 | 고객 | 구디쥬르</title>

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
	
	<style>
		body {
			margin: 0;
		}
	</style>
	    
   
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			if($('#addMsg').val()) {
				alert('가입을 환영합니다');
				history.replaceState({}, null, location.pathname);
			}
			
			if($('#loginMsg').val()) {
				alert('ID와 비밀번호를 확인하세요');
			}
			
			$('#loginBtn').click(function() {
				if(!$('#id').val()) {
					alert('ID와 비밀번호를 입력하세요');
					$('#id').focus();
				} else {
					$('#pw').focus();
				}
				if($('#id').val() && $('#pw').val()){
					$('#loginForm').submit();
				}
			});
			
			// 탈퇴 완료 메시지
			if($('#removeMsg').val() == "Y" && $('#removeMsg').val() != '') {
				alert('탈퇴 처리가 완료되었습니다 이용해 주셔서 감사합니다');
			}
		});
	</script>
</head>

<body>
    <!-- Header Section Begin -->
   	<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
	<!-- Header Section End -->

    <!-- login Section Begin -->
    <section class="contact spad">
        <div class="container">
            
            <div class = "d-flex justify-content-center">
                <div class="row">
                   
                    <div class="col-lg-12 col-md-7 col-sm-6">
                        <div class="contact__address__item">
                            <h6>Login</h6>
                            <div>
                            	<div>
	                            	<input type = "hidden" id = "addMsg" value = "${addMsg}">
	                            	<input type = "hidden" id = "loginMsg" value = "${loginMsg}">
	                            	<input type = "hidden" id = "removeMsg" value = "${removeMsg}">
									<form action = "${pageContext.request.contextPath}/customer/login" method = "post" id = "loginForm">
										<table>
											<tr>
												<td>ID</td>
												<td>
													<input type = "text" id = "id" name = "id">
												</td>
											</tr>
											<tr>
												<td>PW</td>
												<td>
													<input type = "password" id = "pw" name = "pw">
												</td>
											</tr>
										</table>
									</form>
								</div>
								<div class = "mt-1 mb-4">
									<span class = "float-right">
                            			<a href = "${pageContext.request.contextPath}/admin/emp/loginEmp">
                            				<font size = "2" color = "black">직원로그인</font>
                            			</a>
									</span>
								</div>
								<div class = "mt-2">
									<div>
										<button type = "button" id = "loginBtn" class="login-btn btn-block">login</button>
									</div>
									<div class = "mt-1">
										<a href = "${pageContext.request.contextPath}/customer/addCustomer">
											<button type = "button" id = "createBtn" class="signup-btn btn-block">sign up</button>
										</a>
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