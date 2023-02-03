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
	$(document).ready(function(){
		
		// 취소
		$('#cancelBtn').click(function(){
			location.href = '/bakery/admin/emp/home';
		});
		
		// 변경
		$('#submitBtn').click(function(){
			
			if($('#empPw').val().length==0) {
				alert('비밀번호를 입력하세요.');
				$('#empPw').focus();
				return;
			}
			if($('#newEmpPw').val().length==0) {
				alert('새 비밀번호를 입력하세요.');
				$('#newEmpPw').focus();
				return;
			}
			if($('#checkEmpPw').val().length==0) {
				alert('비밀번호 확인을 입력하세요.');
				$('#checkEmpPw').focus();
				return;
			}
			if($('#newEmpPw').val()!=$('#checkEmpPw').val()) {
				alert('새 비밀번호와 비밀번호 확인이 일치하지 않습니다.');
				$('#newEmpPw').val('');
				$('#checkEmpPw').val('');
				$('#newEmpPw').focus();
				return;
			}
			$('#modifyEmpPwForm').submit();
		});
	});
</script>
<title>비밀번호 변경 | 직원 | 구디쥬르</title>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>	
	
	<!-- 비밀번호 변경 section -->
	<section class="contact spad">
    	<div class="container">
			<div class="row">  
				<div class="col-lg-11 col-md-7 col-sm-6">
					<div class = "d-flex justify-content-center">
						<div class="create-account">
							<div>
								<h6>비밀번호 변경</h6>
                        	</div>
							<div>
								<form action="${pageContext.request.contextPath}/admin/emp/modifyEmpPw" method="post" id="modifyEmpPwForm">
									<input type="hidden" value="${e.empCode}" name="empCode"> 
									<table class="table table-borderless">
										<tr>
											<td>현재 비밀번호</td>
											<td><input type="password" id="empPw" name="empPw" class="addInfo required"></td>
										</tr>
										<tr>
											<td>새 비밀번호</td>
											<td><input type="password" id="newEmpPw" name="newEmpPw" class="addInfo required"></td>
										</tr>
										<tr>
											<td>비밀번호 확인</td>
											<td><input type="password" id="checkEmpPw" name="checkEmpPw" class="addInfo required"></td>
										</tr>
									</table>
								</form>
							</div>
							<div class="m-1">
								<button type="button" id="submitBtn" class="signup-btn btn-block">변경</button>
							</div>	
							<div class="m-1">
								<button type="button" id="cancelBtn" class="cancel-btn btn-block">취소</button>
							</div>		
						</div>
					</div>
				</div>        		
			</div>          
		</div>
	</section>
    <!-- /비밀번호 변경 -->
	
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