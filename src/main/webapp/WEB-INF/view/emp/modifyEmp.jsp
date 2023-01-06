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
	<h1>수정</h1>
	<form action="${pageContext.request.contextPath}/emp/modifyEmp" method="post">
		<input type="hidden" name="empId" value="${e.empId}">
		<input type="hidden" name="empCode" value="${e.empCode}">
		<table border="1">
			<thead>
				<tr>
					<th>#</th>
					<th>ID</th>
					<th>이름</th>
					<th>활성화</th>
					<th>권한</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${e.empCode}</td>
					<td>${e.empId}</td>
					<td>${e.empName}</td>
					<td>
						<input type="radio" name="active" value="Y">Y
						<input type="radio" name="active" value="N">N
					</td>
					<td>
						<select name="authCode">
							<c:forEach var="a" items="${authInfoList}">
								<option value="${a.authCode}">${a.authCode} ${a.authMemo}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
			</tbody>
		</table>
		<div><button type="submit">변경</button></div>
	</form>
</body>
</html>