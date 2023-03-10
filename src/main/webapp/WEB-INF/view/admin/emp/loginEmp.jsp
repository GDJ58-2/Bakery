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
	<style>
		body {
			margin: 0;
		}
	</style>
	
<script>
	// 자바스크립트 유효성 검사
	$(document).ready(function(){
		console.log(!!$('#msg').val()); // !! : 다른 타입의 데이터를 boolean 타입으로 명시적으로 형 변환(Type Conversion)
		console.log($('#msg').val());
		if(!!$('#msg').val()){
			let msg = $('#msg').val();
			msg = msg.replace(/\n/g, '<br/>'); // \n 을 <br>로 치환
			$('.msg').html(msg);
		}
		$('#loginBtn').click(function(){
			if($('#empId').val().length==0){
				$('.msg').text('아이디를 입력해주세요.');
				$('#empId').focus();
				return;
			}
			if($('#empPw').val().length==0){
				$('.msg').text('비밀번호를 입력해주세요.');
				$('#empPw').focus();
				return;
			}
			$('#loginEmpForm').submit();
		});
	});
</script>

<title>로그인 | 직원 | 구디쥬르</title>
</head>
<body>
	<input type="hidden" id="msg" value="${msg}">
	<!-- header -->
	<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
	
	<!-- login section -->
    <section class="contact spad">
        <div class="container">
            
            <div class = "d-flex justify-content-center">
                <div class="row">
                    <div class="col-lg-12 col-md-7 col-sm-6">
                        <div class="contact__address__item">
                            <h6>Login - employee</h6>
                            <div>
								<form action="${pageContext.request.contextPath}/admin/emp/loginEmp" method="post" id="loginEmpForm">
									<table>
										<tr>
											<td>ID</td>
											<td>
												<input type="text" name="empId" id="empId" value="emp">
											</td>
										</tr>
										<tr>
											<td>PW</td>
											<td>
												<input type="password" name="empPw" id="empPw" value="1234">
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<span class="msg"></span>
											</td>
										</tr>
									</table>
								</form>
							</div>
							<div class="mt-1 mb-4">
								<span class="float-right">
                           			<a href="${pageContext.request.contextPath}/customer/login">
                           				<font size="2" color="black">고객로그인</font>
                           			</a>
								</span>
							</div>
							<div class="mt-2">
								<div>
									<button type="button" id="loginBtn" class="login-btn btn-block">login</button>
								</div>
								<div class="mt-1">
									<a href="${pageContext.request.contextPath}/admin/emp/addEmp">
										<button type="button" id="createBtn" class="site-btn btn-block">create account</button>
									</a>
								</div>
							</div>
                    	</div>
                	</div>
                	
            	</div>  
        	</div>
        	
		</div>
   	</section>
	<!-- login section End -->
	
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