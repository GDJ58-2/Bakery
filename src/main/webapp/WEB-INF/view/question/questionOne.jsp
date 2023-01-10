<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>questionOne.jsp</title>
</head>
<body>
	<h1>문의 상세정보</h1>
	<br>
	<div style="color:red;">
	${msg}
	</div>
	<table border="1">
		<tr>
			<th>문의 번호 : </th>
			<td>
				${question.questionCode}
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
	</table>
	<div>
		<a href="${pageContext.request.contextPath}/question/modifyQuestion?questionCode=${question.questionCode}">수정</a>
		<a href="${pageContext.request.contextPath}/question/removeQuestion?questionCode=${question.questionCode}">삭제</a>
	</div>
</body>
</html>