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
		.create-account {
  			margin-bottom: 30px;
		}
		.create-account h6 {
  			color: #111111;
  			font-weight: 600;
  			text-transform: uppercase;
  			margin-bottom: 25px;
		}
		.required, #pwck {
			border-bottom : black 1px solid;
			border-left: medium none;
			border-right: medium none;
			border-top: medium none;
		}	
	</style>
<script>
	// 자바스크립트 유효성 검사
	$(document).ready(function(){
		
		$('#submitBtn').click(function(){
			
			let blank = 0;
			
			if($('input[name="empPw"]').val()!=$('#pwck').val()){ 
				$('#ckMsg').text('비밀번호와 비밀번호확인이 일치하지 않습니다.');
			} else {
				$('#ckMsg').text('');
			}
			
			$('.required').each(function() {
				if($(this).val() == '') {
					$(this).nextAll().eq(1).text('* 필수정보입니다.');
				} else {
					$(this).nextAll().eq(1).text('');
					++ blank 
					console.log('blank'+blank);
					console.log('length'+$('.required').length);
					
					if(blank == $('.required').length) {
						$('#addEmpForm').submit();
					}
				}
			});
		});
	});
</script>
<title>회원가입 | 직원 | 구디쥬르</title>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
	
	<!-- Create Account Section -->
	<section class="contact spad">
    	<div class="container">
    	
			<div class="row">  
				<div class="col-lg-11 col-md-7 col-sm-6">
					<div class = "d-flex justify-content-center">
						<div class="create-account">
							<div>
								<h6>Create Account - employee</h6>
                        	</div>
                        	<div>
                        		<form action="${pageContext.request.contextPath}/admin/emp/addEmp" method="post" id="addEmpForm">
                        			<table class="table table-borderless">
                        				<tr>
                        					<td>ID</td>
                        					<td>
                        						<input type="text" class="addInfo required" name="empId" placeholder="ID">
                        						<br>
                        						<span class="msg">${msg}</span>
                        					</td>
                        				</tr>
                        				<tr>
                        					<td>PW</td>
                        					<td>
                        						<input type="password" maxlength="20" class="addInfo required" name="empPw" placeholder="Password">
                        						<br>
                        						<span class="msg"></span>
                        						<br>
                        						<span><input type="password" id="pwck" class="addInfo required" placeholder="비밀번호 확인"></span>
                        						<br>
												<span id="ckMsg" class="msg"></span>
                        					</td>
                        				</tr>
                        				<tr>
                        					<td>Name</td>
                        					<td>
                        						<input type="text" maxlength="20" class="addInfo required" name="empName">
                        						<br>
                        						<span class="msg"></span>
                        					</td>
                        				</tr>
                        			</table>
								</form>
                        	</div>
                        	<div class="m-1">
								<button type="button" id="submitBtn" class="signup-btn btn-block">create</button>
							</div>
							<div class="m-1">
								<a href="${pageContext.request.contextPath}/admin/emp/loginEmp">
									<button type="button" id="loginBtn" class="login-btn btn-block">login</button>
								</a>
							</div>	
						</div>
					</div>
				</div>        		
			</div>          
		</div>
	</section>
    <!-- Section End -->
    
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