<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>questionList.jsp</title>
</head>
<body>
	<h1>questionList</h1>
	<a href="${pageContext.request.contextPath}/question/addQuestion">추가</a>
	<table border="1">
		<thead>
			<tr>
				<th>문의번호</th>
				<th>문의종류</th>
				<th>등록일</th>
				<th>수정/삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="q" items="${list}">
				<tr>
					<td>
						<a href="${pageContext.request.contextPath}/question/questionOne?questionCode=${q.questionCode}">
							${q.questionCode}
						</a>
					</td>
					<td>${q.category}</td>
					<td>${q.createdate}</td>
					<td>
						<a href="${pageContext.request.contextPath}/question/modifyQuestion?questionCode=${q.questionCode}">수정</a>
						<a href="${pageContext.request.contextPath}/question/removeQuestion?questionCode=${q.questionCode}">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>