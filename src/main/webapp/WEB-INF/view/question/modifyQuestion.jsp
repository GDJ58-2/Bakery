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
	<title>문의 수정 | 구디쥬르</title>
	
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
	<!-- 자바스크립트로 유효성 확인 -->
	<script>
		$(document).ready(function(){ // 페이지가 로드되고 나면 실행
			let allCk = false;
			$('#category').focus();
			
			// 문의 종류 유효성 검사
			$('#category').blur(function(){
				if($('#category').val() == ''){
					$('#msg').text('문의 종류를 선택해주세요.');
					$('#category').focus();
				} else {
					$('#msg').text('');
					$('#questionMemo').focus();
				}
			});
			
			// 문의 내용 유효성 검사
			$('#questionMemo').blur(function(){
				if($('#questionMemo').val() == ''){
					$('#msg').text('문의 내용을 입력해주세요.');
					$('#questionMemo').focus();
				} else {
					$('#msg').text('');
					$('#modifyBtn').focus();
					allCk = true;
				}
			});
			
			$('#modifyBtn').click(function(){
				if(allCk == false){
					$('#category').focus();
					return false;
				}
				$('#modifyForm').submit();
			});
		});
	</script>	
</head>
<body>
	
	<!-- Header Section Begin -->
   	<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
	<!-- Header Section End -->

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__text">
                        <h2>문의 수정</h2>
                        <br>
						<div style="color:red;" id="msg">
						${msg}
						</div>													
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__links">
                        <a href="./index.html">Home</a>
                        <span>문의 수정</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
	
    <!-- Question Section Begin -->
    <section class="shop spad">
        <div class="container">         
            <div class="row">          		
                <div class="col-lg-12">
	            	<div class="product__details__text">                       
                        <form action="${pageContext.request.contextPath}/question/modifyQuestion" method="post" id="modifyForm">
							<table class="table table-bordered">
								<tr>
									<th>문의 번호 : </th>
									<td>
										<input type="number" name="questionCode" value="${question.questionCode}" readonly="readonly">
									</td>
								</tr>
								<tr>
									<th>주문 번호 : </th>
									<td>
										<input type="number" name="orderCode" value="${question.orderCode}" readonly="readonly">
									</td>
								</tr>
								<tr>
									<th>문의 종류 : </th>
									<td>
										<select name="category" id="category">
											<option>${question.category}</option>
											<c:if test="${question.category ne '배송'}">
												<option value="배송">배송</option>
											</c:if>
											<c:if test="${question.category ne '반품'}">
												<option value="반품">반품</option>
											</c:if>
											<c:if test="${question.category ne '교환'}">
												<option value="교환">교환</option>
											</c:if>	
											<c:if test="${question.category ne '기타'}">
												<option value="기타">기타</option>
											</c:if>
										</select>
									</td>
								</tr>
								<tr>
									<th>문의 메모 : </th>
									<td>
										<textarea name="questionMemo" id="questionMemo" rows="5" cols="50">${question.questionMemo}</textarea>
									</td>
								</tr>
								<tr>
									<th>문의 날짜 : </th>
									<td>
										<input type="text" name="createdate" value="${question.createdate}" readonly="readonly">
									</td>
								</tr>
							</table>
							<button class="btn primary-btn" type="submit" id="modifyBtn">수정</button>
						</form>
                    </div>             
                </div>          
            </div>   
        </div>
    </section>
    <!-- Question Section End -->

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