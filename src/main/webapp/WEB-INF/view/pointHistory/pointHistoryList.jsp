<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pointHistoryList.jsp</title>
</head>
<body>
<h1>나의 포인트 내역</h1>
	<table border="1">
		<tr>
			<th>주문 번호</th>
			<th>포인트 종류</th>
			<th>포인트</th>
			<th>날짜</th>
		</tr>
		<c:forEach var="m" items="${list}">
			<tr>
				<td>
					${m.orderCode}
				</td>
				<td>
					${m.pointKind}
				</td>
				<td>
					${m.point}
				</td>
				<td>
					${m.createdate}
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>