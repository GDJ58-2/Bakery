<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- core JSTL 사용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>noticeList</h1>
	<a href="${pageContext.request.contextPath}/notice/addNotice">추가</a>
	<table border="1">
		<thead>
			<tr>
				<th>제목</th>
				<th>내용</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>수정</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="n" items="${noticeList}">
				<tr>
					<td>${n.noticeTitle}</td>
					<td>${n.noticeContent}</td>
					<td>${n.empId}</td>
					<td>${n.createdate}</td>
					<td><a href="${pageContext.request.contextPath}/notice/modifyNotice">수정</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>