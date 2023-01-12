<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- Core JSTL 사용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../../inc/empMenu.jsp"></jsp:include>
	<jsp:include page="../../inc/menu.jsp"></jsp:include>
	<h1>관리자-고객관리</h1>
	
	<!-- 검색창 -->
	<form action="${pageContext.request.contextPath}/admin/customer/customerList">
		<input type="text" name="search" value="${search}">
		<button type="submit">검색</button>
		<select name="rowPerPage">
			<option value=10>10</option>
			<option value=20>20</option>
			<option value=30>30</option>
		</select>
	</form>
	<table border="1">
		<thead>
			<tr>
				<th>#</th>
				<th>아이디</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>보유포인트</th>
				<th>가입일</th>
				<th>&nbsp;</th>
			</tr>
		</thead>
		<c:forEach var="c" items="${customerList}">
			<tr>
				<td>${c.customerCode}</td>
				<td>${c.customerId}</td>
				<td>${c.customerName}</td>
				<td>${c.customerPhone}</td>
				<td>${c.point}</td>
				<td>${c.createdate}</td>
				<td><a href="${pageContext.request.contextPath}/admin/customer/removeCustomer?customerId=${c.customerId}">탈퇴</a></td>
			</tr>
		</c:forEach>
	</table>
	<a href="${pageContext.request.contextPath}/notice/noticeList?currentPage=${currentPage-1}&rowPerPage=${rowPerPage}&search=${search}">이전</a>
	<a href="${pageContext.request.contextPath}/notice/noticeList?currentPage=${currentPage+1}&rowPerPage=${rowPerPage}&search=${search}">다음</a>
</body>
</html>