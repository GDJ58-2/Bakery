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
		
		#id, #pw, #pwck, #name, #address {
			border-bottom : black 1px solid;
			border-left: medium none;
			border-right: medium none;
			border-top: medium none;
		}
		
	</style>
	    
   
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script>
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
			
			let number = null;
			let msgCk = 0;
			$('#id').focus();
			$('#id').blur(function() {
				if($('#id').length > 20) {
					alert('ID는 20자 이하로 입력하세요');
					$('#id').val('');
					$('#id').focus();
				}
			});
		
			
			$('#createBtn').click(function() {
				
				// 아이디
				if($('#id').val() == ''){
					$('#idMsg').text('ID를 입력하세요');
				} else {
					$('#idMsg').text('');
					$('#pw').focus();
				}
				// 비밀번호
				if($('#pw').val() == ''){
					$('#pwMsg').text('pw를 입력하세요');
				} else {
					$('#pwMsg').text('');
					$('#pwck').focus();
				}
				// 비밀번호 확인
				if($('#pw').val() != $('#pwck').val()){
					$('#ckMsg').text('pw가 일치하지 않습니다');
				} else {
					$('#ckMsg').text('');
				}
				// 이름확인
				if($('#name').val() == ''){
					$('#nameMsg').text('이름을 입력하세요');
				} else {
					$('#nameMsg').text('');
				}
				// 전화번호 확인
				$('.phoneNum').each(function() {
					
					if($(this).val() == '') {
						$('#phoneMsg').text('전화번호를 입력하세요');
					} else {
						$('#phoneMsg').text('');
						number = $($('.phoneNum')[0]).val()+'-'+$($('.phoneNum')[1]).val()+'-'+$($('.phoneNum')[2]).val();
						console.log(number);
						$('#phone').val(number);
						console.log('phoneNumber: '+$('#phone').val());
					}
				});
				// 주소확인
				if($('#address').val() == '') {
					$('#addressMsg').text('주소를 입력하세요');
				} else {
					$('#addressMsg').text('');
					if($('.addressKind:checked').length == 0) {
						$('#addressKindMsg').text('주소지 이름을 선택하세요');
						return;
					} else {
						$('#addressKindMsg').text('');
					}
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
						$('#addForm').submit();
					}
				});
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
                        <h2>내 리뷰</h2>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__links">
                        <a href="${pageContext.request.contextPath}/customer/myHome">My Page</a>
                        <span>내 리뷰</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
	

    <!-- Create Account Section Begin -->
	<section class="review spad">
    	<div class="container">
			<div class="row">  
				<div class="col-lg-11">
					<div class = "review__table">
						<div>

							<div>
								<div class="order__List">
								<div>작성 가능한 리뷰</div>
									<table>
										<c:forEach var = "nr" items = "${noReviewList}" varStatus = "i">
											<tr>
												<td class="product__item">${nr.orderCode}</td>
												<td class="product__item__pic">
													<img src = "${pageContext.request.contextPath}/upload/${nr.filename}" width = "70" height = "70">
												</td>
												<td class="product__item__text">${nr.goodsName}</td>
												<td>
													<div class = "review__btn">
													<a href = "${pageContext.request.contextPath}/review/addReview?orderCode=${nr.orderCode}">
														리뷰쓰기
													</a>
													</div>
												</td>
											</tr>	
										</c:forEach>
									</table>
								</div>
								<div class="line"></div>
								<div class="review__List">
								
									<div>내가 쓴 리뷰</div>
									<table>
										<c:forEach var = "n" items = "${reviewList}" varStatus = "i">
											<tr>
												<td>${n.orderCode}</td>
												<td class="product__item__pic">
													<img src = "${pageContext.request.contextPath}/upload/${nr.filename}" width = "70" height = "70">
												</td>
												<td>${n.goodsName}</td>
												<td>${n.reviewMemo}</td>
												<td>
													<a href = "${pageContext.request.contextPath}/review/modifyReview?orderCode=${n.orderCode}">
														수정하기
													</a>
												</td>
												<td>
													<a href = "${pageContext.request.contextPath}/review/removeReview?orderCode=${n.orderCode}">
														삭제하기
													</a>
												</td>
											</tr>	
										</c:forEach>
									</table>
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