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
    <title>contact.jsp</title>

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
    <!-- Header Section Begin -->
   	<c:import url="inc/header.jsp"></c:import>
	<!-- Header Section End -->

    <!-- Contact Section Begin -->
    <section class="contact spad">
        <div class="container">
            <div class="map">
                <div class="container">
                    <div class="row d-flex justify-content-center">
                        <div class="col-lg-4 col-md-7">
                            <div class="map__inner">
                                <h6>COlorado</h6>
                                <ul>
                                    <li>1000 Lakepoint Dr, Frisco, CO 80443, USA</li>
                                    <li>Sweetcake@support.com</li>
                                    <li>+1 800-786-1000</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="map__iframe">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d10784.188505644011!2d19.053119335158936!3d47.48899529453826!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sbd!4v1543907528304" height="300" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                </div>
            </div>
            <div class="contact__address">
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="contact__address__item">
                            <h6>san bernardino</h6>
                            <ul>
                                <li>
                                    <span class="icon_pin_alt"></span>
                                    <p>795 W 5th St, San Bernardino, CA 92410, USA</p>
                                </li>
                                <li><span class="icon_headphones"></span>
                                    <p>+1 800-786-1000</p>
                                </li>
                                <li><span class="icon_mail_alt"></span>
                                    <p>Sweetcake@support.com</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="contact__address__item">
                            <h6>Los angeles</h6>
                            <ul>
                                <li>
                                    <span class="icon_pin_alt"></span>
                                    <p>639 S Spring St, Los Angeles, CA 90014, USA</p>
                                </li>
                                <li><span class="icon_headphones"></span>
                                    <p>+1 213-612-3000</p>
                                </li>
                                <li><span class="icon_mail_alt"></span>
                                    <p>Sweetcake@support.com</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="contact__address__item">
                            <h6>san bernardino</h6>
                            <ul>
                                <li>
                                    <span class="icon_pin_alt"></span>
                                    <p>1000 Lakepoint Dr, Frisco, CO 80443, USA</p>
                                </li>
                                <li><span class="icon_headphones"></span>
                                    <p>+1 800-786-1000</p>
                                </li>
                                <li><span class="icon_mail_alt"></span>
                                    <p>Sweetcake@support.com</p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <div class="contact__text">
                        <h3>Contact With us</h3>
                        <ul>
                            <li>Representatives or Advisors are available:</li>
                            <li>Mon-Fri: 5:00am to 9:00pm</li>
                            <li>Sat-Sun: 6:00am to 9:00pm</li>
                        </ul>
                        <img src="${pageContext.request.contextPath}/resources/static/img/cake-piece.png" alt="">
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="contact__form">
                        <form action="#">
                            <div class="row">
                                <div class="col-lg-6">
                                    <input type="text" placeholder="Name">
                                </div>
                                <div class="col-lg-6">
                                    <input type="text" placeholder="Email">
                                </div>
                                <div class="col-lg-12">
                                    <textarea placeholder="Message"></textarea>
                                    <button type="submit" class="site-btn">Send Us</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Section End -->

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