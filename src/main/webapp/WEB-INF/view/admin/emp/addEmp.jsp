<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		
		#empId, #empPw, #pwck, #empName {
			border-bottom : black 1px solid;
			border-left: medium none;
			border-right: medium none;
			border-top: medium none;
		}
		
	</style>
<script>
	// 자바스크립트 유효성 검사
	$(document).ready(function(){
		
		let msgCk = 0;
		
		$('#empId').blur(function(){
			if($('#empId').val().length>20) {
				$('#empId').val($('#empId').val().substr(0, 20));
				$('#empIdMsg').text('20자 이하로 입력하세요.');
				$('#empId').focus();
			} else if($('#empId').val().length==0) {
				$('#empIdMsg').text('필수정보입니다.');
				$('#empId').focus();
			} 
		});
		
		$('#submitBtn').click(function(){
			$('#empNameMsg').text('');
			$('#empIdMsg').text('');
			$('#empPwMsg').text('');
			$('#ckMsg').text('');
			
			if($('#empId').val().length==0){ 
				$('#empIdMsg').text('필수정보입니다.');
				$('#empId').focus();
			}
			if($('#empPw').val().length==0){ 
				$('#empPwMsg').text('필수정보입니다.');
				$('#empPw').focus();
			}
			if($('#empName').val().length==0){ 
				$('#empNameMsg').text('필수정보입니다.');
				$('#empName').focus();
				return;
			}
			if($('#empPw').val()!=$('#pwck').val()) {
				$('#ckMsg').text('비밀번호와 비밀번호확인이 일치하지 않습니다.');
				$('#pwck').val('');
				$('#pwck').focus();
				return;
			}
			
			$('.msg').each(function() {
				if($(this).text() != '') {
					$(this).prev().focus();
					return false;
				} else {
					++ msgCk 
					console.log('msgCk'+msgCk);
					console.log('length'+$('.msg').length);
				}
				if(msgCk == $('.msg').length) {
					$('#addForm').submit();
				}
			});
			
			$('#addEmpForm').submit();
		});
	});
</script>
<title>addEmp</title>
</head>
<body>
	<jsp:include page="../../inc/empMenu.jsp"></jsp:include>
	<jsp:include page="../../inc/menu.jsp"></jsp:include>
	
	<!-- Create Account Section -->
	<section class="contact spad">
    	<div class="container">
			<div class="row">  
				<div class="col-lg-11 col-md-7 col-sm-6">
					<div class = "d-flex justify-content-center">
						<div class="create-account">
							<div>
								<h6>Create Account</h6>
                        	</div>
                        	<div>
                        		<form action="${pageContext.request.contextPath}/admin/emp/addEmp" method="post" id="addEmpForm">
                        			<table class="table table-borderless">
                        				<tr>
                        					<td>ID</td>
                        					<td>
                        						<input type="text" id="empId" class="addInfo" name="empId" placeholder="ID">
                        						<span id="empIdMsg" class="msg">${msg}</span>
                        					</td>
                        				</tr>
                        				<tr>
                        					<td>PW</td>
                        					<td>
                        						<input type="password" maxlength="20" id="empPw" class="addInfo" name="empPw" placeholder="Password">
                        						<span id="empPwMsg"></span>
                        						<span><input type="password" id="pwck" class="addInfo" placeholder="비밀번호 확인"></span>
												<span id="ckMsg" class="msg"></span>
                        					</td>
                        				</tr>
                        				<tr>
                        					<td>Name</td>
                        					<td>
                        						<input type="text" maxlength="20" id="empName" class="addInfo" name="empName">
                        						<span id="empNameMsg"></span>
                        					</td>
                        				</tr>
                        			</table>
								</form>
                        	</div>
                        	<div class="m-1">
								<button type="button" id="submitBtn" class="site-btn">create</button>
							</div>
							<div class="m-1">
								<a href="${pageContext.request.contextPath}/admin/emp/loginEmp">
									<button type="button" id="loginBtn" class="site-btn">login</button>
								</a>
							</div>	
						</div>
					</div>
				</div>        		
			</div>          
		</div>
	</section>
    <!-- Contact Section End -->
	
	
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