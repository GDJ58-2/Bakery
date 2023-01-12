<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyQuestion.jsp</title>
</head>
<body>
	<jsp:include page="../inc/menu.jsp"></jsp:include>
	<h1>문의 수정</h1>
	<br>
	<div style="color:red;">
	${msg}
	</div>
	<form action="${pageContext.request.contextPath}/question/modifyQuestion" method="post">
		<table border="1">
			<tr>
				<th>문의 번호 : </th>
				<td>
					<input type="number" name="questionCode" value="${question.questionCode}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>주문 번호 : </th>
				<td>
					<input type="number" name="orderCode" value="${question.orderCode}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>문의 종류 : </th>
				<td>
					<select name="category">
						<option>${question.category}</option>
						<!-- 추후 중복 제거 예정 -->
						<option>배송</option>
						<option>반품</option>
						<option>교환</option>
						<option>기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>문의 메모 : </th>
				<td>
					<textarea name="questionMemo">${question.questionMemo}</textarea>
				</td>
			</tr>
			<tr>
				<th>문의 날짜 : </th>
				<td>
					<input type="text" name="createdate" value="${question.createdate}" readonly="readonly">
				</td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>