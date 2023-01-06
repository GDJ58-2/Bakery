<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- core JSTL 사용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>empList</title>
</head>
<body>
	<jsp:include page="../inc/empMenu.jsp"></jsp:include>
	<h1>직원 목록</h1>
	<a href="${pageContext.request.contextPath}/emp/addEmp">추가</a>
	<table border="1">
		<thead>
			<tr>
				<th>#</th>
				<th>ID</th>
				<th>이름</th>
				<th>활성화</th>
				<th>권한</th>
				<th>등록일</th>
				<th>수정</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="e" items="${empList}">
				<tr>
					<td>${e.empCode}</td>
					<td>${e.empId}</td>
					<td>${e.empName}</td>
					<td>${e.active}</td>
					<td>${e.authCode}</td>
					<td>${e.createdate}</td>
					<td><a href="${pageContext.request.contextPath}/emp/modifyEmp?empCode=${e.empCode}">수정</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>