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
	<title>questionList.jsp</title>
	
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
	<jsp:include page="../inc/customer.jsp"></jsp:include>
	<jsp:include page="../inc/menu.jsp"></jsp:include>
	
    <!-- Header Section Begin -->
   	<c:import url="../inc/header.jsp"></c:import>
	<!-- Header Section End -->

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__text">
                        <h2>나의 문의 내역</h2>
                        <br>
						<div style="color:red;" id="msg">
						${msg}
						</div>						
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__links">
                        <a href="./index.html">Home</a>
                        <span>나의 문의 내역</span>
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
                        <a class="primary-btn" href="${pageContext.request.contextPath}/question/addQuestion">추가</a> <!-- 문의하기 -> 주문번호 선택-> 내 문의 내역 마이페이지-->
						<br><br>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>문의번호</th>
									<th>문의종류</th>
									<th>문의내용</th>
									<th>등록일</th>
									<th>답변</th>
									<th>&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="q" items="${list}">
									<tr>
										<td>${q.questionCode}</td>
										<td>${q.category}</td>
										<td>
											<a class="btn dark-btn" href="${pageContext.request.contextPath}/question/questionOne?questionCode=${q.questionCode}">
												${q.questionMemo} <!-- ... -->
											</a>
										</td> 
										<td>${q.createdate}</td>
										<c:if test="${q.commentCode eq null||q.commentCode == 0}">
											<td>답변 대기</td>
											<td>
												<a class="btn dark-btn" href="${pageContext.request.contextPath}/question/modifyQuestion?questionCode=${q.questionCode}">수정</a>
												<a class="btn dark-btn" href="${pageContext.request.contextPath}/question/removeQuestion?questionCode=${q.questionCode}">삭제</a>
											</td>
										</c:if>
										<c:if test="${q.commentCode ne null&&q.commentCode != 0}">
											<td>답변 완료</td>
											<th>&nbsp;</th>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
                    </div>             
                </div>          
            </div>   
            <div class="shop__last__option">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                    	<!-- 페이징 -->
                        <div class="shop__pagination">
                        	<a type="button" href="${pageContext.request.contextPath}/question/questionList?currentPage=1"><span class="arrow_carrot-left"></span></a>
								<c:if test="${currentPage > 1}">
									<a type="button" href="${pageContext.request.contextPath}/question/questionList?currentPage=${currentPage-1}">이전</a>
								</c:if>
								<a type="button" href="${pageContext.request.contextPath}/question/questionList?currentPage=${currentPage}">${currentPage}</a>
								<c:if test="${currentPage < lastPage}">
									<a type="button" href="${pageContext.request.contextPath}/question/questionList?currentPage=${currentPage+1}">다음</a>
								</c:if>
							<a type="button" href="${pageContext.request.contextPath}/question/questionList?currentPage=${lastPage}"><span class="arrow_carrot-right"></span></a>                       
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="shop__last__text">
                            <p>Showing 1-9 of 10 results</p>
                        </div>
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