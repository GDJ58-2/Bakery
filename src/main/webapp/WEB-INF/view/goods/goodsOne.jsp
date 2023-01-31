<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="Cake Template">
    <meta name="keywords" content="Cake, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>goodsOne.jsp</title>
	
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
	<script>
      function logoutAction() {
         let url = '${pageContext.request.contextPath}/customer/logout';
            let out = confirm('로그아웃하시겠습니까?'); 
             if(out) {
              location.replace(url); 
               alert('로그아웃되었습니다');
             } else {
                alert('로그아웃 취소');
                return false;
             }
       }  
   
      $(document).ready(function() {
         $('#cartBtn').click(function() {
            if($('#cartQuantity').val() == 0 || $('#cartQuantity').val() == '') {
               alert('상품의 개수를 선택하세요.');
               $('#cartQuantity').val(1);
               $('#cartQuantity').focus();
            } else if($('#cartQuantity').val() > 100){
               alert('상품 구매는 최대 100개까지만 가능합니다.');
               $('#cartQuantity').val(1);
               $('#cartQuantity').focus();
            } else {
               $('#addCartForm').submit();
               alert('장바구니에 상품을 담았습니다.');
            }
         });
         
         $('#logoutBtn').on('click', function() {
               logoutAction(url);
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
                <a href="${pageContext.request.contextPath}/cart/cartList"><img src="${pageContext.request.contextPath}/resources/static/img/icon/cart.png" alt=""> <span>0</span></a>
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
                <c:choose>
                     <c:when test="${loginCustomer eq null}">
                        <li><a href="${pageContext.request.contextPath}/customer/login">login</a><span class="arrow_carrot-down"></span>
                       <ul>
                           <li style = "display:inline-block"><a href = "${pageContext.request.contextPath}/customer/addCustomer"><font size = "2" color = "white">Sign&nbsp;Up</font></a></li>
                       </ul>
                   </li>
                     </c:when>
                     <c:otherwise>
                           <li><a href="${pageContext.request.contextPath}/customer/home">${loginCustomer.customerName} 님</a><span class="arrow_carrot-down"></span>
                       <ul>
                           <li style = "display:inline-block">
                 	           <a href = "javascript:logoutAction()" id = "logoutBtn"><font size = "2" color = "white">logout</font></a>
                 	       </li>
                       </ul>
                   </li>
                     </c:otherwise>
            	</c:choose>
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
                 					<c:choose>
                     					<c:when test="${loginCustomer eq null}">
                        					<li><a href="${pageContext.request.contextPath}/customer/login">login</a><span class="arrow_carrot-down"></span>
                       							<ul>
                           							<li style = "display:inline-block"><a href = "${pageContext.request.contextPath}/customer/addCustomer"><font size = "2" color = "white">Sign&nbsp;Up</font></a></li>
                       							</ul>
                   							</li>
                     					</c:when>
                     					<c:otherwise>
                            				<li><a href="${pageContext.request.contextPath}/customer/home">${loginCustomer.customerName} 님</a><span class="arrow_carrot-down"></span>
                       							<ul>
                       								<li style = "display:inline-block">
                       									<a href = "javascript:logoutAction()" id = "logoutBtn"><font size = "2" color = "white">logout</font></a>
                       								</li>
                       							</ul>
                   							</li>
                     					</c:otherwise>
            						</c:choose>
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
                        <h2>상품 상세정보</h2>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__links">
                        <a href="./index.html">Home</a>
                        <a href="./shop.html">Shop</a>
                        <span>${map.goodsName}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Shop Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
            
                <div class="col-lg-6">
                    <div class="product__details__img">
                        <div class="product__details__big__img">
                            <img class="big_img" src="${pageContext.request.contextPath}/upload/${map.originName}" alt="">
                        </div>                        
                    </div>
                </div>
				
 				<div class="col-lg-6">
	            	<form action="${pageContext.request.contextPath}/cart/addCart" method="get" id = "addCartForm">
			       		<input type="hidden" name="goodsCode" value="${map.goodsCode}">  
			            <input type="hidden" name="goodsName" value="${map.goodsName}">    
			            <input type="hidden" name="categoryName" value="${map.categoryName}">    
			            <div class="product__details__text">
			            	<div class="product__label">${map.categoryKind}</div>
		                	<h4>${map.goodsName}</h4>   
		                    <br>              
		                    <div style="color:red;" id="msg">
		                    	${msg}
		                    </div>
		                    <h5>${map.goodsPrice}원</h5>
		                    <p>${map.goodsContent}</p>
                            <ul>
                                <li>상품 재고 : <span>${map.goodsStock}개</span></li>
                                <li>상품 종류 : <span>${map.categoryName}</span></li>
                                <li>태그 : <span>${map.categoryKind}, ${map.categoryName}</span></li>
                            </ul>
                            <div class="product__details__option">
                            	<div class="quantity">
                                	<div class="pro-qty">
                                    	<input type="text" name="cartQuantity" id="cartQuantity" value="1" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> <!-- 숫자만 입력 가능하게 -->
                                    </div>
                            	</div>
                            	<a href="" type="button" id="cartBtn">
                                	<button class = "add__btn btn primary-btn" id="cartBtn">장바구니 추가</button>
                                </a>
                                <a href="#" class="heart__btn"><span class="icon_heart_alt"></span></a>
                           	</div>
			        	</div>
	            	</form>
	        	</div>   
            </div>
            <div class="product__details__tab">
                <div class="col-lg-12">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">상세 설명</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">추가 정보</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">리뷰</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <div class="row d-flex justify-content-center">
                                <div class="col-lg-8">
                                	<br>
                                	<div style="font-size: 20px; font-weight: bold;">빵의 효능</div>
                                    <p>
                                    글루텐 성분이 없어서 소화가 잘됩니다.<br>먹고 난 다음에 속이 편합니다.<br>각종 식이섬유가 많고 무기질과 미네랄이 풍부합니다.<br>
                                    GI(당지수)가 낮아서 당뇨와 다이어트에 매우 좋습니다.<br>섬유소가 풍부해서 대장 활동을 활발히 해 대장암 예방 효과가 탁월합니다.<br>
                                    항암 효과가 탁월하고 암세포의 증식을 방해한다고 합니다.<br>황산화 성분이 풍부한 빵은 심장기능을 향상시킬 수 있습니다.<br>
                                    식이섬유가 많아서 변비에 좋고, 탄수화물 ,단백질, 칼슘, 비타민B가 풍부합니다.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-2" role="tabpanel">
                            <div class="row d-flex justify-content-center">
                                <div class="col-lg-8">
                                    <p>
                                    <img class="big_img" src="${pageContext.request.contextPath}/upload/빵 보관법1.jpg"><br><br>
                                    빵을 어떻게<br>보관해야 할지<br>잘 모르실때가 있으시죠?<br>
                                   	이번 시간에는<br>빵 보관하는 방법에<br>대해서 알아보겠습니다.<br><br>
                                   	<img class="big_img" src="${pageContext.request.contextPath}/upload/빵 보관법2.jpg"><br><br>
                                   	먼저 빵을 보관하는데에 있어서<br>가장 핵심을 공기의 접촉을<br>막는 것입니다!<br>
                                   	빵이 공기와 닿으면<br>빨리 딱딱하게 변하고<br>상하기도 쉽다고 합니다.<br><br>
                                   	<img class="big_img" src="${pageContext.request.contextPath}/upload/빵 보관법3.jpg"><br><br>
                                   	따라서 공기와 닿지 않게<br>비닐봉투 등 적당한<br>봉투 안에 빵을 넣고<br>약간의 틈을 남겨두고<br>손으로 봉투 입구를 막은 다음<br>
                                   	빨대를 이용하여<br>봉투 안의 공기를<br>흡입해주세요.<br>그렇게 공기를 빼주시고<br>봉투 입구를 잘 막아주세요.<br><br>
                                   	<img class="big_img" src="${pageContext.request.contextPath}/upload/빵 보관법4.jpg"><br><br>
                                   	그리고 만약 <br>빨리 먹을 빵이라면 <br>실온 보관을 하고 <br><br>그게 아니라면 <br>냉장실이 아닌 <br>냉동실에 넣어주는 것이 <br>좋다고 합니다.<br><br>
                                   	냉장실에 보관을 할 경우 <br>수분이 빠르게 날아가서 <br>원래의 맛있는 맛을 <br>잃게 된다고 합니다.<br><br>
                                   	<img class="big_img" src="${pageContext.request.contextPath}/upload/빵 보관법5.jpg"><br><br>
                                   	여기서 또 주의할 점은 <br>빨리 먹을 빵일지라 하더라도 <br>빵 나에 크림이나 팥, <br>혹은 햄, 마요네즈와 같이 <br>오래 두면 상할 수 있는 <br>
                                   	음식이 들어있는 경우 <br>실온이 아닌 <br>냉장고(냉동실)에 넣어 <br>보관해주셔야 합니다.<br><br>
                                   	<img class="big_img" src="${pageContext.request.contextPath}/upload/빵 보관법6.jpg"><br><br>
                                   	이렇게 빵 보관하는 <br>방법에 대하여 <br>알아보았는데요 <br>흔히 먹는 빵이지라도 <br>우리가 모르는 <br>현명한 보관 방법이 <br>있다는 사실! <br>꼭 기억해 두세요.<br>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-3" role="tabpanel">
                            <div class="row d-flex justify-content-center">
                                <div class="col-lg-8">
                                	<br>
                                    <!-- 리뷰목록 -->
									<div>리뷰</div>
									<div>
									<table class="table table-bordered">
										<c:forEach var = "m" items = "${list}" varStatus = "i">
											<tr>
												<td>${m.reviewMemo}</td>
												<td>${m.customerId}</td>
												<td>
													<c:set var = "date" value = "${m.createdate}" />${fn:substring(date,0,10)}
												</td>
											</tr>
										</c:forEach>
									</table>
									</div>
									<!-- 리뷰페이징 -->
									<div>
										<c:if test = "${currentPage > 1}">
											<a type="button" href = "${pageContext.request.contextPath}/goods/goodsOne?goodsCode=${map.goodsCode}&currentPage=${currentPage - 1}"><span class="arrow_carrot-left"></span></a>
										</c:if>
										<c:choose>
											<c:when test = "${!empty list}">
												<a type="button" href = "${pageContext.request.contextPath}/goods/goodsOne?goodsCode=${map.goodsCode}&currentPage=${currentPage}">${currentPage}</a>
											</c:when>
											<c:otherwise>
												<span>아직 작성된 리뷰가 없습니다.</span>
											</c:otherwise>
										</c:choose>
										<c:if test = "${currentPage < endPage}">
											<a type="button" href = "${pageContext.request.contextPath}/goods/goodsOne?goodsCode=${map.goodsCode}&currentPage=${currentPage + 1}"><span class="arrow_carrot-right"></span></a>
										</c:if>
									</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Details Section End -->

    <!-- Related Products Section Begin -->
    <section class="related-products spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="section-title">
                        <h2>연관 상품</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="related__products__slider owl-carousel">
                	<c:forEach var="m" items="${gList}">
	                    <div class="col-lg-3">
	                        <div class="product__item">
	                            <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/upload/${m.originName}">
	                                <div class="product__label">
	                                    <span>${m.categoryName}</span>
	                                </div>
	                            </div>
	                            <div class="product__item__text">
	                                <h6><a href="#">${m.goodsName}</a></h6>
	                                <div class="product__item__price">${m.goodsPrice}원</div>
	                                <div class="cart_add">
	                                    <a href="#">장바구니 추가</a>
	                                </div>
	                            </div>
	                        </div>
	                    </div>     
                    </c:forEach>                                                                                         
                </div>
            </div>
        </div>
    </section>
    <!-- Related Products Section End -->

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