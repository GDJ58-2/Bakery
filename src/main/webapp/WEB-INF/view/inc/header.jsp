<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                <a href="${pageContext.request.contextPath}/cart/cartList"><img src="${pageContext.request.contextPath}/resources/static/img/icon/cart.png" alt=""></a>
                <a href="${pageContext.request.contextPath}/cart/cartList"><div class="cart__price">Cart</div></a>
            </div>
        </div>
        <div class="offcanvas__logo">
            <a href="${pageContext.request.contextPath}/index"><img src="${pageContext.request.contextPath}/resources/static/img/logo.png" alt=""></a>
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
                  <c:if test="${loginCustomer eq null && loginEmp eq null}">
                     <li><a href="${pageContext.request.contextPath}/customer/login">login</a><span class="arrow_carrot-down"></span>
                    <ul>
                        <li style = "display:inline-block"><a href = "${pageContext.request.contextPath}/customer/addCustomer"><font size = "2" color = "white">Sign&nbsp;Up</font></a></li>
                    </ul>
                </li>
                  </c:if>
                  <c:if test="${loginCustomer ne null && loginEmp eq null}">
                    <li><a href="${pageContext.request.contextPath}/customer/myHome">${loginCustomer.customerName} 님</a><span class="arrow_carrot-down"></span>
                     <ul>
                     	<li>
               	           <a href="${pageContext.request.contextPath}/customer/myHome"><font size = "2" color = "white">My&nbsp;Page</font></a>
               	       </li>
                         <li style = "display:inline-block">
               	           <a href = "javascript:logoutAction(customerUrl)" id = "logoutBtn"><font size = "2" color = "white">logout</font></a>
               	       </li>
                     </ul>
               	   </li>
                  </c:if>
                  <c:if test="${loginCustomer eq null && loginEmp ne null}">
                  	<li><a href="${pageContext.request.contextPath}/admin/emp/home">${loginEmp.empName} 님</a><span class="arrow_carrot-down"></span>
                     <ul>
                     	<li>
               	           <a href="${pageContext.request.contextPath}/admin/emp/home"><font size = "2" color = "white">My&nbsp;Page</font></a>
               	       	</li>
                         <li style = "display:inline-block">
               	           <a href = "javascript:logoutAction(empUrl)" id = "logoutEmpBtn"><font size = "2" color = "white">logout</font></a>
               	       </li>
               	        
                     </ul>
               	   </li>
                  </c:if>
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
                 					<c:if test="${loginCustomer eq null && loginEmp eq null}">
					                     <li><a href="${pageContext.request.contextPath}/customer/login">login</a><span class="arrow_carrot-down"></span>
					                    <ul>
					                        <li style = "display:inline-block"><a href = "${pageContext.request.contextPath}/customer/addCustomer"><font size = "2" color = "white">Sign&nbsp;Up</font></a></li>
					                    </ul>
					                </li>
					                  </c:if>
					                  <c:if test="${loginCustomer ne null && loginEmp eq null}">
					                    <li><a href="${pageContext.request.contextPath}/customer/myHome">${loginCustomer.customerName} 님</a><span class="arrow_carrot-down"></span>
					                     <ul>
					                     	<li>
					               	           <a href="${pageContext.request.contextPath}/customer/myHome"><font size = "2" color = "white">My&nbsp;Page</font></a>
					               	       </li>
					                         <li style = "display:inline-block">
					               	           <a href = "javascript:logoutAction(customerUrl)" id = "logoutBtn"><font size = "2" color = "white">logout</font></a>
					               	       </li>
					               	        
					                     </ul>
					               	   </li>
					                  </c:if>
					                  <c:if test="${loginCustomer eq null && loginEmp ne null}">
					                  	<li><a href="${pageContext.request.contextPath}/admin/emp/home">${loginEmp.empName} 님</a><span class="arrow_carrot-down"></span>
					                     <ul>
					                      <li>
					               	           <a href="${pageContext.request.contextPath}/admin/emp/home"><font size = "2" color = "white">My&nbsp;Page</font></a>
					               	       </li>
					                         <li style = "display:inline-block">
					               	           <a href = "javascript:logoutAction(empUrl)" id = "logoutEmpBtn"><font size = "2" color = "white">logout</font></a>
					               	       </li>
					               	       
					                     </ul>
					               	   </li>
					                  </c:if>
                                </ul>
                            </div>
                            <div class="header__logo">
                                <a href="${pageContext.request.contextPath}/index"><img src="${pageContext.request.contextPath}/resources/static/img/logo.png" alt=""></a>
                            </div>
                            <div class="header__top__right">
                                <div class="header__top__right__links">
                                    <a href="#" class="search-switch"><img src="${pageContext.request.contextPath}/resources/static/img/icon/search.png" alt=""></a>
                                    <a href="#"><img src="${pageContext.request.contextPath}/resources/static/img/icon/heart.png" alt=""></a>
                                </div>
                                <div class="header__top__right__cart">
                                    <a href="${pageContext.request.contextPath}/cart/cartList"><img src="${pageContext.request.contextPath}/resources/static/img/icon/cart.png" alt=""></a>
                                    <a href="${pageContext.request.contextPath}/cart/cartList"><div class="cart__price">Cart</div></a>
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
                            <li><a href="${pageContext.request.contextPath}/index">홈</a></li>
                            <li><a href="${pageContext.request.contextPath}/notice/noticeList">공지사항</a></li>
                            <li><a href="${pageContext.request.contextPath}/about">브랜드</a>
                            	<ul class="dropdown">
                                    <li><a href="${pageContext.request.contextPath}/about">브랜드 안내</a></li>
                                    <li><a href="${pageContext.request.contextPath}/contact">오시는 길</a></li>
                                </ul>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/goods/goodsList">상품 안내</a>
                            	<ul class="dropdown">
                            		<li><a href="${pageContext.request.contextPath}/goods/goodsList?categoryKind=">전체</a></li>
                            		<li><a href="${pageContext.request.contextPath}/goods/goodsList?categoryKind=빵">빵</a></li>
                            		<li><a href="${pageContext.request.contextPath}/goods/goodsList?categoryKind=케이크">케이크</a></li>
                            		<li><a href="${pageContext.request.contextPath}/goods/goodsList?categoryKind=델리">델리</a></li>
                            		<li><a href="${pageContext.request.contextPath}/goods/goodsList?categoryKind=디저트">디저트</a></li>
                            		<li><a href="${pageContext.request.contextPath}/goods/goodsList?categoryKind=음료">음료</a></li>
                            	</ul>
                            </li>	                           
                            <li><a href="${pageContext.request.contextPath}/blog">블로그</a>
                            	<ul class="dropdown">
                                    <li><a href="${pageContext.request.contextPath}/blog">블로그</a></li>
                                    <li><a href="${pageContext.request.contextPath}/blogDetails">블로그 게시글</a></li>
                                    <li><a href="${pageContext.request.contextPath}/class">강좌</a></li>
                                </ul>
                            </li>
                            <c:if test="${loginEmp ne null}">
                            <li><a href="${pageContext.request.contextPath}/goods/goodsList">관리자</a>
                            	<ul class="dropdown">
                            		<li><a href="${pageContext.request.contextPath}/admin/emp/empList">직원관리</a></li>
                            		<li><a href="${pageContext.request.contextPath}/admin/customer/customerList">고객관리</a></li>
                            		<li><a href="${pageContext.request.contextPath}/admin/auth/authInfoList">관리자권한관리</a></li>
                            		<li><a href="${pageContext.request.contextPath}/notice/noticeList">공지관리</a></li>
                            		<li><a href="${pageContext.request.contextPath}/admin/goods/goodsList">상품관리</a></li>
                            		<li><a href="${pageContext.request.contextPath}/admin/orders/ordersList">주문관리</a></li>
                            		<li><a href="${pageContext.request.contextPath}/admin/emp/logout">로그아웃</a></li>
                            	</ul>
                            </li>
                            </c:if>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- Header Section End -->