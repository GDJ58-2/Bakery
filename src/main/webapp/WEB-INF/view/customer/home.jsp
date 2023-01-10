<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		${loginCustomer.customerName}님 반갑습니다
	</div>
	<!-- 회원정보조회 -->
	<div>
		<a href = "${pageContext.request.contextPath}/customer/selectOneCustomer">
			<button type = "button" id = "selectBtn">회원정보</button>
		</a>
	</div>
	<div>
		<a href = "${pageContext.request.contextPath}/question/questionList">
			<button type = "button" id = "selectBtn">내 문의내역</button>
		</a>
	</div>
	<!-- 로그아웃 -->
	<div>
		<a href = "${pageContext.request.contextPath}/customer/logout">
			<button type = "button" id = "logoutBtn">logout</button>
		</a>
	</div>
</body>
</html>