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
    <title>내 리뷰 | 구디쥬르</title>

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
		
		textarea {
  			 width: 100%;
  			 height: 6.25em;
  			 border: none;
   			 resize: none;
		 }
		 
		 .input-div{
		    vertical-align: middle;
		 }
		 
		 .btnBox {
		 	margin-left: 70px;
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

		let customerUrl = '${pageContext.request.contextPath}/customer/logout';
		function logoutAction(customerUrl) {
 			let out = confirm('로그아웃하시겠습니까?'); 
 		 	if(out) {
      			location.replace(customerUrl); 
          		alert('로그아웃되었습니다');
	       	} else {
	          	alert('로그아웃 취소');
	          	return false;
	       	}
		 }  
		
		$(document).ready(function() {
			$('#logoutBtn').click(function() {
	   			logoutAction(customerUrl);
	   		});
			
			// 리뷰 등록 알림창
			if($('#reviewMsg').val() == "Y" && $('#reviewMsg').val() != '') {
				alert('리뷰를 등록하였습니다');
			} 
			
			// 리뷰 수정 알림창
			if($('#modifyReviewMsg').val() == "Y" && $('#modifyReviewMsg').val() != '') {
				alert('리뷰를 수정하였습니다');
			} 
			
			// 리뷰 삭제 알림창
			if($('#deleteReviewMsg').val() == "Y" && $('#deleteReviewMsg').val() != '') {
				alert('리뷰를 삭제하였습니다');
			} else if($('#deleteReviewMsg').val() == "N" && $('#deleteReviewMsg').val() != '') {
				alert('리뷰 삭제에 실패하였습니다 다시 시도하십시오');
			}
			
			 $("#input-letter").on("propertychange change keyup paste input",function(){
		     	$(this).height(1).height($(this).prop('scrollHeight'));    
		    });
		});
	</script>
</head>

<body>
   <!-- Header Section Begin -->
   	<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
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
								<div>작성 가능한 리뷰</div>
								<div class="order__List">
									<div>
									<table>
										<c:choose>
											<c:when test="${!empty noReviewList}">
												<c:forEach var = "nr" items = "${noReviewList}" varStatus = "i">
													<tr>
														<td class="product__item">${nr.orderCode}</td>
														<td class="product__item__pic">
															<img src = "${pageContext.request.contextPath}/upload/${nr.originName}" width = "70" height = "70">
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
											</c:when>
											<c:when test="${empty noReviewList}">
												<div class="mt-5">주문내역이 없습니다</div>
											</c:when>
										</c:choose>
									</table>
									</div>
								</div>
								<div class="line"></div>
								
								<div class="mt-5">내가 쓴 리뷰</div>
								<div class="review__List">
								
								<!-- controller로 부터 넘어온 리뷰 등록/수정/삭제 성공여부에 대한 메시지 -->
									<input type="hidden" id="reviewMsg" value="${reviewMsg}">
									<input type="hidden" id="modifyReviewMsg" value="${modifyReviewMsg}">
									<input type="hidden" id="deleteReviewMsg" value="${deleteReviewMsg}"> 
									
									<table>
										<c:choose>
											<c:when test="${!empty reviewList}">
												<c:forEach var = "n" items = "${reviewList}" varStatus = "i">
													<tr>
														<td>${n.orderCode}</td>
														<td class="product__item__pic">
															<img src = "${pageContext.request.contextPath}/upload/${n.originName}" width = "70" height = "70">
														</td>
														<td>${n.goodsName}</td>
														<td>
															<div class="input-div">
																<div class="mt-5">
																	<textarea id="input-letter" maxlength="40" rows="1" style="resize: none;" spellcheck="false" readonly="readonly">${n.reviewMemo}</textarea>
																</div>
															</div>
														</td>
														<td>
															<div class="btnBox">
																<div class = "review__btn">
																	<span>
																	<a href = "${pageContext.request.contextPath}/review/modifyReview?orderCode=${n.orderCode}">
																		수정하기
																	</a>
																	</span>
																	<span>
																	<a href = "${pageContext.request.contextPath}/review/removeReview?orderCode=${n.orderCode}">
																		삭제하기
																	</a>
																	</span>
																</div>
															</div>
														</td>
													</tr>	
												</c:forEach>
										</c:when>
										<c:when test="${empty reviewList}">
											<div class="mt-5">등록된 리뷰가 없습니다</div>
										</c:when>
										</c:choose>
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