<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- core JSTL 사용 -->
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
    <!-- custom css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/custom/customStyle.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<title>문의 관리 | 직원 | 구디쥬르</title>
</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
	
	<div class="wrap">
		
		<!-- breadcrumb -->
		<div class="breadcrumb-option">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="breadcrumb__text">
							<h2>문의</h2>
						</div>
					</div>	
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="breadcrumb__links">
							<a href="">Home</a>
							<span>목록</span>
						</div>
					</div> 	
				</div>
			</div>
		</div>
		<!-- /breadcrumb -->
		
		<!-- question list section -->
		<section class="blog-details spad">
			<div class="content">
			
				<div class="row d-flex justify-content-center">
					<div class="col-lg-12">
					
						<div class="card">
							
							<div class="card-body">
								<c:if test="${loginEmp ne null}">
									<div class="a-btn mb-1-4">
										<!-- emp 기능 -->
										<a href="${pageContext.request.contextPath}/admin/notice/addNotice">추가</a>
									</div>
								</c:if>
								<!-- noticeList -->
								<table class="table text-center">
									<thead class="table-primary">
										<tr>
											<th>주문 번호</th>
											<th>제목</th>
											<th>카테고리</th>
											<th>등록일</th>
											<th>작성자</th>
											<th>&nbsp;</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="q" items="${list}">
											<tr>
												<td>${q.orderCode}</td>
												<td class="text-left title">
													<a class="btn dark-btn" href="${pageContext.request.contextPath}/question/questionOne?questionCode=${q.questionCode}">
													${q.questionMemo}
													</a>
												</td>
												<td>${q.category}</td>
												<td>${q.createdate}</td>
												<td>${q.customerId}</td>
												<td>
													<div class="row justify-content-center">
														<div class="a-btn">
															<!-- emp 기능 -->
															<a href="${pageContext.request.contextPath}/admin/notice/modifyNotice?no=${n.rownum}&search=${search}">수정</a>
														</div>
														<div class="a-btn">
															<!-- emp 기능 -->
															<a href="${pageContext.request.contextPath}/admin/notice/removeNotice?noticeCode=${n.noticeCode}" class="removeNotice">삭제</a>
														</div>
													</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								
								<!-- 페이징 -->
								<div class="shop__last__option">
									<div class="row justify-content-center">
										<div class="shop__pagination">
											<a href="${pageContext.request.contextPath}/notice/noticeList?currentPage=${startPage-1}&rowPerPage=${rowPerPage}&search=${search}"><span class="arrow_carrot-left"></span></a>
											<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
												<c:if test="${currentPage eq i}">
													<a class="active" href="${pageContext.request.contextPath}/notice/noticeList?currentPage=${i}&rowPerPage=${rowPerPage}&search=${search}">${i}</a>
												</c:if>
												<c:if test="${currentPage ne i}">
													<a href="${pageContext.request.contextPath}/notice/noticeList?currentPage=${i}&rowPerPage=${rowPerPage}&search=${search}">${i}</a>
												</c:if>
											</c:forEach>
											<a href="${pageContext.request.contextPath}/notice/noticeList?currentPage=${endPage+1}&rowPerPage=${rowPerPage}&search=${search}"><span class="arrow_carrot-right"></span></a>
										</div>
									</div>
								</div>
								<!-- /페이징 -->
								
							</div>
						</div>
						<!-- /card -->
					</div>
				</div>
				
			</div>
		</section>
		
	</div>
	
	<!-- footer -->
	<div>
		<c:import url="/WEB-INF/view/inc/footer.jsp"></c:import>
	</div>
	
		
		
</body>
</html>