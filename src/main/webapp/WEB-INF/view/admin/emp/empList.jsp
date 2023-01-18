<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- core JSTL 사용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#submitBtn').click(function(){
			$('#searchForm').submit();
		});
	});
</script>
<title>empList</title>
</head>
<body>
	<jsp:include page="../../inc/empMenu.jsp"></jsp:include>
	<jsp:include page="../../inc/menu.jsp"></jsp:include>
	<h1>직원 목록</h1>
	<a href="${pageContext.request.contextPath}/admin/emp/addEmp">추가</a>
	
	<!-- 검색창 -->
	<form action="${pageContext.request.contextPath}/admin/emp/empList" id="searchForm">
		<input type="text" name="search" value="${search}" id="search">
		<button type="submit" id="submitBtn">검색</button>
	</form>
	
	<!-- empList 출력 -->
	<table border="1">
		<thead>
			<tr>
				<th>#</th>
				<th>ID</th>
				<th>이름</th>
				<th>활성화</th>
				<th>권한</th>
				<th>등록일</th>
				<th>권한 수정</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="e" items="${empList}">
				<tr>
					<td>${e.empCode}</td>
					<td>${e.empId}</td>
					<td>${e.empName}</td>
					<td>${e.active}</td>
					<td>${e.authCode} ${e.authMemo}</td>
					<td>${e.createdate}</td>
					<td><a href="${pageContext.request.contextPath}/admin/emp/modifyEmp?empCode=${e.empCode}">수정</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 페이징 -->
	<a href="${pageContext.request.contextPath}/admin/emp/empList?currentPage=${currentPage-1}&rowPerPage=${rowPerPage}&search=${search}">이전</a>
	<a href="${pageContext.request.contextPath}/admin/emp/empList?currentPage=${currentPage+1}&rowPerPage=${rowPerPage}&search=${search}">다음</a>
</body>
</html>