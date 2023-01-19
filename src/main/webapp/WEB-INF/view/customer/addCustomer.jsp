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
            <a href="./index.html"><img src="img/logo.png" alt=""></a>
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
                <li><a href="${pageContext.request.contextPath}/customer/login">Sign in</a><span class="arrow_carrot-down"></span>
                   <ul>
                       <li style = "display:inline-block"><a href = "${pageContext.request.contextPath}/customer/addCustomer"><font size = "2" color = "white">Create&nbsp;Account</font></a></li>
                       <li></li>
                   </ul>
               </li>
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
                                    <li><a href="${pageContext.request.contextPath}/customer/login">Sign in</a> <span class="arrow_carrot-down"></span>
                                    	<ul>
                                    		<li style = "display:inline-block"><a href = "${pageContext.request.contextPath}/customer/addCustomer"><font size = "2" color = "white">Sign&nbsp;up</font></a></li>
                                    	</ul>
                                    </li>
                                </ul>
                            </div>
                            <div class="header__logo">
                                <a href="./index.html"><img src="${pageContext.request.contextPath}/resources/static/img/logo.png" alt=""></a>
                            </div>
                            <div class="header__top__right">
                                <div class="header__top__right__links">
                                    <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>
                                    <a href="#"><img src="img/icon/heart.png" alt=""></a>
                                </div>
                                <div class="header__top__right__cart">
                                    <a href="${pageContext.request.contextPath}/cart/cartList"><img src="${pageContext.request.contextPath}/resources/static/img/icon/cart.png" alt=""> <span>0</span></a>
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
                            <li><a href="${pageContext.request.contextPath}/goods/goodsList">Shop</a></li>
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

    <!-- Create Account Section Begin -->
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
								<form action = "${pageContext.request.contextPath}/customer/addCustomer" method = "post" id = "addForm">
									<table class = "table table-borderless">
										<tr>
											<td>ID</td>
												<td>
													<input type = "text" maxlength = "15" id = "id" class = "addInfo" name = "id" placeholder = "ID">
													<span id = "idMsg" class = "msg"></span>
												</td>
											</tr>
											<tr>
												<td>PW</td>
												<td>
													<span><input type = "password" maxlength = "20" id = "pw" class = "addInfo" name = "pw"></span>
													<span id = "pwMsg" class = "msg"></span><br>
													<span><input type = "password" id = "pwck" class = "addInfo" placeholder = "pw확인"></span>
													<span id = "ckMsg" class = "msg"></span>
												</td>
											</tr>
											<tr>
												<td>Name</td>
												<td>
													<input type = "text" maxlength = "20" id = "name" class = "addInfo" name = "name">
													<span id = "nameMsg" class = "msg"></span>
												</td>
											</tr>
											<tr>
												<td>Phone</td>
												<td>
													<input type = "number" class = "phoneNum" min = "0" oninput="handleOnInput(this, 3)">-<input type = "number" class = "phoneNum" min = "0" oninput="handleOnInput2(this, 4)">-<input type = "number" class = "phoneNum" min = "0" oninput="handleOnInput2(this, 4)">
													<input type = "hidden" id = "phone" name = "phone">
													<span id = "phoneMsg" class = "msg"></span>
												</td> 
											</tr>
											<tr>
												<td>Address</td>
												<td>
													<input type = "radio" class = "addressKind" name = "addressKind" value = "집">집
													&nbsp;
													<input type = "radio" class = "addressKind" name = "addressKind" value = "회사">회사
													<span id = "addressKindMsg" class = "msg"></span>
													<br>
													<input type = "text" id = "address" class = "addInfo" name = "address">
													<span id = "addressMsg" class = "msg"></span>
												</td>
											</tr>
									</table>
								</form>
							</div>
							<div class = "m-1">
								<button type = "button" id = "createBtn" class = "site-btn">create</button>
							</div>
							<div class = "m-1">
								<a href = "${pageContext.request.contextPath}/customer/login">
									<button type = "button" id = "loginBtn" class = "site-btn">login</button>
								</a>
							</div>				
						</div>
					</div>
				</div>        		
			</div>          
		</div>
	</section>
    <!-- Contact Section End -->

   <!-- Footer Section Begin -->
    <footer class="footer set-bg" data-setbg="${pageContext.request.contextPath}/resources/static/img/footer-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="footer__widget">
                        <h6>WORKING HOURS</h6>
                        <ul>
                            <li>Monday - Friday: 08:00 am – 08:30 pm</li>
                            <li>Saturday: 10:00 am – 16:30 pm</li>
                            <li>Sunday: 10:00 am – 16:30 pm</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4">
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
                <div class="col-lg-4">
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