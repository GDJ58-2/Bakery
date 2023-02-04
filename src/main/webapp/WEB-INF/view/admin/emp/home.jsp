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
<title>홈 | 직원 | 구디쥬르</title>
	<script>
		let empUrl='${pageContext.request.contextPath}/admin/emp/logout'
		function logoutAction(empUrl) {
 			let out = confirm('로그아웃하시겠습니까?'); 
 		 	if(out) {
      			location.replace(empUrl); 
          		alert('로그아웃되었습니다');
	       	} else {
	          	alert('로그아웃 취소');
	          	return false;
	       	}
		 }  
	   $(document).ready(function() {
	   		$('#logoutEmpBtn').click(function() {
	   			logoutAction(empUrl);
	   		});
	   });
	</script>


</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
	
	<!-- 메뉴 - 상품관리, 주문배송, 고객관리, 문의/후기 관리, 정산, 기타 -->
	
	<!-- 판매 진행 결제건, 배송건 ... -->
	<!-- Q&A, 클레임 관리 취소건, 환불건, 교환건, 응답해야할 Q&A건 -->
	
	
	<!-- 공지사항 3~5개 -->
	
	
	
	<div>
		<a href="${pageContext.request.contextPath}/admin/emp/modifyEmpPw">비밀번호 변경</a>
	</div>
	
	
	
	<!-- footer -->
	<div>
		<c:import url="/WEB-INF/view/inc/footer.jsp"></c:import>
	</div>
	
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