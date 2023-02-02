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
<script>
	$(document).ready(function(){
		$('#submitBtn').click(function(){
			if($('#noticeTitle').val().length==0) {
				alert('제목을 입력해주세요.');
				$('#noticeTitle').focus();
				return;
			}
			if($('#noticeContent').val().length==0) {
				alert('내용을 입력해주세요.');
				$('#noticeContent').focus();
				return;
			}
			$('#addNoticeForm').submit();
		});
	});
</script>
<title>공지사항 | 구디쥬르</title>
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
						<h2>공지사항</h2>
					</div>
				</div>	
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="breadcrumb__links">
						<a href="">Home</a>
						<a href="${pageContext.request.contextPath}/notice/noticeList">목록</a>
						<span>공지 작성</span>
					</div>
				</div> 	
			</div>
		</div>
	</div>
	<!-- /breadcrumb -->
	
	<!-- add notice form -->
	<section class="blog-details spad">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<form action="${pageContext.request.contextPath}/admin/notice/addNotice" method="post" id="addNoticeForm">
								<div>
									<input type="text" name="noticeTitle" id="noticeTitle" class="form-control" placeholder="제목을 입력하세요.">
								</div>
								<div>
									<textarea rows="5" cols="50" name="noticeContent" id="noticeContent" class="form-control" placeholder="내용을 입력하세요."></textarea>
								</div>
								<div class="text-center">
									<button type="button" id="submitBtn" class="primary-btn">등록</button>
								</div>
							</form>
						</div>
					</div>
				</div>
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