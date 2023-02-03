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
    <title>Cake | Template</title>

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
		
		.phoneNum {
			width: 70px;
		}
		
		.create-account {
  			margin-bottom: 30px;
		}
		.create-account h6 {
  			color: #111111;
  			font-weight: 600;
  			text-transform: uppercase;
  			margin-bottom: 25px;
		}
		
		#id, #pw, #newPw, #name, #address {
			border-bottom : black 1px solid;
			border-left: medium none;
			border-right: medium none;
			border-top: medium none;
		}
		
	</style>
	    
   
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script>
		function logoutAction() {
			let url = '${pageContext.request.contextPath}/customer/logout';
				let out = confirm('로그아웃하시겠습니까?'); 
			 	if(out) {
		 			location.replace(url); 
		     		alert('로그아웃되었습니다');
		      	} else {
		         	alert('로그아웃 취소');
		         	return false;
		      	}
		 }  
		
		// 핸드폰번호에는 숫자만 입력가능하게 하는 함수
		function handleOnInput(el, maxlength) {
			  if(el.value.length > maxlength)  {
			    el.value 
			      = el.value.substr(0, maxlength);
			  }
		}
		function handleOnInput2(el, maxlength) {
			  if(el.value.length > maxlength)  {
			    el.value 
			      = el.value.substr(0, maxlength);
			  }
		}
		
		$(document).ready(function() {
			// 비밀번호 변경 거절 알림창
			if($('#check').val()) {
				alert('변경할 수 없는 번호입니다');
				$('#check').val() = '';
			} 
			
			$('#modifyPwBtn').click(function() {
				let msgCk = 0;
				
				// 비밀번호
				if($('#pw').val() == ''){
					$('#pwMsg').text('pw를 입력하세요');
				} else {
					$('#pwMsg').text('');
				}
				
				// 새 비밀번호
				if($('#newPw').val() == ''){
					$('#newPwMsg').text('pw를 입력하세요');
				} else {
					$('#newPwMsg').text('');
				}
				
				$('.msg').each(function() {
					if($(this).text() != '') {
						alert($(this).text());
						return false;
					} else {
						++ msgCk 
						console.log('msgCk'+msgCk);
						console.log('length'+$('.msg').length);
					}
					if(msgCk == $('.msg').length) {
						$('#modifyPwForm').submit();
					}
				});	
			});
			
			// 로그아웃
			$('#logoutBtn').on('click', function() {
	   			logoutAction(url);
	   		});
		});
	</script>
</head>

<body>
    <!-- Header Section Begin -->
   	<c:import url="../inc/header.jsp"></c:import>
	<!-- Header Section End -->
    
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__text">
                        <h3>비밀번호변경</h3>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__links">
                        <a href="${pageContext.request.contextPath}/customer/myHome">My Page</a>
                        <a href="${pageContext.request.contextPath}/customer/selectOneCustomer">회원정보</a>
                        <span>비밀번호변경</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Create Account Section Begin -->
	<section class="contact spad">
    	<div class="container">
			<div class="row">  
				<div class="col-lg-11 col-md-7 col-sm-6">
					<div class = "d-flex justify-content-center">
						<div class="create-account">
							<div>
								<input type="hidden" id="check" value="${check}">
								<form action = "${pageContext.request.contextPath}/customer/modifyCustomerPw" method = "post" id = "modifyPwForm">
									<div>현재 비밀번호</div>
									<div>
										<input type = "password" id = "pw" name = "pw">
										<span id = "pwMsg" class = "msg"></span>
									</div>
									
									<div class="mt-5">새 비밀번호</div>
									<div>
										<input type = "password" id = "newPw" name = "newPw">
										<span id = "newPwMsg" class = "msg"></span>
									</div>
									<div class="mt-5">
										<button type = "button" id = "modifyPwBtn" class="btn primary-btn">비밀번호변경</button>
									</div>
								</form>
							</div>			
						</div>
					</div>
				</div>        		
			</div>          
		</div>
	</section>
    <!-- Contact Section End -->

   <!-- Footer Section Begin -->
    <c:import url="../inc/footer.jsp"></c:import>
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