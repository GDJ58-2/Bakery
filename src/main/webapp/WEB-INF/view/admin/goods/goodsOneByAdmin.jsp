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
	<title>상품 관리 상세정보 | 구디쥬르</title>
	
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
   	<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
	<!-- Header Section End -->

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__text">
                        <h2>상품 상세정보</h2>
                        <br>
						<div style="color:red;" id="msg">
						${msg}
						</div>
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
                    <div class="product__details__text">
                        <div class="product__label">${map.categoryKind}</div>
                        <h4>${map.goodsName}</h4>     
                        <br>            
						<div style="color:red;">
						${msg}
						</div>
                        <h5>${map.goodsPrice}원</h5>
                        <p>${map.goodsContent}</p>
                        <ul>                  
                            <li>상품 종류 : <span>${map.categoryName}</span></li>
                            <li>상품 재고 : <span>${map.goodsStock}개</span></li>
                            <li>작성 직원 : <span>${map.empId}</span></li>
                            <li>상품 순위 : <span>${map.hit}위</span></li>
                            <li>출시 일자 : <span>${map.createdate}</span></li>
                            <li>태그 : <span>${map.categoryKind}, ${map.categoryName}</span></li>
                        </ul>
                        <div class="product__details__option">                         
                            <a href="${pageContext.request.contextPath}/admin/goods/modifyGoods?goodsCode=${map.goodsCode}" class="primary-btn">수정</a>
                            <a href="${pageContext.request.contextPath}/admin/goods/removeGoods?goodsCode=${map.goodsCode}" class="primary-btn">삭제</a>
                        </div>
                    </div>
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