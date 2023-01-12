<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../inc/customer.jsp"></jsp:include>
	<jsp:include page="../inc/menu.jsp"></jsp:include>
	<h2>ReviewList</h2>
	
	<div>내가 쓴 리뷰</div>
	<table>
		<c:forEach var = "n" items = "${reviewList}" varStatus = "i">
			<tr>
				<td>${n.orderCode}</td>
				<td>${n.goodsName}</td>
				<td>${n.reviewMemo}</td>
				<td>
					<a href = "${pageContext.request.contextPath}/review/modifyReview?orderCode=${n.orderCode}">
						수정하기
					</a>
				</td>
				<td>
					<a href = "${pageContext.request.contextPath}/review/removeReview?orderCode=${n.orderCode}">
						삭제하기
					</a>
				</td>
			</tr>	
		</c:forEach>
	</table>
	
	<div>리뷰 작성하기</div>
	<table>
		<c:forEach var = "nr" items = "${noReviewList}" varStatus = "i">
			<tr>
				<td>${nr.orderCode}</td>
				<td>${nr.goodsName}</td>
				<td>
					<a href = "${pageContext.request.contextPath}/review/addReview?orderCode=${nr.orderCode}">
						리뷰쓰기
					</a>
				</td>
			</tr>	
		</c:forEach>
	</table>
	<div>
		<a href = "${pageContext.request.contextPath}/customer/home">
			home
		</a>
	</div>
</body>
</html>