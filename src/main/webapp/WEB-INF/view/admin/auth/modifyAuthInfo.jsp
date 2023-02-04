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
		.card {
			height: 100%;
		}
	</style>
<script>
	$(document).ready(function(){
		$('#submitBtn').click(function(){
			if($('#authMemo').val().length==0) {
				$('#authMemoMsg').text('등급을 작성해주세요.');
				$('#authMemo').focus();
				return;
			}
			$('#modifyAuthInfoForm').submit();
		});
	});
</script>
<title>관리자 권한 관리 | 구디쥬르</title>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
	
	<!-- breadcrumb -->
	<div class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="breadcrumb__text">
						<h2>관리자 권한 관리</h2>
					</div>
				</div>	
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="breadcrumb__links">
						<a href="">Home</a>
						<a href="${pageContext.request.contextPath}/admin/auth/authInfoList">목록</a>
						<span>추가</span>
					</div>
				</div> 	
			</div>
		</div>
	</div>
	<!-- /breadcrumb -->
	
	<!-- form -->
	<section class="blog-details spad">
		<div class="container">
			<div class="row d-flex">
			
				<!-- modify AuthInfo form -->
				<div class="col-lg-6">
					<div class="card">
						<div class="card-body">
							<form action="${pageContext.request.contextPath}/admin/auth/modifyAuthInfo" method="post" id="modifyAuthInfoForm">
								<div>
									<input type="number" name="authCode" readonly="readonly" value="${a.authCode}" class="form-control">
								</div>
								<div>
									<input type="text" name="authMemo" value="${a.authMemo}" id="authMemo" class="form-control" placeholder="내용을 입력하세요.">
									<span id="authMemoMsg"></span>
								</div>
								<div><button type="button" id="submitBtn" class="primary-btn">등록</button></div>
							</form>
						</div>
					</div>
				</div>
				<!-- /modify AuthInfo form -->	
			
				<!-- authInfo List -->
				<div class="col-md-6">
					<div class="card">
						<div class="card-body">
							
							<table class="table text-center">
								<thead class="table-primary">
									<tr>
										<th>번호</th>
										<th>등급</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="al" items="${authInfoList}">
										<c:if test="${a.authCode == al.authCode}">
											<tr style="background: #f2f2f2">
												<td>${al.authCode}</td>
												<td class="title">${al.authMemo}</td>
											</tr>
										</c:if>
										<c:if test="${a.authCode != al.authCode}">
											<tr>
												<td>${al.authCode}</td>
												<td class="title">${al.authMemo}</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- /authInfo List -->
				
			</div>
		</div>
	</section>
	
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