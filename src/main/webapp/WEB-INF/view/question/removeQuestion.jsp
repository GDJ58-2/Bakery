<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>removeQuestion.jsp</title>
</head>
<body>
	<h1>문의 삭제</h1>
	<br>
	<div style="color:red;">
	${msg}
	</div>
	<form action="${pageContext.request.contextPath}/question/removeQuestion" method="post">
		<table border="1">
			<tr>
				<th>문의 번호 : </th>
				<td>
					${question.questionCode}
					<input type="hidden" name="questionCode" value="${question.questionCode}">
				</td>
			</tr>
			<tr>
				<th>주문 번호 : </th>
				<td>
					${question.orderCode}
				</td>
			</tr>
			<tr>
				<th>문의 종류 : </th>
				<td>
					${question.category}
				</td>
			</tr>
			<tr>
				<th>문의 메모 : </th>
				<td>
					${question.questionMemo}
				</td>
			</tr>
			<tr>
				<th>문의 날짜 : </th>
				<td>
					${question.createdate}
				</td>
			</tr>
			<tr>
				<th>비밀번호 입력 : </th>
				<td>
					<input type="password" name="customerPw">
				</td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>