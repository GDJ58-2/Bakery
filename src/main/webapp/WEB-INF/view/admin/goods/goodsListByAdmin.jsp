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
	<title>상품 관리 | 구디쥬르</title>
	
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
		$(document).ready(function() {			
			$('#sort').change(function(){
				$('#pageForm').submit();
				alert('정렬되었습니다.');
			});
		});
	</script>
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
                        <h2>상품 안내</h2>
                        <br>
                        <c:choose>
	                        <c:when test="${categoryKind == null || categoryKind eq ''}">
	                        	<h3>전체</h3>
	                        </c:when>
	                        <c:otherwise>
	                        	<h3>${categoryKind}</h3>
	                        </c:otherwise>
                        </c:choose>
                        <br>
						<div style="color:red;" id="msg">
						${msg}
						</div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__links">
                        <a href="./index.html">Home</a>
                        <span>Shop</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
	
    <!-- Shop Section Begin -->
    <section class="shop spad">
        <div class="container">
            <div class="shop__option">
                <div class="row">
                    <div class="col-lg-7 col-md-7">
                    	<c:choose>
							<c:when test="${categoryKind == null || categoryKind eq ''}">
								<a href="${pageContext.request.contextPath}/admin/goods/goodsListByAdmin?categoryKind=">전체</a>
								<c:forEach var="gc" items="${gcList}">
									<a href="${pageContext.request.contextPath}/admin/goods/goodsListByAdmin?categoryNo=${gc.categoryNo}&categoryKind=${gc.categoryKind}">${gc.categoryName}</a>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath}/admin/goods/goodsListByAdmin?categoryKind=">전체</a>
								<c:forEach var="gc" items="${gcList}">
									<c:if  test="${categoryKind eq gc.categoryKind}">
										<a href="${pageContext.request.contextPath}/admin/goods/goodsListByAdmin?categoryNo=${gc.categoryNo}&categoryKind=${gc.categoryKind}">${gc.categoryName}</a>
									</c:if>
								</c:forEach>
							</c:otherwise>
						</c:choose>               
                        <div class="shop__option__search">
                            <form action="${pageContext.request.contextPath}/admin/goods/goodsListByAdmin">
                                <select name="categoryNo">
	                                <c:choose>
										<c:when test="${categoryKind == null || categoryKind eq ''}">
											<option value="0">전체</option>
											<c:forEach var="gc" items="${gcList}">
												 <option value="${gc.categoryNo}">${gc.categoryName}</option>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<option value="0">전체</option>
											<c:forEach var="gc" items="${gcList}">
												<c:if  test="${categoryKind eq gc.categoryKind}">
													 <option value="${gc.categoryNo}">${gc.categoryName}</option>
												</c:if>
											</c:forEach>
										</c:otherwise>
									</c:choose>
                                </select>
                                <input type="text" name="search" placeholder="상품 이름 검색">
                                <button type="submit"><i class="fa fa-search"></i></button>
                            </form>
                        </div>
                    </div>
                     <div class="col-lg-5 col-md-5">
                        <div class="shop__option__right">
                        	<form id="pageForm" method="get" action="${pageContext.request.contextPath}/admin/goods/goodsListByAdmin">
                            <select name="sort" id="sort">
                            	<c:if test="${sort eq '신제품순'}">
									<option value="신제품순" selected="selected">신제품 순</option>
                                	<option value="인기상품순">인기 상품 순</option>
                                	<option value="리뷰순">리뷰 순</option>
								</c:if>
								<c:if test="${sort eq '인기상품순'}">
									<option value="신제품순">신제품 순</option>
                                	<option value="인기상품순" selected="selected">인기 상품 순</option>
                                	<option value="리뷰순">리뷰 순</option>
								</c:if>
								<c:if test="${sort eq '리뷰순'}">
									<option value="신제품순">신제품 순</option>
                                	<option value="인기상품순">인기 상품 순</option>
                                	<option value="리뷰순" selected="selected">리뷰 순</option>
                            	</c:if>   
                            	<c:if test="${empty sort}">
									<option value="신제품순">신제품 순</option>
                                	<option value="인기상품순">인기 상품 순</option>
                                	<option value="리뷰순">리뷰 순</option>
                            	</c:if>                             
                            </select>
                            <a href="#"><i class="fa fa-list"></i></a>
                            <a href="#"><i class="fa fa-reorder"></i></a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
           		<c:forEach var="m" items="${list}" varStatus="s">
	                <div class="col-lg-3 col-md-6 col-sm-6">
	                    <div class="product__item">
	                    	<a href="${pageContext.request.contextPath}/admin/goods/goodsOneByAdmin?goodsCode=${m.goodsCode}&categoryName=${m.categoryName}">
		                        <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/upload/${m.originName}">
		                            <div class="product__label">
		                                <span>${m.categoryName}</span>
		                            </div>
		                        </div>
	                        </a>
	                        <div class="product__item__text">
	                            <h6>
	                            	<a href="${pageContext.request.contextPath}/admin/goods/goodsOneByAdmin?goodsCode=${m.goodsCode}&categoryName=${m.categoryName}">
										${m.goodsName}
									</a>
								</h6>
	                            <div class="product__item__price">재고 : ${m.goodsStock}개</div>
	                            <div class="cart_add">
	                            	<a href="${pageContext.request.contextPath}/admin/goods/modifyGoods?goodsCode=${m.goodsCode}">수정</a>
									<a href="${pageContext.request.contextPath}/admin/goods/removeGoods?goodsCode=${m.goodsCode}">삭제</a>
	                            </div>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>              
            </div>
            <div class="shop__last__option">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                    	<!-- 페이징 -->
                        <div class="shop__pagination">
                           <a type="button" href="${pageContext.request.contextPath}/admin/goods/goodsListByAdmin?currentPage=1"><span class="arrow_carrot-left"></span></a>
								<c:if test="${currentPage > 1}">
									<a type="button" href="${pageContext.request.contextPath}/admin/goods/goodsListByAdmin?currentPage=${currentPage-1}">이전</a>
								</c:if>
								<a type="button" href="${pageContext.request.contextPath}/admin/goods/goodsListByAdmin?currentPage=${currentPage}">${currentPage}</a>
								<c:if test="${currentPage < lastPage}">
									<a type="button" href="${pageContext.request.contextPath}/admin/goods/goodsListByAdmin?currentPage=${currentPage+1}">다음</a>
								</c:if>
							<a type="button" href="${pageContext.request.contextPath}/admin/goods/goodsListByAdmin?currentPage=${lastPage}"><span class="arrow_carrot-right"></span></a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="shop__last__text">
                            <p>Showing 1-9 of 10 results</p>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
						<a href="${pageContext.request.contextPath}/admin/goods/addGoods" class="primary-btn">
							상품 추가
						</a>
					</div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Section End -->

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