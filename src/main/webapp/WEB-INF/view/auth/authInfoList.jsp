<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- core JSTL 사용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../inc/empMenu.jsp"></jsp:include>
	<h1>권한 목록</h1>
	<a href="${pageContext.request.contextPath}/auth/addAuthInfo">추가</a>
	<table border="1">
		<thead>
			<tr>
				<th>#</th>
				<th>memo</th>
				<th>등록일</th>
				<th>수정/삭제</th>
			</tr>
		</thead>
		<c:forEach var="a" items="${authInfoList}">
			<tr>
				<td>${a.authCode}</td>
				<td>${a.authMemo}</td>
				<td>${a.createdate}</td>
				<td>
					<a href="${pageContext.request.contextPath}/auth/modifyAuthInfo?authCode=${a.authCode}">수정</a>
					<a href="${pageContext.request.contextPath}/auth/removeAuthInfo?authCode=${a.authCode}">삭제</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>