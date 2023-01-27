<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	
	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script>
	
		$(document).ready(function() {
			// 총 금액
			$('.checkGoodsCode').each(function() {
				$('.checkGoodsCode').change(function() {
					var total = 0;
					var cartPrice = 0;
					if($('.checkGoodsCode').is(':checked')) {
						var thisRow = $(this).closest('tr');
						cartPrice = Number(thisRow.find('td:eq(3)').find('span').text().substring(1));
						total = total + cartPrice;
					}
					console.log('cartPrice: '+cartPrice+' /total: '+total);
				});
			});
			
			// 수량변경버튼
			$('.quantity__item').on('click', '.modify', function() {
				var code = a.dataset.goodsCode;
				var quantity = $(this).find('input.cQuantity').val();
				console.log('gCode: '+code+'/cQuantity: '+quantity);
				var url = '${pageContext.request.contextPath}/cart/modifyCart?goodsCode='+code+'&cartQuantity='+quantity;
				location.replace(url);
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
                <a href="#"><img src="img/icon/heart.png" alt=""></a>
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
                                    <li><a href="${pageContext.request.contextPath}/customer/login">Sign in</a><span class="arrow_carrot-down"></span>
					                   <ul>
					                       <li style = "display:inline-block"><a href = "${pageContext.request.contextPath}/customer/addCustomer"><font size = "2" color = "white">Create&nbsp;Account</font></a></li>
					                       <li></li>
					                   </ul>
					               </li>
                                </ul>
                            </div>
                            <div class="header__logo">
                                <a href="./index.html"><img src="${pageContext.request.contextPath}/resources/static/img/logo.png" alt=""></a>
                            </div>
                            <div class="header__top__right">
                                <div class="header__top__right__links">
                                    <a href="#" class="search-switch"><img src="${pageContext.request.contextPath}/resources/static/img/icon/search.png" alt=""></a>
                                    <a href="#"><img src="img/icon/heart.png" alt=""></a>
                                </div>
                                <div class="header__top__right__cart">
                                    <a href="${pageContext.request.contextPath}/cart/cartList"><img src="${pageContext.request.contextPath}/resources/static/img/icon/cart.png" alt=""> <span id = "quantity"></span></a>
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
                            <li class="active"><a href="${pageContext.request.contextPath}/goods/goodsList">Shop</a></li>
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
                        <h2>Shopping cart</h2>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__links">
                        <a href="./index.html">Home</a>
                        <span>Shopping cart</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="shopping__cart__table">
                    	<input type = "hidden" id = "stockMsg" value = "${stockMsg}">
                    	<c:choose>
                    		<c:when test = "${fn:length(userList) ne 0 || fn:length(customerList) ne 0}">
                    			<c:choose>
                    				<c:when test = "${userList ne null}"> <!-- 비회원장바구니 -->
                        				<table>
                            			<thead>
                                			<tr>
                                				<th>
                                					<div class = "justify-content-start">
				                                		<button type = "button" class = "cart__allcheck__btn" id = "chkAll"><i class='far fa-check-square' style='font-size:20px'></i></button>
				                                    </div>
                                				</th>
                                    			<th>Product</th>
                                    			<th>Quantity</th>
                                    			<th>Total</th>
                                    			<th></th>
                                			</tr>
                            			</thead>
                            			<tbody>
                            				<c:forEach var = "user" items = "${userList}">
                            					<c:choose>
                            						<c:when test = "${user.cartQuantity == 0}">  <!-- 재고부족일 때 -->
                                						<tr>
                                							<td>
                                								<input type="checkbox" name="checkedGoodsCode" class = "checkGoodsCode" value="${user.goodsCode}" onClick = "return false;">
                                		 						<input type="hidden" name="goodsCode" value="${user.goodsCode}">	
                                							</td>
                                   	 						<td class="product__cart__item">
                                        						<div class="product__cart__item__pic">
                                            						<img src = "${pageContext.request.contextPath}/upload/${user.filename}" width = "70" height = "70">
                                        						</div>
                                        						<div class="product__cart__item__text">
                                            						<h6><input type="hidden" name="goodsName" value="${user.goodsName}">${user.goodsName}</h6>
                                            						<h5>&#8361;${user.goodsPrice}</h5>
                                        						</div>
                                    						</td>
                                    						<td>품절</td>
                                    						<td class="cart__close">
                                    							<a href = "${pageContext.request.contextPath}/cart/removeCartList?goodsCode=${user.goodsCode}">
											 						<span class="icon_close"></span>
																</a>
															</td>
                                						</tr>
                         							</c:when>
                         							<c:otherwise>
                         								<tr>
                               								<td>
                               									<input type="checkbox" name="checkedGoodsCode" class = "checkGoodsCode" value="${user.goodsCode}">
                               		 							<input type="hidden" name="goodsCode" class = "gCode" value="${user.goodsCode}">
                               								</td>
                                   							<td class="product__cart__item">
                                       							<div class="product__cart__item__pic">
                                          							<img src = "${pageContext.request.contextPath}/upload/${user.filename}" width = "70" height = "70">
                                      	 						</div>
                                       							<div class="product__cart__item__text">
                                           							<h6><input type="hidden" name="goodsName" value="${user.goodsName}">${user.goodsName}</h6>
                                           							<h5>&#8361;${user.goodsPrice}</h5>
                                       							</div>
                                   							</td>
                                    						<td class="quantity__item">
                                        						<div class="quantity">
                                            						<div class="pro-qty">
                                                						<input type="text" class = "cQuantity" name="cartQuantity" value = "${user.cartQuantity}">개
                                            						</div>
                                        						</div>
                                        						<div class = "cart__modify__btn">
                                        							<a href = "#" class = "modifyBtn" data-goodsCode = "${user.goodsCode}">수정</a>
                                        						</div>
                                    						</td>
                                   							<td class="cart__price">&#8361;${user.goodsPrice * user.cartQuantity}</td>
                                   							<td class="cart__close">
                                   								<a href = "${pageContext.request.contextPath}/cart/removeCartList?goodsCode=${user.goodsCode}">
										 							<span class="icon_close"></span>
																</a>
															</td>
                               							</tr>
                         							</c:otherwise>
                         						</c:choose>
                         					</c:forEach>
                            			</tbody>
                        				</table>
                        			</c:when>
                        			<c:when test = "${customerList ne null && loginCustomer ne null}"> 	<!-- 회원장바구니 -->
                        				<form action="${pageContext.request.contextPath}/orders/addOrdersList" id = "orderForm" method="post">
                        					<table>
                         					<thead>
                                				<tr>
				                                	<th>
				                                	<div class = "justify-content-start">
				                                		<button type = "button" class = "cart__allcheck__btn" id = "chkAll"><i class='far fa-check-square' style='font-size:20px'></i></button>
				                                    </div>
				                                    </th>
				                                    <th>Product</th>
				                                    <th>Quantity</th>
				                                    <th>Total</th>
				                                    <th></th>
				                                </tr>
                            				</thead>
                        					<tbody>
                        					<c:forEach var = "customer" items = "${customerList}">
                        						<c:choose>
                       	 							<c:when test = "${customer.cartQuantity == 0}"> <!-- 재고부족일 때 -->
                        		 						<tr>
						                                	<td>
						                                		<input type="checkbox" name="checkedGoodsCode" class = "checkGoodsCode" value="${customer.goodsCode}" onClick = "return false;">
						                                		<input type="hidden" name="goodsCode" value="${customer.goodsCode}">
						                                	</td>
                                   		 					<td class="product__cart__item">
						                                        <div class="product__cart__item__pic">
						                                            <img src = "${pageContext.request.contextPath}/upload/${customer.filename}" width = "70" height = "70">
						                                        </div>
                                        						<div class="product__cart__item__text">
						                                            <h6><input type="hidden" name="goodsName" value="${customer.goodsName}">${customer.goodsName}</h6>
						                                            <h5>&#8361;${customer.goodsPrice}</h5>
                                        						</div>
                                    						</td>
                                   							<td class="quantity__item">
						                                        <div class="quantity">
						                                            <div class="pro-qty">
						                                                <input type="hidden" name="cartQuantity" value="${customer.cartQuantity}">${customer.cartQuantity}개
						                                            </div>
						                                        </div>
                                    						</td>
                                    						<td>품절</td>
                                    						<td class="cart__close">
					                                    		<a href = "${pageContext.request.contextPath}/cart/removeCartList?goodsCode=${user.goodsCode}">
																 	<span class="icon_close"></span>
																</a>
															</td>
                                						</tr>
                                					</c:when>
                                					<c:otherwise>
                        								<tr>
						                                	<td>
						                                		<input type="checkbox" name="checkedGoodsCode" class = "checkGoodsCode" value="${customer.goodsCode}">
						                                		<input type="hidden" name="goodsCode" id = "gCode" value="${customer.goodsCode}">
						                                	</td>
                                    						<td class="product__cart__item">
						                                        <div class="product__cart__item__pic">
						                                            <img src = "${pageContext.request.contextPath}/upload/${customer.filename}" width = "70" height = "70">
						                                        </div>
						                                        <div class="product__cart__item__text">
						                                            <h6><input type="hidden" name="goodsName" value="${customer.goodsName}">${customer.goodsName}</h6>
						                                            <h5>&#8361;${customer.goodsPrice}</h5>
						                                        </div>
                                    						 </td>
															 <td class="quantity__item">
						                                        <div class="quantity">
						                                            <div class="pro-qty">
						                                                <input type="text" class = "cQuantity" name="cartQuantity" value="${customer.cartQuantity}">개
						                                            </div>
						                                        </div>
						                                        <div class = "cart__modify__btn">
						                                        	<a href = "#" class = "modifyBtn" data-goodsCode = "${customer.goodsCode}">수정</a>
						                                        </div>
						                                    </td>
						                                    <td class="cart__price" id = "cartPrice"><span>&#8361;${customer.goodsPrice * customer.cartQuantity}</span></td>
						                                    <td class="cart__close">
						                                   		<a href = "${pageContext.request.contextPath}/cart/removeCartList?goodsCode=${customer.goodsCode}">
																 	<span class="icon_close"></span>
																</a>
															</td>
						                                </tr>
                                					</c:otherwise>
                                				</c:choose>
                                			</c:forEach>
                                		</tbody>
                                		</table>
                                	</form>
                        		</c:when>
	                        </c:choose>
						</c:when>
	                    <c:when test = "${fn:length(userList) eq 0 || fn:length(customerList) eq 0}">
							<table>
							  	<tr>
	                                <th>Product</th>
	                                <th>Quantity</th>
	                                <th>Total</th>
	                                <th></th>
	                            </tr>
	                            <tr>
	                               	<td colspan = "4"><div>장바구니가 비어있습니다.</div></td>
	                             </tr>
								</table>
						</c:when>
					</c:choose>
            		</div>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="continue__btn">
                                <a href="#">Continue Shopping</a>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="continue__btn update__btn">
                                <a href="#"><i class="fa fa-spinner"></i> Update cart</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="cart__discount">
                        <h6>Discount codes</h6>
                        <form action="#">
                            <input type="text" placeholder="Coupon code">
                            <button type="submit">Apply</button>
                        </form>
                    </div>
                    <div class="cart__total">
                        <h6>Cart total</h6>
                        <ul>
                            <li>Subtotal <span id = "subTotal">원</span></li>
                            <li>Total <span id = "total">원</span></li>
                        </ul>
                        <button type = "button" id = "orderBtn" class="primary-btn">Proceed to checkout</button>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer set-bg" data-setbg="img/footer-bg.jpg">
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
                            <a href="#"><img src="img/footer-logo.png" alt=""></a>
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