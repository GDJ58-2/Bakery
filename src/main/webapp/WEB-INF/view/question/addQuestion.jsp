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
	<title>addQuestion.jsp</title>
	
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
			$('#orderCode').focus();
			
			// 주문 내역 유효성 검사
			$('#orderCode').blur(function(){
				if($('#orderCode').val() == ''){
					$('#msg').text('주문 내역을 선택해주세요.');
					$('#orderCode').focus();
				} else {
					$('#msg').text('');
					$('#category').focus();
				}
			});
			
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
					$('#addBtn').focus();
					allCk = true;
				}
			});
			
			$('#addBtn').click(function(){
				if(allCk == false){
					$('#orderCode').focus();
					return false;
				}
				$('#addForm').submit();
			});
		});
	</script>	
</head>
<body>
	<jsp:include page="../inc/customer.jsp"></jsp:include>
	<jsp:include page="../inc/menu.jsp"></jsp:include>
	
	<!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Offcanvas Menu Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__cart">
            <div class="offcanvas__cart__links">
                <a href="#" class="search-switch"><img src="${pageContext.request.contextPath}/resources/static/img/icon/search.png" alt=""></a>
                <a href="#"><img src="${pageContext.request.contextPath}/resources/static/img/icon/heart.png" alt=""></a>
            </div>
            <div class="offcanvas__cart__item">
                <a href="#"><img src="${pageContext.request.contextPath}/resources/static/img/icon/cart.png" alt=""> <span>0</span></a>
                <div class="cart__price">Cart: <span>$0.00</span></div>
            </div>
        </div>
        <div class="offcanvas__logo">
            <a href="./index.html"><img src="${pageContext.request.contextPath}/resources/static/img/logo.png" alt=""></a>
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="offcanvas__option">
            <ul>
                <li>USD <span class="arrow_carrot-down"></span>
                    <ul>
                        <li>EUR</li>
                        <li>USD</li>
                    </ul>
                </li>
                <li>ENG <span class="arrow_carrot-down"></span>
                    <ul>
                        <li>Spanish</li>
                        <li>ENG</li>
                    </ul>
                </li>
                <li><a href="#">Sign in</a> <span class="arrow_carrot-down"></span></li>
            </ul>
        </div>
    </div>
    <!-- Offcanvas Menu End -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="header__top__inner">
                            <div class="header__top__left">
                                <ul>
                                    <li>USD <span class="arrow_carrot-down"></span>
                                        <ul>
                                            <li>EUR</li>
                                            <li>USD</li>
                                        </ul>
                                    </li>
                                    <li>ENG <span class="arrow_carrot-down"></span>
                                        <ul>
                                            <li>Spanish</li>
                                            <li>ENG</li>
                                        </ul>
                                    </li>
                                    <li><a href="#">Sign in</a> <span class="arrow_carrot-down"></span></li>
                                </ul>
                            </div>
                            <div class="header__logo">
                                <a href="./index.html"><img src="${pageContext.request.contextPath}/resources/static/img/logo.png" alt=""></a>
                            </div>
                            <div class="header__top__right">
                                <div class="header__top__right__links">
                                    <a href="#" class="search-switch"><img src="${pageContext.request.contextPath}/resources/static/img/icon/search.png" alt=""></a>
                                    <a href="#"><img src="${pageContext.request.contextPath}/resources/static/img/icon/heart.png" alt=""></a>
                                </div>
                                <div class="header__top__right__cart">
                                    <a href="#"><img src="${pageContext.request.contextPath}/resources/static/img/icon/cart.png" alt=""> <span>0</span></a>
                                    <div class="cart__price">Cart: <span>$0.00</span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="canvas__open"><i class="fa fa-bars"></i></div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li><a href="./index.html">Home</a></li>
                            <li><a href="./about.html">About</a></li>
                            <li class="active"><a href="${pageContext.request.contextPath}/goods/goodsList">상품 안내</a>
                            	<ul class="dropdown">
                            		<li><a href="${pageContext.request.contextPath}/goods/goodsList?categoryKind=">전체</a></li>
                            		<li><a href="${pageContext.request.contextPath}/goods/goodsList?categoryKind=빵">빵</a></li>
                            		<li><a href="${pageContext.request.contextPath}/goods/goodsList?categoryKind=케이크">케이크</a></li>
                            		<li><a href="${pageContext.request.contextPath}/goods/goodsList?categoryKind=델리">델리</a></li>
                            		<li><a href="${pageContext.request.contextPath}/goods/goodsList?categoryKind=디저트">디저트</a></li>
                            		<li><a href="${pageContext.request.contextPath}/goods/goodsList?categoryKind=음료">음료</a></li>
                            	</ul>                
                            </li>
                            <li><a href="#">Pages</a>
                                <ul class="dropdown">
                                    <li><a href="./shop-details.html">Shop Details</a></li>
                                    <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                                    <li><a href="./checkout.html">Check Out</a></li>
                                    <li><a href="./wisslist.html">Wisslist</a></li>
                                    <li><a href="./Class.html">Class</a></li>
                                    <li><a href="./blog-details.html">Blog Details</a></li>
                                </ul>
                            </li>
                            <li><a href="./blog.html">Blog</a></li>
                            <li><a href="./contact.html">Contact</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__text">
                        <h2>문의 작성</h2>
                        <br>
						<div style="color:red;" id="msg">
						${msg}
						</div>																									
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__links">
                        <a href="./index.html">Home</a>
                        <span>문의 작성</span>
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
                        <form action="${pageContext.request.contextPath}/question/addQuestion" method="post" id="addForm">
							<table class="table table-bordered">
								<tr>
									<th>주문 번호 : </th>
									<td>
										<select name="orderCode" id="orderCode">
											<c:choose>
												<c:when test="${map.orderCode ne null}">
													<option value="${map.orderCode}">${map.orderCode} / ${map.goodsName} / ${map.orderQuantity}개</option>
												</c:when>
												<c:otherwise>
													<option value="">===</option>
												</c:otherwise>
											</c:choose>
											<c:forEach var = "order" items = "${orderCodeList}">
												<c:if test="${map.orderCode ne order.orderCode}">
													<option value="${order.orderCode}">${order.orderCode} / ${order.goodsName} / ${order.orderQuantity}개</option>
												</c:if>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr>
									<th>문의 종류 : </th>
									<td>
										<select name="category" id="category">
											<option value="배송">배송</option>
											<option value="반품">반품</option>
											<option value="기타">기타</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>문의 내용 : </th>
									<td>
										<textarea name="questionMemo" id="questionMemo" rows="5" cols="50"></textarea>
									</td>
								</tr>
							</table>
							<button class="btn primary-btn" type="submit" id="addBtn">문의등록</button>
						</form>
                    </div>             
                </div>          
            </div>   
        </div>
    </section>
    <!-- Question Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer set-bg" data-setbg="${pageContext.request.contextPath}/resources/static/img/footer-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="footer__widget">
                        <h6>WORKING HOURS</h6>
                        <ul>
                            <li>Monday - Friday: 08:00 am – 08:30 pm</li>
                            <li>Saturday: 10:00 am – 16:30 pm</li>
                            <li>Sunday: 10:00 am – 16:30 pm</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__logo">
                            <a href="#"><img src="${pageContext.request.contextPath}/resources/static/img/footer-logo.png" alt=""></a>
                        </div>
                        <p>Lorem ipsum dolor amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                        labore dolore magna aliqua.</p>
                        <div class="footer__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-youtube-play"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="footer__newslatter">
                        <h6>Subscribe</h6>
                        <p>Get latest updates and offers.</p>
                        <form action="#">
                            <input type="text" placeholder="Email">
                            <button type="submit"><i class="fa fa-send-o"></i></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7">
                        <p class="copyright__text text-white"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                          Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                          <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                      </p>
                  </div>
                  <div class="col-lg-5">
                    <div class="copyright__widget">
                        <ul>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Terms & Conditions</a></li>
                            <li><a href="#">Site Map</a></li>
                        </ul>
                    </div>
               	  </div>
            	</div>
        	</div>
    	</div>
	</footer>
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