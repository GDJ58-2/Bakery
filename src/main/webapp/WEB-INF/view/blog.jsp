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
    <title>blog.jsp</title>

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
            <a href="${pageContext.request.contextPath}/resources/static/index"><img src="${pageContext.request.contextPath}/resources/static/img/logo.png" alt=""></a>
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
                                <a href="${pageContext.request.contextPath}/resources/static/index"><img src="${pageContext.request.contextPath}/resources/static/img/logo.png" alt=""></a>
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
                            <li><a href="./shop.html">Shop</a></li>
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
                            <li class="active"><a href="./blog.html">Blog</a></li>
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
                        <h2>Blog</h2>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__links">
                        <a href="./index.html">Home</a>
                        <span>Blog</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Blog Section Begin -->
    <section class="blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/resources/static/img/blog/blog-1.jpg">
                            <div class="blog__pic__inner">
                                <div class="label">Recipes</div>
                                <ul>
                                    <li>By <span>James Myers</span></li>
                                    <li>13 Nov 2020</li>
                                    <li>112 Views</li>
                                </ul>
                            </div>
                        </div>
                        <div class="blog__item__text">
                            <h2>Delivering Kisses And Miracles</h2>
                            <p>Herbs are fun and easy to grow. When harvested they make even the simplest meal seem like
                                a gourmet delight. By using herbs in your cooking you can easily change the flavors of
                            your recipes in many different ways, according to which herbs you add...</p>
                            <a href="#">READ MORE</a>
                        </div>
                    </div>
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/resources/static/img/blog/blog-2.jpg">
                            <div class="blog__pic__inner">
                                <div class="label">Recipes</div>
                                <ul>
                                    <li>By <span>James Myers</span></li>
                                    <li>13 Nov 2020</li>
                                    <li>112 Views</li>
                                </ul>
                            </div>
                        </div>
                        <div class="blog__item__text">
                            <h2>Make Grilling A Healthy Experience</h2>
                            <p>Herbs are fun and easy to grow. When harvested they make even the simplest meal seem like
                                a gourmet delight. By using herbs in your cooking you can easily change the flavors of
                            your recipes in many different ways, according to which herbs you add...</p>
                            <a href="#">READ MORE</a>
                        </div>
                    </div>
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/resources/static/img/blog/blog-3.jpg">
                            <div class="blog__pic__inner">
                                <div class="label">Recipes</div>
                                <ul>
                                    <li>By <span>James Myers</span></li>
                                    <li>13 Nov 2020</li>
                                    <li>112 Views</li>
                                </ul>
                            </div>
                        </div>
                        <div class="blog__item__text">
                            <h2>Bbq Myths Getting You Down</h2>
                            <p>Herbs are fun and easy to grow. When harvested they make even the simplest meal seem like
                                a gourmet delight. By using herbs in your cooking you can easily change the flavors of
                            your recipes in many different ways, according to which herbs you add...</p>
                            <a href="#">READ MORE</a>
                        </div>
                    </div>
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/resources/static/img/blog/blog-4.jpg">
                            <div class="blog__pic__inner">
                                <div class="label">Recipes</div>
                                <ul>
                                    <li>By <span>James Myers</span></li>
                                    <li>13 Nov 2020</li>
                                    <li>112 Views</li>
                                </ul>
                            </div>
                        </div>
                        <div class="blog__item__text">
                            <h2>Keep That Cooking Area Clean</h2>
                            <p>Herbs are fun and easy to grow. When harvested they make even the simplest meal seem like
                                a gourmet delight. By using herbs in your cooking you can easily change the flavors of
                            your recipes in many different ways, according to which herbs you add...</p>
                            <a href="#">READ MORE</a>
                        </div>
                    </div>
                    <div class="shop__pagination">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#"><span class="arrow_carrot-right"></span></a>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__search">
                            <form action="#">
                                <input type="text" placeholder="Enter keyword">
                                <button type="submit"><i class="fa fa-search"></i></button>
                            </form>
                        </div>
                        <div class="blog__sidebar__item">
                            <h5>Follow me</h5>
                            <div class="blog__sidebar__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-youtube-play"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                            </div>
                        </div>
                        <div class="blog__sidebar__item">
                            <h5>Popular posts</h5>

                            <div class="blog__sidebar__recent">
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="${pageContext.request.contextPath}/resources/static/img/blog/br-1.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h4>Secret To Cooking Vegetables</h4>
                                        <span>13 Nov 2020</span>
                                    </div>
                                </a>
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="${pageContext.request.contextPath}/resources/static/img/blog/br-2.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h4>Bbq Myths Getting You Down</h4>
                                        <span>13 Nov 2020</span>
                                    </div>
                                </a>
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="${pageContext.request.contextPath}/resources/static/img/blog/br-3.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h4>Save Money The Crock Pot Way</h4>
                                        <span>13 Nov 2020</span>
                                    </div>
                                </a>
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="${pageContext.request.contextPath}/resources/static/img/blog/br-4.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h4>Grilling Tips For The Dog Days Of Summer</h4>
                                        <span>13 Nov 2020</span>
                                    </div>
                                </a>
                                <a href="#" class="blog__sidebar__recent__item">
                                    <div class="blog__sidebar__recent__item__pic">
                                        <img src="${pageContext.request.contextPath}/resources/static/img/blog/br-5.jpg" alt="">
                                    </div>
                                    <div class="blog__sidebar__recent__item__text">
                                        <h4>Barbeque Techniques Two Methods To Consider</h4>
                                        <span>13 Nov 2020</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                        <div class="blog__sidebar__item">
                            <h5>Categories</h5>
                            <div class="blog__sidebar__item__categories">
                                <ul>
                                    <li><a href="#">Repice <span>36</span></a></li>
                                    <li><a href="#">Guides <span>18</span></a></li>
                                    <li><a href="#">News <span>09</span></a></li>
                                    <li><a href="#">Videos <span>12</span></a></li>
                                    <li><a href="#">Trending <span>27</span></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="blog__sidebar__item">
                            <h5>NEWsLETTeR</h5>
                            <p>Subscribe to our newsletter and get our newest updates right on your inbox.</p>
                            <form action="#">
                                <input type="text" placeholder="Your email">
                                <label for="agg">
                                    I agree to the terms & conditions
                                    <input type="checkbox" id="agg">
                                    <span class="checkmark"></span>
                                </label>
                                <button type="submit" class="site-btn">Subscribe</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->

	<!-- Footer Section Begin -->
    <c:import url="inc/footer.jsp"></c:import>
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