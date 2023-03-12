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
    <title>장바구니 | 고객 | 구디쥬르</title>

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
     	let customerUrl = '${pageContext.request.contextPath}/customer/logout';
		function logoutAction(customerUrl) {
		let out = confirm('로그아웃하시겠습니까?'); 
		 	if(out) {
	   			location.replace(customerUrl); 
	       		alert('로그아웃되었습니다');
	       	} else {
	          	alert('로그아웃 취소');
	          	return false;
	       	}
		}  
		
      $(document).ready(function() {
    	// 장바구니 전체합계
          let allTotal=0;
          $('.gCode').each(function() {	
         	let allPrice=Number($(this).parent().siblings().children('div').find('h5').html().substring(1)); 
         	let allQuantity=Number($(this).parent().siblings().children('div').find('.cQuantity').val());
         	allTotal = allTotal + allPrice*allQuantity;
         	$('#total').text(allTotal);
          });
          
       // 체크박스 전체선택&전체해제
          $('#chkAll').click(function() {
        	let subTotalNum=Number($('#subTotal').text());
            let totalNum=Number($('#total').text());
       		let checkTotal = $('.checkGoodsCode').length;
       		let checked = ($('.checkGoodsCode:checked')).length;
       		if(checkTotal == checked) {
       			$('.checkGoodsCode').prop('checked', false);
       			$('#chkAll').prop('checked', false);
       			$('#subTotal').text(0);
       		} else {
       			$('.checkGoodsCode').prop('checked', true);
       			$('#chkAll').prop('checked', true);
       			$('#subTotal').text(totalNum);
       		}
       	 });
       	
       	// 주문 개별 선택시 전체선택 체크박스 체크되게 하기
       	$('.checkGoodsCode').on('click', function() {
       		let checkTotal = $('.checkGoodsCode').length;
       		let checked = ($('.checkGoodsCode:checked')).length;
       		if(checkTotal == checked) {
       			$('#chkAll').prop('checked', true);
       		} else {
       			$('#chkAll').prop('checked', false);
       		}
       	});

     	// 결제 금액 미리보기
        $('.checkGoodsCode').change(function() {
            let subTotalNum=Number($('#subTotal').text());
            let totalNum=Number($('#total').text());
            let cPrice = Number($(this).parent().siblings().children('div').find('h5').html().substring(1));
            let cQuantity=Number($(this).parent().siblings().children('div').find('.cQuantity').val());
            
            if($(this).is(':checked')) {
                subTotalNum = subTotalNum + cPrice*cQuantity;
                if(subTotalNum > totalNum) {
                    subTotalNum = totalNum;
                }
            } else if($(this).not(':checked')) {
                subTotalNum = subTotalNum - cPrice*cQuantity;;
                if(subTotalNum < 0){
                    subTotalNum = 0;
                }
            }
            $('#subTotal').text(subTotalNum);
        });
         
         // 수량변경버튼
         $('.modifyBtn').on('click', function() {
           	let cartCode = $(this).data('goodscode');
           	let cartQ = $(this).parent().siblings().find('input').val();
           	$('.updateCartQuantity').val(cartQ);
           	$('.updateGoodsCode').val(cartCode);
           	$('.modifyCartForm').submit();
           	console.log('cartCode: '+cartCode);
          	console.log('cartQ: '+cartQ);
         });
         
     	// 체크된 주문만 결제페이지로 넘어갈 수 있음
     	$('#orderBtn').click(function() {
     		let checked = ($('.checkGoodsCode:checked')).length;
     		if(!checked) {
     			console.log(checked);
     			alert('주문할 상품을 선택하세요');
     		} else {
     			$('#orderForm').submit();
     		}
     	});
         
         // 로그아웃
         $('#logoutBtn').click(function() {
	   			logoutAction(customerUrl);
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
                        <h2>Shopping cart</h2>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__links">
                        <a href="${pageContext.request.contextPath}/customer/myHome">My Page</a>
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
                                               		<input type="checkbox" id = "chkAll">
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
                                                              <img src = "${pageContext.request.contextPath}/upload/${user.originName}" width = "70" height = "70">
                                                          </div>
                                                          <div class="product__cart__item__text">
                                                              <h6><input type="hidden" name="goodsName" value="${user.goodsName}">${user.goodsName}</h6>
                                                              <h5 id= "price">&#8361;${user.goodsPrice}</h5>
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
                                                               <img src = "${pageContext.request.contextPath}/upload/${user.originName}" width = "70" height = "70">
                                                            </div>
                                                            <div class="product__cart__item__text">
                                                                <h6><input type="hidden" name="goodsName" value="${user.goodsName}">${user.goodsName}</h6>
                                                                <h5>&#8361;${user.goodsPrice}</h5>
                                                            </div>
                                                        </td>
                                                      <td class="quantity__item">
                                                          <div class="quantity">
                                                              <div class="pro-qty">
                                                                  <input type="text" class = "cQuantity" value = "${user.cartQuantity}">개
                                                              </div>
                                                          </div>
                                                          <div class = "cart__modify__btn">
                                                             <a href="javascript:void(0)" class = "modifyBtn" data-goodscode = "${user.goodsCode}">수정</a>
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
                                 <c:when test = "${customerList ne null && loginCustomer ne null}">    <!-- 회원장바구니 -->
                                    <form action="${pageContext.request.contextPath}/orders/addOrdersList" id = "orderForm" method="post">
                                       <table>
                                        <thead>
                                            <tr>
                                               <th>
                                               		<div class = "justify-content-start">
                                                		<input type="checkbox" id = "chkAll">
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
                                                              <img src = "${pageContext.request.contextPath}/upload/${customer.originName}" width = "70" height = "70">
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
                                                        <input type="hidden" class = "gCode" value="${customer.goodsCode}">
                                                     </td>
                                                      <td class="product__cart__item">
                                                          <div class="product__cart__item__pic">
                                                              <img src = "${pageContext.request.contextPath}/upload/${customer.originName}" width = "70" height = "70">
                                                          </div>
                                                          <div class="product__cart__item__text">
                                                              <h6><input type="hidden" name="goodsName" value="${customer.goodsName}">${customer.goodsName}</h6>
                                                              <h5>&#8361;${customer.goodsPrice}</h5>
                                                          </div>
                                                       </td>
                                             			 <td class="quantity__item">
                                                          <div class="quantity">
                                                              <div class="pro-qty">
                                                                  <input type="text" class = "cQuantity" value="${customer.cartQuantity}">개
                                                              </div>
                                                              <div class = "cart__modify__btn">
                                                             	<a href="javascript:void(0)" class = "modifyBtn" data-goodscode = "${customer.goodsCode}">수정</a>
                                                         	  </div>
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
                            <li>Subtotal 
                            	<span>원</span>
                            	<span id = "subTotal">0</span>
                            	<span>&#8361; </span>
                            </li>
                            <li>Total
                            	<span>원</span> 
                            	<span id = "total">0</span>
                            	<span>&#8361; </span>
                            	</li>
                        </ul>
                        <c:choose>
                        	<c:when test="${loginCustomer eq null}">
                        		<a href="${pageContext.request.contextPath}/customer/login">
                        			<button type ="button" id="customerLoginBtn" class="customerLogin-btn">login</button>
                        		</a>
                        	</c:when>
                        	<c:otherwise>
                        		<button type = "button" id = "orderBtn" class="primary-btn">Proceed to checkout</button>
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 수량수정폼 -->
        <form action="${pageContext.request.contextPath}/cart/modifyCart" method=post" class="modifyCartForm">
        	<input type="hidden" name="cartQuantity" class="updateCartQuantity">
        	<input type="hidden" name="goodsCode" class="updateGoodsCode">
        	<input type="hidden" name="customerId" value="${loginCustomer.customerId}">
        </form>
        
    </section>
    <!-- Shopping Cart Section End -->

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