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
		.cancel-btn, .signup-btn {
			text-align: center;
			vertical-align: middle;
			height: 33px;
			width: 58px;
		}
		.card, .table {
			overflow: visible;
		}
		.card {
			margin-bottom: 50px;
		}
		.nice-select {
			display: inline-block;
			float: none;
			width: 50%;
		}
	</style>
	
<script>
	$(document).ready(function(){
		
		// 취소
		$('#cancelBtn').click(function(){
			location.href = '/bakery/admin/emp/empList';
		});
		
		// 변경
		$('#submitBtn').click(function(){
			$('#modifyEmpForm').submit();
		});
	});
</script>
<title>정보 수정 | 직원 관리 | 구디쥬르</title>
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
							<h2>직원관리</h2>
						</div>
					</div>	
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="breadcrumb__links">
							<a href="">Home</a>
							<a href="${pageContext.request.contextPath}/admin/emp/empList">목록</a>
							<span>정보 수정</span>
						</div>
					</div> 	
				</div>
			</div>
		</div>
		<!-- /breadcrumb -->
			
		<!-- modifyEmp section -->
		<section class="blog-details spad">
			<div class="container">
			
				<div class="row d-flex justify-content-center">
					<div class="col-lg-12">
					
						<div class="card">
							<div class="card-body">
									
								<form action="${pageContext.request.contextPath}/admin/emp/modifyEmp" method="post" id="modifyEmpForm">
									<input type="hidden" name="empId" value="${e.empId}">
									<input type="hidden" name="empCode" value="${e.empCode}">
									<table class="table text-center">
										<thead class="table-primary">
											<tr>
												<th>번호</th>
												<th>ID</th>
												<th>이름</th>
												<th>활성화</th>
												<th>권한</th>
												<th>등록일</th>
												<th>&nbsp;</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>${e.empCode}</td>
												<td>${e.empId}</td>
												<td>${e.empName}</td>
												<td>${e.active}</td>
												<td>
													<select name="authCode" id="authCode">
														<c:forEach var="a" items="${authInfoList}">
															<c:if test="${a.authCode eq e.authCode}">
																<option selected="selected" value="${a.authCode}">${a.authCode} ${a.authMemo}</option>
															</c:if>
															<c:if test="${a.authCode ne e.authCode}">
																<option value="${a.authCode}">${a.authCode} ${a.authMemo}</option>
															</c:if>
														</c:forEach>
													</select>
												</td>
												<td>
													<button type="button" id="submitBtn" class="signup-btn">변경</button>
													<button type="button" id="cancelBtn" class="cancel-btn">취소</button>
												</td>
											</tr>
										</tbody>
									</table>
								</form>
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