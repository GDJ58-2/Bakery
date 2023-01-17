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
	<br>
	<!-- 페이징 -->
	<div>
		<a type="button" href="${pageContext.request.contextPath}/pointHistory/pointHistoryList?currentPage=1">처음</a>
			<c:if test="${currentPage > 1}">
				<a type="button" href="${pageContext.request.contextPath}/pointHistory/pointHistoryList?currentPage=${currentPage-1}">이전</a>
			</c:if>
			<span>${currentPage}</span>
			<c:if test="${currentPage < lastPage}">
				<a type="button" href="${pageContext.request.contextPath}/pointHistory/pointHistoryList?currentPage=${currentPage+1}">다음</a>
			</c:if>
		<a type="button" href="${pageContext.request.contextPath}/pointHistory/pointHistoryList?currentPage=${lastPage}">마지막</a>
	</div>
</body>
</html>