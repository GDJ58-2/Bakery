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
<script>
	$(document).ready(function(){
		$('#rowPerPage').change(function(){
			$('#searchForm').submit();
		});
		$('#submitBtn').click(function(){
			$('#searchForm').submit();
		});
		$('.removeNotice').click(function(){
			let result = confirm('삭제하시겠습니까?');
			if(result) {
				return true;
			} else {
				return false;
			}
		});
	});
</script>
<title>공지사항 | 구디쥬르</title>
</head>
<body>
	<div class="wrap">
		<!-- header -->
		<c:import url="/WEB-INF/view/inc/header.jsp"></c:import>
		
		<!-- breadcrumb -->
		<div class="breadcrumb-option">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="breadcrumb__text">
							<h2>공지사항</h2>
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
		
		<!-- notice section -->
		<section class="blog-details spad">
			<div class="content">
			
				<div class="row d-flex justify-content-center">
					<div class="col-lg-12">
					
						<div class="card">
							<div class="card-header">
								<div class="p-4">
									<div class="row">
										<div class="searchForm">
											<form action="${pageContext.request.contextPath}/notice/noticeList" id="searchForm">
												<!-- 검색창 -->
												<input type="text" name="search" value="${search}" id="search" placeholder="제목 검색">
												<button type="button" id="submitBtn" class="searchBtn">검색</button>
												<!-- 페이지당 보여질 공지 개수 -->
												<select name="rowPerPage" id="rowPerPage">
													<c:forEach var="i" begin="10" end="30" step="10">
														<c:if test="${rowPerPage eq i}">
															<option value="${i}" selected="selected">${i}</option>
														</c:if>
														<c:if test="${rowPerPage ne i}">
															<option value="${i}">${i}</option>
														</c:if>
													</c:forEach>
												</select>
											</form>
										</div>
									</div>
								</div>
							</div>
							
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
											<th>번호</th>
											<th>제목</th>
											<th>등록일</th>
											<!-- emp 기능 -->
											<c:if test="${loginEmp ne null}">
												<th>작성자</th>
												<th>&nbsp;</th>
											</c:if>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="n" items="${noticeList}">
											<tr>
												<td>${n.rownum}</td>
												<td class="text-left title"><a href="${pageContext.request.contextPath}/notice/noticeOne?no=${n.rownum}&search=${search}">${n.noticeTitle}</a></td>
												<td>${n.createdate}</td>
												<!-- emp 기능 -->
												<c:if test="${loginEmp ne null}">
													<td>${n.empId}</td>
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
												</c:if>
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