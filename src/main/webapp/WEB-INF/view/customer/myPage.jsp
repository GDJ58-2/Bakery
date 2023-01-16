<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>My Page</h2>
	<table>
		<tr>
			<td>ID</td>
			<td>${selectOneCustomer.customerId}</td>
		</tr>
		<tr>
			<td>Name</td>
			<td>${selectOneCustomer.customerName}</td>
		</tr>
		<tr>
			<td>Phone Number</td>
			<td>${selectOneCustomer.customerPhone}</td>
		</tr>
		<tr>
			<td>Point</td>
			<td>${selectOneCustomer.point}</td>
		</tr>
	</table>
	<div>
		<a href = "${pageContext.request.contextPath}/review/reviewList">
			내 리뷰 관리
		</a>
		
		<a href = "${pageContext.request.contextPath}/question/questionList">
			내 문의내역
		</a>
		
		<a href = "${pageContext.request.contextPath}/customerAddress/customerAddressList">
			내 주소 관리
		</a>
	</div>
	<a href = "${pageContext.request.contextPath}/customer/modifyCustomer">
		<button type = "button" id = modifyBtn>회원정보수정</button> 
	</a>
	<a href = "${pageContext.request.contextPath}/customer/modifyCustomerPw">
		<button type = "button" id = modifyPwBtn>비밀번호수정</button> 
	</a>
	<a href = "${pageContext.request.contextPath}/customer/removeCustomer">
		<button type = "button" id = removeBtn>회원탈퇴</button> 
	</a>
	
	<div>
		<a href = "${pageContext.request.contextPath}/customer/home">
			home
		</a>
	</div>
</body>
</html>